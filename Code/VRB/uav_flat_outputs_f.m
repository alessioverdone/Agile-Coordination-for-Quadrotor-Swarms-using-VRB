 function [drones_flat_outputs] = uav_flat_outputs_f(vrb_traj,n,formation)
%vrb_trajectories = [f1;f2;f3;f4;df1;df2;df3;df4;ddf1;ddf2;ddf3;ddf4;d3f1;d3f2;d3f3;d3f4;d4f1;d4f2;d4f3;d4f4];
syms t
final_time = vrb_traj(end);
Formation;
g = 9.81;
k1=1;
k2=1;
k3=1;
m=1;

switch formation
    case line
        r = line.r ;
    case square
        r = quad.r;
end
%Here compute Pv and Rv and their derivatives function of t
%Points
pv = vrb_traj(1:3);    %[xv, yv, zv]
dpv = vrb_traj(5:7);   %[Vxv, Vyv, Vzv]
ddpv = vrb_traj(9:11); %[Axv, Ayv, Azv]
d3pv = vrb_traj(13:15);%[Jxv, Jyv, Jzv]
d4pv = vrb_traj(17:19); %[Sxv, Syv, Szv]


%Yaw angles
yaw_v = vrb_traj(4);     %psi
dyaw_v = vrb_traj(8);    %dpsi
ddyaw_v = vrb_traj(12);  %ddpsi
d3yaw_v = vrb_traj(16);  %d3psi
d4yaw_V = vrb_traj(20);  %d4psi


%VRB angles
theta_v = ((ddpv(2) + ((k1/m)*dpv(2)))/(dpv(1) + ((k3/m)*dpv(1) + g)));
phi_v = -((dpv(3) + ((k2/m)*dpv(3)))/(dpv(1) + ((k3/m) + dpv(1) + g)));



%Rotation matrix VRB and its derivatives
Rv = rotate(phi_v,theta_v,yaw_v);%alfa,beta,gamma
O = [cos(theta)*cos(yaw_w)  -sin(yaw_v)   0 ;
     cos(theta)*sin(yaw_w)   cos(yaw_v)   0;
     -sin(theta)                     0    1];
dtheta_v = diff(theta_v,t);
ddtheta_v = diff(dtheta_v,t);
d3theta_v = diff(ddtheta_v,t);
d4theta_v = diff(d3theta_v,t);
dphi_v = diff(phi_v,t);
ddphi_v = diff(dphi_v,t);
d3phi_v = diff(ddphi_v,t);
d4phi_v = diff(d3phi_v,t);
dang = [dphi_v;dtheta_v;dyaw_v];
ddang = [ddphi_v;ddtheta_v;ddyaw_v];
d3ang = [d3phi_v;d3theta_v;d3yaw_v];
d4ang = [d4phi_v;d4theta_v;d4yaw_V];
omega_v = O*dang;
domega_v = O*ddang;
ddomega_v = O*d3ang;
d3omega_v = O*d4ang;
skew_omega=[0 -omega_v(3) omega_v(2) ; omega_v(3) 0 -omega_v(1) ; -omega_v(2) omega_v(1) 0 ];
skew_domega=[0 -domega_v(3) domega_v(2) ; domega_v(3) 0 -domega_v(1) ; -domega_v(2) domega_v(1) 0 ];
skew_ddomega=[0 -ddomega_v(3) ddomega_v(2) ; ddomega_v(3) 0 -ddomega_v(1) ; -ddomega_v(2) ddomega_v(1) 0 ];
skew_d3omega=[0 -d3omega_v(3) d3omega_v(2) ; d3omega_v(3) 0 -d3omega_v(1) ; -d3omega_v(2) d3omega_v(1) 0 ];
%Rot derivatives
dRv = skew_omega*Rv;
ddRv = skew_domega*dRv;
d3Rv = skew_ddomega*ddRv;
d4Rv = skew_d3omega*d3Rv;



%Here i create a matrix with flat outputs for every drone
drones_flat_outputs = zeros(n,15);%[pi,dpi,ddpi,d3pi,d4pi]
for i=1:n

%     pi = pv + Rv*ri;
%     dpi = dpv + dRv*ri;
%     ddpi = ddpv + ddRv*ri;
%     d3pi = d3pv + d3Rv*ri;
%     d4pi = d4pv + d4Rv*ri;
    drones_flat_outputs(n,1:3) = pv + Rv*r(:,i);%pi
    drones_flat_outputs(n,4:6) = dpv + dRv*r(:,i);%dpi
    drones_flat_outputs(n,7:9) = ddpv + ddRv*r(:,i);%ddpi
    drones_flat_outputs(n,10:12) = d3pv + d3Rv*r(:i);%d3pi
    drones_flat_outputs(n,13:15) = d4pv + d4Rv*r(i);%d4pi
end


















% time = 0:0.05:final_time;
% slot = size(time);
% slot = slot(2);
% keyframes = zeros(slot,12);
% for i=1:size(slot)
%     %Pv_x, Pv_y and Pv_z
%     f1_v = double(subs(f1,t,time(i)));
%     f2_v = double(subs(f2,t,time(i)));
%     f3_v = double(subs(f3,t,time(i)));
%     %dPv_x, dPv_y and dPv_z
%     %ddPv_x, ddPv_y and ddPv_z
%     %
    




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