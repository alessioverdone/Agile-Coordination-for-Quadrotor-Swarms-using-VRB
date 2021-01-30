function [V_f, new_integral, error]= formation_vector_field(r,rd,old_integral)
r = r(1:2);
rd = rd(1:2);

%Positive constant parameter
A = 4;

%Formation vector field
error = rd - r;
V_f = [A*error;0];

new_integral = 0;
%Integrator controller
%Ki = 0.5;
%dt = 0.05;
%new_integral = old_integral + error*dt;
%V_f = [A*error + Ki*new_integral ; 0];

end






% 
% 
% function V_f = formation_vector_field(r,rd)
% %Formation Vector Field to keep the UAVs in the assigned VRB formation
% r = r(1:2);
% rd = rd(1:2);
% 
% A = 2;	%Gain
% 
% %Formation vector field
% V_f = [A*(rd - r); 0];
% end
