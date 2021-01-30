clear
clear all
param;
%Desired position and angle
xd = [5; 5; -5];
b1d = [1; 0; 0];
sample_time = P.Ts;
starttime = 0;         % start of simulation in seconds
tstep     = 0.01;      % this determines the time step at which the solution is given
cstep     = 0.05;      % image capture time interval
nstep     = cstep/tstep;
time      = starttime; % current time
%Initial state
x = P.p0';
v = P.v0';
R = P.R0(:);
Omega = P.Omega0';

%STATE  = [x, y, z, vx, vy , vz , R1, R2, R3, R4, R5, R6, R7, R8, R9, Omegax, Omegay, Omegaz]
%INPUT  = [fz , ?x, ?y , ?z ]
finish = true;
state = [x;v;reshape(R,9,1);Omega];
iter = 0;
while finish
    iter = iter+1;
    %disp(iter)
    timeint = time:tstep:time+cstep;
    big_state = [xd;b1d;x;v;reshape(R,9,1);Omega;time];
    state = big_state(7:24);
    %Controller
    control_input = controller(big_state,P);
    %Dynamic model
    [tsave, xsave] = ode45(@(t,state) dynamic_model(state, control_input, P), timeint, state);
    %Update new state
    x_pass = xsave(end,:);
    x = x_pass(1:3)';
    v = x_pass(4:6)';
    R = reshape(x_pass(7:15),3,3);
    Omega = x_pass(16:18)';
    %Termiation codition ad time updating
    finish = termination_condition(xd,x(1:3));
    time = time+cstep;
end

function [value] = termination_condition(xd,x)
    if (norm(xd-x) < 0.01)
        value = false;
    else
        value = true;       
    end
end
