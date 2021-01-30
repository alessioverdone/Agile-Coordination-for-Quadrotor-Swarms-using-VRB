function J1 = precomputed_jacobian(obs_pos)

syms x y a1 a2 a3 a4
obs_pos = obs_pos(1:2,:);
m = size(obs_pos(1,:));
m = m(2);
Bk = 2000;%This is a matrix in reality, this value must be changed
inv_sigma_var = [a1 a2;
                 a3 a4];

V = [0;0];
for i=1:m
    M1 =[x - obs_pos(1,m);
         y - obs_pos(2,m)];
    scalar = Bk * exp(-(M1' * inv_sigma_var * M1));
    norma_vec = norm([x;y]-obs_pos(:,m));
    value_x  = scalar  * ((x - obs_pos(1,m))/norma_vec);
    value_y  = scalar  * ((y - obs_pos(2,m))/norma_vec);
    V_pass = [value_x; value_y]; 
    V = V + V_pass;
end

J1 = jacobian(V, [x y]);
J1 = [J1(1,1) J1(1,2) 0;
      J1(2,1) J1(2,2) 0;
      0       0       0];
%disp(size(J1))


