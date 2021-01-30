%% State computation
function state = state_input_computation_num(flat_output,old_state,delta)
%-flat_output: 1x21 (X,dX,ddX,d3X,d4X,tf)
%-state = [x; y; z; vx; vy; vz; psi; ?; ?; p; q; r; R1; R2; R3; R4; r5; R6; r7; R8; R9]T
%-input = [fz; ?x; ?y; ?z]T

g = 9.81;

%Compute old euler angles
old_R = reshape(old_state(13:21),3,3);
euler_ang = rotm2eul(old_R);
psi_old = euler_ang(1);
theta_old = euler_ang(2);
phi_old = euler_ang(3);

%State
state = zeros(21,1);
input = zeros(4,1);
f = flat_output(1:4);
df = flat_output(5:8);
ddf = flat_output(9:12);
d3f = flat_output(13:16);
d4f = flat_output(17:20);

state(1:3) = flat_output(1:3);
state(4:6) = flat_output(5:7);
state(7) = flat_output(4);

beta_a = -cos(f(4))*ddf(1) -sin(f(4))*ddf(2);
beta_b = -ddf(3)+ g;
beta_c = -sin(f(4))*ddf(1) + cos(f(4))*ddf(2);

state(8) = atan2(beta_a,beta_b);
theta = state(8);

state(9) = atan2(beta_c,sqrt(beta_a^2 + beta_b^2));
phi = state(9);

psi = f(4);

R = rotate(state(7),state(8),state(9));
Rt = R';

%Angular velocity
dpsi = (psi - psi_old)*delta;
dtheta = (theta - theta_old)*delta;
dphi = (phi - phi_old) * delta;

p = dphi*sin(theta)*sin(psi) + dtheta*cos(psi);
q = dphi*sin(theta)*cos(psi) - dtheta*sin(psi);
r = dphi*cos(theta) + dpsi;

state(10) = p;
state(11) = q;
state(12) = r;
state(13:21) = reshape(R,9,1);

end

%% Rotation function
function R=rotate(phi,theta,psi)
  %Rotation matrix
  R_roll = [...
          1, 0, 0;...
          0, cos(phi), -sin(phi);...
          0, sin(phi), cos(phi)];
  R_pitch = [...
          cos(theta), 0, sin(theta);...
          0, 1, 0;...
          -sin(theta), 0, cos(theta)];
  R_yaw = [...
          cos(psi), -sin(psi), 0;...
          sin(psi), cos(psi), 0;...
          0, 0, 1];
  R = R_yaw*R_pitch*R_roll;
  
end