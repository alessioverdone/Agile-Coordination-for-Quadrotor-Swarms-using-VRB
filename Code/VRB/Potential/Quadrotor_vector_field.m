function V_quad = Quadrotor_vector_field(ri,o, radii,formation)
%Repulsive Vector Field from the obstacles to the UAVs
%-       ri: Position of the ith UAV wrt the VRB
%-        o: Position of the obstacle wrt the VRB
%-    radii: Radii of the cylinder obstacles
%-formation: Formation assigned to the swarm

m = size(o,2);  %Number of obstacles
ri = ri(1:2);   %UAV position
o = o(1:2,:);   %Obstacles positions

%Quadrotor Vector Field
V_temp = zeros(2,1);
for i=1:m
    
    %Range of influence of the obstacle
    radius = radii(i);
    covariance = 1/(2*(radius^2));
    
    %Gain
    if formation == "line"
        Ck = radius*12;%12
    end
    
    if formation == "square"
        Ck = radius*3.5;
    end
    
    if formation == "M-shape"
        Ck = radius*3.5;
    end
    
    %Vector Field
    norm_dist = (ri - o(:,i))/norm(ri - o(:,i));
    fk = Ck*(exp(-(norm(ri - o(:,i))^2)*covariance));
    V = fk * norm_dist;
    V_temp = V_temp + V;
end

V_quad = [V_temp;0];