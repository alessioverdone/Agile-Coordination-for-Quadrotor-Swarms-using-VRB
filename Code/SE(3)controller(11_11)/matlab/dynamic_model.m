function xdot = dynamic_model(x,input,P)
    % Lee et al, Control of Complex Maneuvers for a Quadrotor UAV using
    % Geometric Methods on SE(3), 2011.
    % position in the inertial frame
    p       = x(1:3);
    % velocity in the inertial frame
    v       = x(4:6);
    % orientation of body {b1,b2,b3} wrt inertial frame {e1,e2,e3}
    R       = reshape(x(7:15), 3, 3);
    % angular velocities in the body-fixed frame
    Omega   = x(16:18);
    f  = input(1);
    M = input(2:4);
    % state derivative vector
    xdot = zeros(size(x));
    % inertia matrix
    J = diag([P.Jxx P.Jyy P.Jzz]);
    % Third axis of inertial frame
    e3 = [0;0;1];
    
    %Dynamic model computing
    % eq 2
    xdot(1:3) = v;%p_dot =v
    % eq 3
    xdot(4:6) = P.gravity*e3 - (1/P.mass)*f*R*e3;%v_dot = g +1/m*R*f
    % eq 4
    Rdot = R*hat(Omega);%R_dot = R*Omega
    xdot(7:15) = Rdot(:);
    % eq 5
    xdot(16:18) = J\(M - cross(Omega,J*Omega));%Omega_dot = J^-1*tau* - J^-1*Omega(skew)*J*Omega
end