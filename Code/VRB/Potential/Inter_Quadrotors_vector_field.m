function V_interquad = Inter_Quadrotors_vector_field(r,ri,k)
%Vector field to avoid imtercollisions among UAVs in the formation
%r:  positions of all UAVs relative to VRB (3xn)
%ri: position of the ith UAV in the formation

n = size(r(1,:),2);     %Number of UAVs in the formation
r_temp = [];
D = 5;                %Gain
dist = 0.55;%0.2            %Range of influence of the VF
ri = ri(1:2);
r = r(1:2,:);

for i=1:n
    if i == k
        continue
    end
    
    if norm(ri - r(:,i)) < dist
        r_temp = [r_temp r(:,i)];   %UAVs neighbours
    end
end

m = size(r_temp,2);     %Number of UAVs neighbours

s4 = 1;
V_temp=zeros(2,1);

for j=1:m
    norm_dist = ((ri - r_temp(:,j))/norm(ri - r_temp(:,j)));
    fk = D * exp(-(norm(ri - r_temp(:,j))^2)/(2 * s4^2));
    V_temp = V_temp + (fk * norm_dist);
end

V_interquad = [V_temp; 0];
