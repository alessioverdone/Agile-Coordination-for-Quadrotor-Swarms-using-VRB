function V_att = attractive_vector_field(pos,goal)
%Attractive vector field to the final position
ka = 10;    %Gain
V_att = ka * (goal - pos)/norm((goal - pos));

end