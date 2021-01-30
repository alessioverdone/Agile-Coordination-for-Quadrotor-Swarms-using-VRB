function [drones_flat_outputs] = uav_flat_outputs_t(vrb_traj,n,transformation)

%vrb_trajectories = [f1;f2;f3;f4;df1;df2;df3;df4;ddf1;ddf2;ddf3;ddf4;d3f1;d3f2;d3f3;d3f4;d4f1;d4f2;d4f3;d4f4];
syms t
final_time = vrb_traj(end);
Formation;
g = 9.81;
k1=1;
k2=1;
k3=1;
m=1;

switch transformation
    case line_to_quad
        r_vector = r_time2(line_quad);
    case quad_to_line
        r_vector = r_time2(quad_line);
end
final_time = r_vector(end);
%Rt vector
rt = r_vector(1:3);
drt = r_vector(4:6);
ddrt = r_vector(7:9);
d3rt = r_vector(10:12);
d4rt = r_vector(13:15);

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
%     pi = pv + Rv*rt;
%     dpi = dpv + dRv*rt + Rv*drt;
%     ddpi = ddpv + ddRv*rt + 2*dRv*drt + Rv*ddrt;
%     d3pi = d3pv + d3Rv*rt + 3*ddRv*drt + 3*dRv*ddrt + Rv*d3rt;
%     d4pi = d4pv + d4Rv*rt + 4*d3Rv*drt +6*ddRv*ddrt + 4*dRv*d3rt + Rv*d4rt;
    k = 15*(i-1);
    rt = r_vector(1+k:3+k);
    drt = r_vector(4+k:6+k);
    ddrt = r_vector(7+k:9+k);
    d3rt = r_vector(10+k:12+k);
    d4rt = r_vector(13+k:15+k);
    drones_flat_outputs(n,1:3) = pv + Rv*r(i);%pi
    drones_flat_outputs(n,4:6) = dpv + dRv*rt + Rv*drt;%dpi
    drones_flat_outputs(n,7:9) =  ddpv + ddRv*rt + 2*dRv*drt + Rv*ddrt;%ddpi
    drones_flat_outputs(n,10:12) =  d3pv + d3Rv*rt + 3*ddRv*drt + 3*dRv*ddrt + Rv*d3rt;%d3pi
    drones_flat_outputs(n,13:15) = d4pv + d4Rv*rt + 4*d3Rv*drt +6*ddRv*ddrt + 4*dRv*d3rt + Rv*d4rt;%d4pi
end



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