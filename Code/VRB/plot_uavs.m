function [] = plot_uavs(n,state,o,obs_pos)
%n # uavs
%state n x 3 vector 
%state(1:3) = x, y and z
%obs_pos o x 3 vector, position of cylider obstacles
syms t
hold on
rotate3d
xlabel('x [m]')
ylabel('y [m]')
zlabel('z [m]')
init_pose = [10,3,20,10];
final_pose = [20,30,10.01,20];

R=2;
% % Base at (2,0,1)
% x0=2;y0=0;z0=1;
% % Height = 10
% h=10;
% [x,y,z]=cylinder(R);
% x=x+x0;
% y=y+y0;
% z=z*h+z0;
% % to plot
% surf(x,y,z)

%Plot uavs
for i=1:n
    psi = state(7);
    theta = state(8);
    phi = state(9);
    plot3(state(n,1),state(n,2),state(n,3),'x')
end

%Plot reference trajectory
VRB_trajectory = VRB_traj(init_pose,final_pose);
vrb_1 = VRB_trajectory(1);
vrb_2 = VRB_trajectory(2);
vrb_3 = VRB_trajectory(3);
fplot3(vrb_1(t), vrb_2(t), vrb_3(t), [0,VRB_trajectory(end)],'b-')

%Plot obstacles
for j=1:o
    x0 = obs_pos(o,1);
    y0 = obs_pos(o,2);
    z0 = obs_pos(o,3);
    h=10;
    [x,y,z]=cylinder(R);
    x=x+x0;
    y=y+y0;
    z=z*h+z0;
    surf(x,y,z)
end
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
%Radius =2
R=2;
%Base at (2,0,1)
x0=2;y0=0;z0=1;
% Height = 10
h=10
[x,y,z]=cylinder(R)
x=x+x0;
y=y+y0;
z=z*h+z0;
% to plot
surf(x,y,z)