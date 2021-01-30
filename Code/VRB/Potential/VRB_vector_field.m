function [V_vrb, inv_sigma] = VRB_vector_field(vrb_pos,obs_pos)
%Repulsive Vector Field of the obstacles to the VRB (only on the horizontal
%coordinates)
%- vrb_pos: Position of the VRB
%- obs_pos: Positions of obstacles (4xm) [x,y,z,r]

%Considering only horizontal coordinate
vrb_pos = vrb_pos(1:2);
obs_p = obs_pos(1:2,:);
radii = obs_pos(4,:);

m = size(obs_pos,2);   %Number of obstacles

%Repulsive Vector Field
fk = ones(1,m);
V_vrb_temp=zeros(2,1);

for i=1:m
    %Covariance Matrix
    radius = radii(i);
    Bk = radius*2;    %Gain
    covariance = (1/(2*(radius^2)));
    inv_sigma = eye(2)*covariance;
    
    %Vector field
    fk(i) = Bk*exp(-(vrb_pos - obs_p(:,i))' * inv_sigma * (vrb_pos - obs_p(:,i)));
    norm_dist = (vrb_pos - obs_p(:,i))/norm(vrb_pos - obs_p(:,i));
    V_vrb_temp = V_vrb_temp + fk(i)*norm_dist;
end

V_vrb = [V_vrb_temp;0];
