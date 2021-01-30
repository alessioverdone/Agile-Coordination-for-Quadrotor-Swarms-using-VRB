function [r_line_quad,r_quad_line] = r_time2(transformation)
Formation;

r_line_quad=[];
r_quad_line=[];
switch transformation
    case line_quad
        couple=zeros(6,4);
        for i=1:4
            couple(1:3,i) = line.r(:,i);
            couple(4:6,i) = quad.r(:,i);
        end
        tf = 2.45;%Computed
        for i=1:4
            init_point = [couple(1:3,i);0]';
            final_point =[couple(4:6,i);0]';
            a_parameters = find_param(init_point,final_point);
            params = a_parameters;
            a1_0 = params(1);
            a1_1 = params(2);
            a1_2 = params(3);
            a1_3 = params(4);
            a1_4 = params(5);
            a1_5 = params(6);

            a2_0 = params(7);
            a2_1 = params(8);
            a2_2 = params(9);
            a2_3 = params(10);
            a2_4 = params(11);
            a2_5 = params(12);
            a2_6 = params(13);
            a2_7 = params(14);
            a2_8 = params(15);
            a2_9 = params(16);

            a3_0 = params(17);
            a3_1 = params(18);
            a3_2 = params(19);
            a3_3 = params(20);
            a3_4 = params(21);
            a3_5 = params(22);
            a3_6 = params(23);
            a3_7 = params(24);
            a3_8 = params(25);
            a3_9 = params(26);

            a4_0 = params(27);
            a4_1 = params(28);
            a4_2 = params(29);
            a4_3 = params(30);
            a4_4 = params(31);
            a4_5 = params(32);
            %Flat outputs ad their derivatives up to fourth order
            syms t tend
            F1 = a1_5*t^5 + a1_4*t^4 + a1_3*t^3 + a1_2*t^2 + a1_1*t + a1_0;
            F2 = a2_9*t^9 + a2_8*t^8 + a2_7*t^7 + a2_6*t^6 + a2_5*t^5 + a2_4*t^4 + a2_3*t^3 + a2_2*t^2 + a2_1*t + a2_0;
            F3 = a3_9*t^9 + a3_8*t^8 + a3_7*t^7 + a3_6*t^6 + a3_5*t^5 + a3_4*t^4 + a3_3*t^3 + a3_2*t^2 + a3_1*t + a3_0;
            F4 = a4_5*t^5 + a4_4*t^4 + a4_3*t^3 + a4_2*t^2 + a4_1*t + a4_0;
            dF1 = 5*a1_5*t^4 + 4*a1_4*t^3 + 3*a1_3*t^2 + 2*a1_2*t + a1_1;
            dF2 = 9*a2_9*t^8 + 8*a2_8*t^7 + 7*a2_7*t^6 + 6*a2_6*t^5 + 5*a2_5*t^4 + 4*a2_4*t^3 + 3*a2_3*t^2 + 2*a2_2*t + a2_1;
            dF3 = 9*a3_9*t^8 + 8*a3_8*t^7 + 7*a3_7*t^6 + 6*a3_6*t^5 + 5*a3_5*t^4 + 4*a3_4*t^3 + 3*a3_3*t^2 + 2*a3_2*t + a3_1;
            dF4 = 5*a4_5*t^4 + 4*a4_4*t^3 + 3*a4_3*t^2 + 2*a4_2*t + a4_1;
            ddF1 = 20*a1_5*t^3 + 12*a1_4*t^2 + 6*a1_3*t + 2*a1_2;
            ddF2 = 72*a2_9*t^7 + 56*a2_8*t^6 + 42*a2_7*t^5 + 30*a2_6*t^4 + 20*a2_5*t^3 + 12*a2_4*t^2 + 6*a2_3*t + 2*a2_2;
            ddF3 = 72*a3_9*t^7 + 56*a3_8*t^6 + 42*a3_7*t^5 + 30*a3_6*t^4 + 20*a3_5*t^3 + 12*a3_4*t^2 + 6*a3_3*t + 2*a3_2;
            ddF4 = 20*a4_5*t^3 + 12*a4_4*t^2 + 6*a4_3*t + 2*a4_2;
            d3F1 = 60*a1_5*t^2 + 24*a1_4*t + 6*a1_3;
            d3F2 = 504*a2_9*t^6 + 336*a2_8*t^5 + 210*a2_7*t^4 + 120*a2_6*t^3 + 60*a2_5*t^2 + 24*a2_4*t + 6*a2_3;
            d3F3 = 504*a3_9*t^6 + 336*a3_8*t^5 + 210*a3_7*t^4 + 120*a3_6*t^3 + 60*a3_5*t^2 + 24*a3_4*t + 6*a3_3;
            d3F4 = 60*a4_5*t^2 + 24*a4_4*t + 6*a4_3;
            d4F1 = 24*a1_4 + 120*a1_5*t;
            d4F2 = 3024*a2_9*t^5 + 1680*a2_8*t^4 + 840*a2_7*t^3 + 360*a2_6*t^2 + 120*a2_5*t + 24*a2_4;
            d4F3 = 3024*a3_9*t^5 + 1680*a3_8*t^4 + 840*a3_7*t^3 + 360*a3_6*t^2 + 120*a3_5*t + 24*a3_4;
            d4F4 = 24*a4_4 + 120*a4_5*t;

            f1 = subs(F1,tend,tf);
            f2 = subs(F2,tend,tf);
            f3 = subs(F3,tend,tf);
            f4 = subs(F4,tend,tf);
            df1 = subs(dF1,tend,tf);
            df2 = subs(dF2,tend,tf);
            df3 = subs(dF3,tend,tf);
            df4 = subs(dF4,tend,tf);
            ddf1 = subs(ddF1,tend,tf);
            ddf2 = subs(ddF2,tend,tf);
            ddf3 = subs(ddF3,tend,tf);
            ddf4 = subs(ddF4,tend,tf);
            d3f1 = subs(d3F1,tend,tf);
            d3f2 = subs(d3F2,tend,tf);
            d3f3 = subs(d3F3,tend,tf);
            d3f4 = subs(d3F4,tend,tf);
            d4f1 = subs(d4F1,tend,tf);
            d4f2 = subs(d4F2,tend,tf);
            d4f3 = subs(d4F3,tend,tf);
            d4f4 = subs(d4F4,tend,tf);
%             r_line_quad = [r_line_quad;f1;f2;f3;f4;df1;df2;df3;df4;ddf1;ddf2;ddf3;ddf4;d3f1;d3f2;d3f3;d3f4;d4f1;d4f2;d4f3;d4f4;tf];
            r_line_quad = [r_line_quad;f1;f2;f3;df1;df2;df3;ddf1;ddf2;ddf3;d3f1;d3f2;d3f3;d4f1;d4f2;d4f3;tf];

        end
        
    case quad_line
        
        couple=zeros(6,4);
        for i=1:4
            couple(1:3,i) = quad.r(:,i);
            couple(4:6,i) = line.r(:,i);
        end
        tf = 2.45;
        for i=1:4
            init_point = [couple(1:3,i);0]';
            final_point =[couple(4:6,i);0]';
            %Parameters
            %load('A_param.mat','parametri');
            a_parameters = find_param(init_point,final_point);
            params = a_parameters;
            a1_0 = params(1);
            a1_1 = params(2);
            a1_2 = params(3);
            a1_3 = params(4);
            a1_4 = params(5);
            a1_5 = params(6);

            a2_0 = params(7);
            a2_1 = params(8);
            a2_2 = params(9);
            a2_3 = params(10);
            a2_4 = params(11);
            a2_5 = params(12);
            a2_6 = params(13);
            a2_7 = params(14);
            a2_8 = params(15);
            a2_9 = params(16);

            a3_0 = params(17);
            a3_1 = params(18);
            a3_2 = params(19);
            a3_3 = params(20);
            a3_4 = params(21);
            a3_5 = params(22);
            a3_6 = params(23);
            a3_7 = params(24);
            a3_8 = params(25);
            a3_9 = params(26);

            a4_0 = params(27);
            a4_1 = params(28);
            a4_2 = params(29);
            a4_3 = params(30);
            a4_4 = params(31);
            a4_5 = params(32);

            %Flat outputs ad their derivatives up to fourth order
            syms t tend
            F1 = a1_5*t^5 + a1_4*t^4 + a1_3*t^3 + a1_2*t^2 + a1_1*t + a1_0;
            F2 = a2_9*t^9 + a2_8*t^8 + a2_7*t^7 + a2_6*t^6 + a2_5*t^5 + a2_4*t^4 + a2_3*t^3 + a2_2*t^2 + a2_1*t + a2_0;
            F3 = a3_9*t^9 + a3_8*t^8 + a3_7*t^7 + a3_6*t^6 + a3_5*t^5 + a3_4*t^4 + a3_3*t^3 + a3_2*t^2 + a3_1*t + a3_0;
            F4 = a4_5*t^5 + a4_4*t^4 + a4_3*t^3 + a4_2*t^2 + a4_1*t + a4_0;
            dF1 = 5*a1_5*t^4 + 4*a1_4*t^3 + 3*a1_3*t^2 + 2*a1_2*t + a1_1;
            dF2 = 9*a2_9*t^8 + 8*a2_8*t^7 + 7*a2_7*t^6 + 6*a2_6*t^5 + 5*a2_5*t^4 + 4*a2_4*t^3 + 3*a2_3*t^2 + 2*a2_2*t + a2_1;
            dF3 = 9*a3_9*t^8 + 8*a3_8*t^7 + 7*a3_7*t^6 + 6*a3_6*t^5 + 5*a3_5*t^4 + 4*a3_4*t^3 + 3*a3_3*t^2 + 2*a3_2*t + a3_1;
            dF4 = 5*a4_5*t^4 + 4*a4_4*t^3 + 3*a4_3*t^2 + 2*a4_2*t + a4_1;
            ddF1 = 20*a1_5*t^3 + 12*a1_4*t^2 + 6*a1_3*t + 2*a1_2;
            ddF2 = 72*a2_9*t^7 + 56*a2_8*t^6 + 42*a2_7*t^5 + 30*a2_6*t^4 + 20*a2_5*t^3 + 12*a2_4*t^2 + 6*a2_3*t + 2*a2_2;
            ddF3 = 72*a3_9*t^7 + 56*a3_8*t^6 + 42*a3_7*t^5 + 30*a3_6*t^4 + 20*a3_5*t^3 + 12*a3_4*t^2 + 6*a3_3*t + 2*a3_2;
            ddF4 = 20*a4_5*t^3 + 12*a4_4*t^2 + 6*a4_3*t + 2*a4_2;
            d3F1 = 60*a1_5*t^2 + 24*a1_4*t + 6*a1_3;
            d3F2 = 504*a2_9*t^6 + 336*a2_8*t^5 + 210*a2_7*t^4 + 120*a2_6*t^3 + 60*a2_5*t^2 + 24*a2_4*t + 6*a2_3;
            d3F3 = 504*a3_9*t^6 + 336*a3_8*t^5 + 210*a3_7*t^4 + 120*a3_6*t^3 + 60*a3_5*t^2 + 24*a3_4*t + 6*a3_3;
            d3F4 = 60*a4_5*t^2 + 24*a4_4*t + 6*a4_3;
            d4F1 = 24*a1_4 + 120*a1_5*t;
            d4F2 = 3024*a2_9*t^5 + 1680*a2_8*t^4 + 840*a2_7*t^3 + 360*a2_6*t^2 + 120*a2_5*t + 24*a2_4;
            d4F3 = 3024*a3_9*t^5 + 1680*a3_8*t^4 + 840*a3_7*t^3 + 360*a3_6*t^2 + 120*a3_5*t + 24*a3_4;
            d4F4 = 24*a4_4 + 120*a4_5*t;

            f1 = subs(F1,tend,tf);
            f2 = subs(F2,tend,tf);
            f3 = subs(F3,tend,tf);
            f4 = subs(F4,tend,tf);
            df1 = subs(dF1,tend,tf);
            df2 = subs(dF2,tend,tf);
            df3 = subs(dF3,tend,tf);
            df4 = subs(dF4,tend,tf);
            ddf1 = subs(ddF1,tend,tf);
            ddf2 = subs(ddF2,tend,tf);
            ddf3 = subs(ddF3,tend,tf);
            ddf4 = subs(ddF4,tend,tf);
            d3f1 = subs(d3F1,tend,tf);
            d3f2 = subs(d3F2,tend,tf);
            d3f3 = subs(d3F3,tend,tf);
            d3f4 = subs(d3F4,tend,tf);
            d4f1 = subs(d4F1,tend,tf);
            d4f2 = subs(d4F2,tend,tf);
            d4f3 = subs(d4F3,tend,tf);
            d4f4 = subs(d4F4,tend,tf);
%             r_quad_line = [r_quad_line;f1;f2;f3;f4;df1;df2;df3;df4;ddf1;ddf2;ddf3;ddf4;d3f1;d3f2;d3f3;d3f4;d4f1;d4f2;d4f3;d4f4;tf];
            r_line_quad = [r_line_quad;f1;f2;f3;df1;df2;df3;ddf1;ddf2;ddf3;d3f1;d3f2;d3f3;d4f1;d4f2;d4f3;tf];
        end
    
end