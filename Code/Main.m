close all

syms t x y z a1 a2 a3 a4 V(x) V(y) V(z)
addpath('VRB');
addpath('VRB/potential');
addpath('SE(3)controller(11_11)/matlab');

%% Settings

%Set the scenario you want to test:
%- Two obstacles: used for all tests
%- Six obstacles: specially made for 32-line test
%- Empty:         used to test transformation


scenario = 2;                    %Values: [0,2,6]
transformation = false;          %Only between line and square
change = 1;                      %Flag for transformation
VRB_orientation = true;

if scenario == 0
    
    transformation = true;  
    
    %VRB start and goal position
    start = [20.001;20.001;0.001];
    goal  = [120;20;0];

    %No obstacles
    obstacles = [];
    n_obs = size(obstacles,2);
end

if scenario == 2
    
    %VRB start and goal position
    start = [20.001;-20.001;0.001];
    goal  = [70;80;0];

    %Define cylinder obstacles [x,y,z,r]
    obs_pos1 = [35;17;0;15];
    obs_pos2 = [80;30;0;15];
    obstacles = [obs_pos1 obs_pos2];
    n_obs = size(obstacles,2);
end

if scenario == 6

    %VRB start and goal position
    start = [ 0.001; 42.001;0.001];
    goal  = [120;42;0];
    
    %Define cylinder obstacles [x,y,z,r]
    obs_pos1 = [35;12;0;15];
    obs_pos2 = [35;72;0;15];
    obs_pos3 = [70;22;0;10];
    obs_pos4 = [70;62;0;10];
    obs_pos5 = [90;30;0; 5];
    obs_pos6 = [90;54;0; 5];
    obstacles = [obs_pos1 obs_pos2 obs_pos3 obs_pos4 obs_pos5 obs_pos6];
    n_obs = size(obstacles,2);
end

%Number of UAVs:
%For "line" and "square" formations --> [4,8,16,32]
%For "M-shape" formation --> [5,12,30]  
n_uavs=4;       

%Formation: ["line", "square", "M-shape"]
formation = "line";
formation_pos_relative = set_formation(n_uavs, formation);
param;
trans = formation;

%Plot settings
simulation = true;

%% Initialization function
%  - VRB Initial position
%  - VRB Final position
%  - UAVs number(default 4)
%  - UAVs Initial Position

VRB_pos = start;
VRB_pos_old = start;

VRB_vel_old = [0.001;0.001;0.001];
VRB_vel = [0.1;0.1;0];

VRB_acc_old = zeros(3,1);
VRB_acc = zeros(3,1);

VRB_jerk = zeros(3,1);
VRB_jerk_old = zeros(3,1);

VRB_snap = zeros(3,1);
VRB_snap_old = zeros(3,1);

VRB_euler = zeros(3,1);
VRB_euler_old = zeros(3,1);

VRB_omega = zeros(3,1);
VRB_omega_old = zeros(3,1);

R_old = ones(3);

VRB_positions = [];

%UAVs initial position
[UAVs_pos, UAVs_r] = uavs_positions(VRB_pos, n_uavs, formation);

UAVs_vel = zeros(3,n_uavs);
UAVs_acc = zeros(3,n_uavs);
UAVs_jerk = zeros(3,n_uavs);
UAVs_snap = zeros(3,n_uavs);

UAVs_dr  = zeros(3,n_uavs);
UAVs_ddr = zeros(3,n_uavs);
UAVs_eul = zeros(3,n_uavs);
UAVs_omega = zeros(3,n_uavs);

R = ones(3);
int_matrix = zeros(2,n_uavs);
UAV_positions = [];
UAV_positions_temp = [];

%Vector Fields initialization
V1_tot = [];
V2_tot = [];
V3_tot = [];
Va_tot = [];
Vr_tot = [];

%% Compute VRB trajectory

%Controller time parameters
sample_time = P.Ts;
starttime = 0;              % Start of simulation [s]
tstep     = 0.001;          % Time step at which the solution is given
cstep     = 0.05;           % Image capture time interval
nstep     = cstep/tstep;
timec      = starttime;     % Current time
cost = 5;

%Time parameters
tic;
time = 0;
step = 0;
delta_time = 0.05;
iter = 0;
iterations = [];

finish = true;
x_position = [];

old_state = [VRB_pos;VRB_vel;VRB_euler;VRB_omega;reshape(R,9,1);timec];
uav_old_state = zeros(n_uavs,21);

for i=1:n_uavs
    uav_old_state(i,:) = [UAVs_pos(:,i)' UAVs_vel(:,i)' UAVs_eul(:,i)' UAVs_omega(:,i)' reshape(R,1,9)];
end

vettore_plot_vel = [];
VRB_positions2 = [];

actual_pos = VRB_pos;
actual_vel = VRB_vel;

errore_rd_uav = zeros(n_uavs,1);
errore_rd_uav_tot = [];

distance_to_obs = [];
distance_to_obs_tot = [];


while finish
    disp(['Iteration n. ',num2str(iter)]); 
    iterations = [iterations iter];
    
    %Update time and step
    time = time + 0.05;
        
    if scenario ~= 0
        %Compute VRB potential
        Va_VRB = attractive_vector_field(VRB_pos_old,goal);
        [Vr_VRB, sigma_temp] = VRB_vector_field(VRB_pos_old,obstacles);

        V_tot_VRB = Va_VRB +  Vr_VRB;
    end
    
    if scenario == 0
        Va_VRB = attractive_vector_field(VRB_pos_old,goal);
        V_tot_VRB = Va_VRB;
    end
        
    VRB_vel = V_tot_VRB;
    VRB_acc = VRB_vel * cost;
    VRB_jerk = VRB_acc * cost;
    VRB_snap = VRB_jerk * cost;
    VRB_pos = VRB_pos_old + delta_time * V_tot_VRB;

%     jac_subs2 = subs(Jac2, [x, y, z, V(x), V(y), V(z), a1, a2, a3, a4],[VRB_pos_old(1), VRB_pos_old(2), VRB_pos_old(3), VRB_vel(1), VRB_vel(2), VRB_vel(3), sigma_temp(1,1), sigma_temp(1,2), sigma_temp(2,1), sigma_temp(2,2)]);
%     VRB_acc = jac_subs1 * VRB_vel;
%     VRB_jerk = jac_subs2 * VRB_acc;
%     jac_subs3 = subs(Jac3, [x, y, z, V(x), V(y), V(z), a1, a2, a3, a4],[VRB_pos_old(1), VRB_pos_old(2), VRB_pos_old(3), VRB_vel(1), VRB_vel(2), VRB_vel(3), sigma_temp(1,1), sigma_temp(1,2), sigma_temp(2,1), sigma_temp(2,2)]);
%     VRB_snap = jac_subs3 * VRB_jerk;
     
    
    
    %Find states and inputs (endogenous transformation)   
     state = state_input_computation_num([VRB_pos;0;VRB_vel;0;VRB_acc;0;VRB_jerk;0;VRB_snap;0],old_state,delta_time);
 
     R = state(13:21);
     R_old = reshape(R,3,3);

    %Find xd and b1d
     xd_vrb = state(1:3);
     b1d = R_old(1:3,1);

    %Control setup
     big_state = [xd_vrb;b1d;VRB_pos_old;VRB_vel_old;reshape(R_old,9,1);VRB_omega_old;timec];
     old_big_state = big_state;
     iter = iter+1;
     timeint = timec:tstep:timec+cstep;
    
    %Controller
     control_input = controller(big_state,P);
     
    %Dynamic model
    [tsave, xsave] = ode45(@(t,state) dynamic_model(state, control_input, P), timeint, state);

    %Update new state
    x_pass = xsave(1,:);%(1,:)
    
    VRB_pos = x_pass(1:3)';
    VRB_vel = x_pass(4:6)';
    
    R = reshape(x_pass(7:15),3,3);
    
    VRB_omega = x_pass(16:18)';
    VRB_euler_old = rotm2eul(R)';
    
    VRB_vel_n = norm(VRB_vel);
    vettore_plot_vel = [vettore_plot_vel  VRB_vel_n];
    
    %Termiation codition ad time updating
    finish = termination_condition(VRB_pos,goal);
    timec = timec+cstep;
    
    %Formation follows VRB orientation
    
    if VRB_orientation == true
        VRB_angle = 0;

        if iter > 2
            point_k0 = VRB_pos_old;
            point_k1 = VRB_pos;
            m_coeff = (VRB_pos(2) - VRB_pos_old(2))/(VRB_pos(1) - VRB_pos_old(1));%tg of theta
%             VRB_angle = atan2(m_coeff)
            VRB_angle = atan2((VRB_pos(2) - VRB_pos_old(2)),(VRB_pos(1) - VRB_pos_old(1)));



        end
        
        R_uavs = [cos(VRB_angle)  -sin(VRB_angle);
                  sin(VRB_angle)   cos(VRB_angle)];
    end
    
    % UAVs Control System
     
    %Transformation
     if transformation == true
        if  trans =="line"
            if mod(iter,50)==0
                %disp("Transformation from 'line' to 'square'");
                trans = "square";
                formation_pos_relative = set_formation(n_uavs, trans);
                change = 1;
            end
        end
        
        if  (trans =="square") && (change == 0)
            if mod(iter,50)==0
                %disp("AHOOOOOOOOO");
                %disp("Transformation from 'square' to 'line'");
                trans = "line";
                formation_pos_relative = set_formation(n_uavs, trans);
            end
        end
     end 
     change = 0;
     

    
     for k=1:n_uavs
        
        
        
        UAV_pos_old = UAVs_pos(:,k);
        UAV_vel_old = UAVs_vel(:,k);
        UAV_omega_old = UAVs_omega(:,k);
        UAV_acc_old = UAVs_acc(:,k);
        UAV_jerk_old = UAVs_jerk(:,k);
        UAV_snap_old = UAVs_snap(:,k);
        
        ri_old = UAVs_r(:,k);
        rd = formation_pos_relative(:,k);

        
        if VRB_orientation == true
            rd = R_uavs * formation_pos_relative(1:2,k) ;
            rd = [rd;0];
        end
        
        %Vector fields
        %Formation vector field with P/PI controller
        integral_err = int_matrix(:,k);
        [V_1, int_err_post, actual_error] = formation_vector_field(ri_old,rd,integral_err);
        int_matrix(:,k) = int_err_post;
        errore_rd_uav(k,1) = norm(actual_error);
        
        V_2 = Inter_Quadrotors_vector_field(UAVs_r,ri_old,k);
        
        if scenario ~=0
            obs_v = obstacles(1:3,:) - VRB_pos;
            radii = obstacles(4,:);
            V_3 = Quadrotor_vector_field(ri_old,obs_v,radii,formation);

            V_tot_quad = V_1 + V_2 + V_3;
        end
        
        if scenario == 0
            V_tot_quad = V_1 + V_2;
        end
         
        %Vector field method and integration
        UAV_pos = UAV_pos_old + delta_time * V_tot_quad;
        UAV_vel = V_tot_quad;
        UAV_acc = V_tot_quad * cost;
        UAV_jerk = V_tot_quad * cost;
        UAV_snap = V_tot_quad * cost;
         
        %Endogenous Transformation
        state = state_input_computation_num([UAV_pos;0;UAV_vel;0;UAV_acc;0;UAV_jerk;0;UAV_snap;0],uav_old_state(k,:)',delta_time);
        R = state(13:21);
        R_old = reshape(R,3,3);

        %Find xd and b1d
        xd_uav = state(1:3);
        b1d = R_old(1:3,1);

        %Control setup
        big_state = [xd_uav;b1d;UAV_pos_old;UAV_vel_old;reshape(R_old,9,1);UAV_omega_old;timec];
        old_big_state = big_state;
        timeint = timec:tstep:timec+cstep;
 
        %Controller
        control_input = controller(big_state,P);
 
        %Dynamic model
        [tsave, xsave] = ode45(@(t,state) dynamic_model(state, control_input, P), timeint, state);
        
        %Update new state
        x_pass_uav = xsave(1,:);
        
        UAV_pos_real = x_pass_uav(1:3)';
        UAV_vel_real = x_pass_uav(4:6)';
       
        R_uav_real = reshape(x_pass_uav(7:15),3,3);
        
        UAV_omega_real = x_pass_uav(16:18)';
        UAVs_eul(:,k) = rotm2eul(R_uav_real)';
        UAVs_omega(:,k) = UAV_omega_real;
        
        UAVs_pos(:,k) = UAV_pos_real;
        UAVs_vel(:,k) = UAV_vel_real;
        
        ri_real = UAV_pos_real - VRB_pos;
        UAVs_r(:,k) = ri_real;
         
        uav_old_state_temp = [ UAVs_pos(:,k);  UAVs_vel(:,k);  UAVs_eul(:,k); UAV_omega_real; x_pass_uav(7:15)'];
        uav_old_state(k,:) = uav_old_state_temp';
        UAV_positions_temp = [UAV_positions_temp UAV_pos_real'];
        
        for j=1:n_obs
            dist = norm(UAV_pos_real(1:2)' - obstacles(1:2,j));
            distance_to_obs = [distance_to_obs dist];
        end
        
     end
    %Save UAVs error
    errore_rd_uav_tot = [errore_rd_uav_tot errore_rd_uav];
    %Save UAVs distances to obstacles
    distance_to_obs_tot = [distance_to_obs_tot distance_to_obs ];
    distance_to_obs = [];
    
    %Save UAV Vector Fields values
    V1 = mean(V_1,2);
    V2 = mean(V_2,2);
    
    V1n = norm(V1(1:2,:));
    V1_tot = [V1_tot V1n];
    V2n = norm(V2(1:2,:));
    V2_tot = [V2_tot V2n];
    
    if scenario ~=0
        V3 = mean(V_3,2);
        V3n = norm(V3(1:2,:));
        V3_tot = [V3_tot V3n];
    end
    
    %Save VRB Vector Fields values
    Va = norm(Va_VRB);
    Va_tot = [Va_tot Va];
    
    if scenario ~= 0
        Vr = norm(Vr_VRB);
        Vr_tot = [Vr_tot Vr];
    end
    
    UAV_positions(iter,:) = UAV_positions_temp;
    UAV_positions_temp = [];
    
    VRB_positions = [VRB_positions VRB_pos'];
    VRB_positions2 = [VRB_positions2 VRB_pos];
    
    %Debug
    if iter == 800
        finish = false;
    end
    
    VRB_pos_old = VRB_pos;
    VRB_vel_old = VRB_vel;
    VRB_omega_old = VRB_omega;
    
    old_state = [VRB_pos_old;VRB_vel_old;VRB_euler_old;VRB_omega_old;reshape(R,9,1)];
    
    timec = timec + cstep;
    
end

%% Plot
plot_environment(VRB_positions,UAV_positions,obstacles, n_uavs, simulation, start, goal);
iterations = iterations*0.05;
%Plot VRB velocity
% figure();
% plot(iterations,vettore_plot_vel)
% title('VRB velocity')

%Plot UAVs error
fig3 = figure('Name','UAVs_error');
xlabel('Time [s]')
ylabel('UAVs error [m]')
hold on;
plot(iterations,errore_rd_uav_tot);
title('Single UAVs error')

%Plot UAV Vector Fields V1 V2
fig4 = figure();
xlabel('Time [s]')
ylabel('Vector field [m/s]')
hold on;
plot(iterations,V1_tot);
hold on
plot(iterations,V2_tot);
hold on
title('UAV Vector Fields')
if n_obs ~= 0
    plot(iterations,V3_tot);


    %Plot VRB Vector Fields
    fig5 = figure();
    xlabel('Time [s]')
    ylabel('Vector field [m/s]')
    hold on;
    plot(iterations,Va_tot);   
    title('VRB Vector Fields')
    hold on
    plot(iterations,Vr_tot);
    saveas(fig5, '_VRB_Vector_Fields.png')


    %Plot UAVs distances to obstacles
    for i=1:n_obs
        list_temp = [];
        for j=0:(size(iterations,2)-1)
            row_of_dist = distance_to_obs_tot( 1+(n_uavs*n_obs)*j : (((n_uavs*n_obs)*j + (n_uavs*n_obs) )));%1x(n_uavs*n_obs)
            list_temp2 = [];
            for k=0:(n_uavs-1)
                list_temp2 = [list_temp2 row_of_dist(i + k*n_obs)];
            end
            list_temp = [list_temp list_temp2'];
        end

        fig6 = figure('Name','UAVs_distance_to_obstacle');
        xlabel('Time [s]')
        ylabel('Distance [m]')
        hold on;
        plot(iterations,list_temp);
        title1 = 'Distance to obstacle ';
        title2 = num2str(i);
        title3 = ' UAVs';
        title_final = strcat(title1,title2,title3);
        title(title_final)
        suffix_img = '.png';
        prefix = '_';
        title_img = strcat(prefix,title_final,suffix_img);
        saveas(fig6,title_img)
    end
end

saveas(fig3,'_UAVs_error.png')
saveas(fig4,'_UAV_Vector_Fields.png')









%% Termination condition
function [value] = termination_condition(x,goal)
    if (norm(goal-x) < 5)
        value = false;
    else
        value = true;       
    end
end

