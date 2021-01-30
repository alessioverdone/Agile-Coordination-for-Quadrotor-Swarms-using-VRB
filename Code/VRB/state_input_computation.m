function [state,input] = state_input_computation(flat_output)
%input vector "flat_output" 1-dim array of 21 elem (X,dX,ddX,d3X,d4X,tf)
%state = [x; y; z; vx; vy; vz; psi; ?; ?; p; q; r]T
%input = [fz; ?x; ?y; ?z]T
g = 9.81;

state = zeros(12);
input = zeros(4);
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

%theta
state(8) = atan2(beta_a,beta_b);
theta = state(8);
%phi
state(9) = atan2(beta_c,sqrt(beta_a^2 + beta_b^2));
phi = state(9);
psi = f(4);
R = rotate(state(7),state(8),state(9));
% Rt = R';
%Angular velocity
dphi = diff(state(9),t);
dtheta = diff(state(8),t);
dpsi = df(8);
p = dphi*sin(theta)*sin(psi) + dtheta*cos(psi);
q = dphi*sin(theta)*cos(psi) - dtheta*sin(psi);
r = dphi*cos(theta) + dpsi;

state(10) = p;
state(11) = q;
state(12) = r;
state(13) = R;

end











function R=rotate(phi,theta,psi)
  % define rotation matrix
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
  % rotate vertices
  %XYZ = R*XYZ;
end