function plot_environment(vrb, uav, obs, n_uavs, sim_mode, start, goal)
%vrb:    1x3*n (n = number of iterations)
%uav:    nx4*u (u = number of uavs)
%obs:    3xp   (p = number of obstacles)

%% Plot
axis([-40 120 -40 120])

% Plot VRB positions
s = size(vrb,2);
vrb2 = [];
cont = -2;

for i=1:s/3
    cont = cont + 3;
    vrb2(:,i) = [vrb(cont) vrb(cont+1) vrb(cont+2)];
end

fig1 = figure();
hold on
axis on
axis([-40 120 -40 120 0 100])
xlabel('X [m]')
ylabel('Y [m]')
zlabel('Z [m]')

for i=1:(s/3 -1) 
     plot3([vrb2(1,i),vrb2(1,i+1)],[vrb2(2,i),vrb2(2,i+1)],[vrb2(3,i),vrb2(3,i+1)],'b')
     title('Trajectories')
end

% Plot Obstacles
l = size(obs,2);

for i=1:l
    r = obs(4,i);
    [x,y,z] = cylinder(r);
    x = x + obs(1,i);
    y = y + obs(2,i);
    z = z + obs(3,i);
    z(2,:) = z(2,:)*60;
    surf(x,y,z);
    plot3(obs(1,i),obs(2,i),obs(3,i),'o')
    x = 0;
    y = 0;
    z = 0;
end

%Plot UAVs
iter = size(uav,1);
for i=1:iter-1
    
    if n_uavs == 4
        
        row = uav(i,:);
        row2 = uav(i+1,:);
%         if formation == "line"
%             
%             plot3([row(1),row(4)],[row(2),row(5)],[row(3),row(6)],'Color','b');
%             plot3([row(4),row(7)],[row(5),row(8)],[row(6),row(9)],'Color','b');
%             plot3([row(7),row(10)],[row(8),row(11)],[row(9),row(12)],'Color','b');
%             plot3([row(10),row(1)],[row(11),row(2)],[row(12),row(3)],'Color','b');
%         
%         end

%         circle(row(1),row(2),0.2,'r');
%         circle(row(4),row(5),0.2,'b');
%         circle(row(7),row(8),0.2,'g');
%         circle(row(10),row(11),0.2,'c');

        plot3([row(1),row2(1)],[row(2),row2(2)],[row(3),row2(3)],'r')
        plot3([row(4),row2(4)],[row(5),row2(5)],[row(6),row2(6)],'r')
        plot3([row(7),row2(7)],[row(8),row2(8)],[row(9),row2(9)],'r')
        plot3([row(10),row2(10)],[row(11),row2(11)],[row(12),row2(12)],'r')

        
    end
    
    if n_uavs == 5
        
        row = uav(i,:);
        row2 = uav(i+1,:);
        
%         if formation == "line"
%             
%             plot3([row(1),row(4)],[row(2),row(5)],[row(3),row(6)],'Color','b');
%             plot3([row(4),row(7)],[row(5),row(8)],[row(6),row(9)],'Color','b');
%             plot3([row(7),row(10)],[row(8),row(11)],[row(9),row(12)],'Color','b');
%             plot3([row(10),row(13)],[row(11),row(14)],[row(12),row(15)],'Color','b');
%             plot3([row(13),row(1)],[row(14),row(2)],[row(15),row(3)],'Color','b');
% 
%         end
        
%         circle(row(1),row(2),0.2,'r');
%         circle(row(4),row(5),0.2,'b');
%         circle(row(7),row(8),0.2,'g');
%         circle(row(10),row(11),0.2,'c');
%         circle(row(13),row(14),0.2,'y');

        plot3([row(1),row2(1)],[row(2),row2(2)],[row(3),row2(3)],'r')
        plot3([row(4),row2(4)],[row(5),row2(5)],[row(6),row2(6)],'r')
        plot3([row(7),row2(7)],[row(8),row2(8)],[row(9),row2(9)],'r')
        plot3([row(10),row2(10)],[row(11),row2(11)],[row(12),row2(12)],'r')
        plot3([row(13),row2(13)],[row(14),row2(14)],[row(15),row2(15)],'r')

        
    end
    
    if n_uavs == 8
        
        row = uav(i,:);
        row2 = uav(i+1,:);
        
%         if formation == "line"
%     
%             plot3([row(1),row(4)],[row(2),row(5)],[row(3),row(6)],'Color','b');
%             plot3([row(4),row(7)],[row(5),row(8)],[row(6),row(9)],'Color','b');
%             plot3([row(7),row(10)],[row(8),row(11)],[row(9),row(12)],'Color','b');
%             plot3([row(10),row(13)],[row(11),row(14)],[row(12),row(15)],'Color','b');
%             plot3([row(13),row(16)],[row(14),row(17)],[row(15),row(18)],'Color','b');
%             plot3([row(16),row(19)],[row(17),row(20)],[row(18),row(21)],'Color','b');
%             plot3([row(19),row(22)],[row(20),row(23)],[row(21),row(24)],'Color','b');
%             plot3([row(22),row(1)],[row(23),row(2)],[row(24),row(3)],'Color','b');
% 
%         end
        
%         circle(row(1),row(2),0.2,'r');
%         circle(row(4),row(5),0.2,'b');
%         circle(row(7),row(8),0.2,'g');
%         circle(row(10),row(11),0.2,'c');
%         circle(row(13),row(14),0.2,'y');
%         circle(row(16),row(17),0.2,'m');
%         circle(row(19),row(20),0.2,'k');
%         circle(row(22),row(23),0.2,'r');
        plot3([row(1),row2(1)],[row(2),row2(2)],[row(3),row2(3)],'r')
        plot3([row(4),row2(4)],[row(5),row2(5)],[row(6),row2(6)],'r')
        plot3([row(7),row2(7)],[row(8),row2(8)],[row(9),row2(9)],'r')
        plot3([row(10),row2(10)],[row(11),row2(11)],[row(12),row2(12)],'r')
        plot3([row(13),row2(13)],[row(14),row2(14)],[row(15),row2(15)],'r')
        plot3([row(16),row2(16)],[row(17),row2(17)],[row(18),row2(18)],'r')
        plot3([row(19),row2(19)],[row(20),row2(20)],[row(21),row2(21)],'r')
        plot3([row(22),row2(22)],[row(23),row2(23)],[row(24),row2(24)],'r')


        
    end
    
    if n_uavs == 12
        
        row = uav(i,:);
        row2 = uav(i+1,:);        
%         if formation == "line"
%             
%             plot3([row(1),row(4)],[row(2),row(5)],[row(3),row(6)],'Color','b');
%             plot3([row(4),row(7)],[row(5),row(8)],[row(6),row(9)],'Color','b');
%             plot3([row(7),row(10)],[row(8),row(11)],[row(9),row(12)],'Color','b');
%             plot3([row(10),row(13)],[row(11),row(14)],[row(12),row(15)],'Color','b');
%             plot3([row(13),row(16)],[row(14),row(17)],[row(15),row(18)],'Color','b');
%             plot3([row(16),row(19)],[row(17),row(20)],[row(18),row(21)],'Color','b');
%             plot3([row(19),row(22)],[row(20),row(23)],[row(21),row(24)],'Color','b');
%             plot3([row(22),row(25)],[row(23),row(26)],[row(24),row(27)],'Color','b');
%             plot3([row(25),row(28)],[row(26),row(29)],[row(27),row(30)],'Color','b');
%             plot3([row(28),row(31)],[row(29),row(32)],[row(30),row(33)],'Color','b');
%             plot3([row(31),row(34)],[row(32),row(35)],[row(33),row(36)],'Color','b');
%             plot3([row(34),row(1)],[row(35),row(2)],[row(36),row(3)],'Color','b');
%         
%         end
        
%         circle(row(1),row(2),0.2,'r');
%         circle(row(4),row(5),0.2,'b');
%         circle(row(7),row(8),0.2,'g');
%         circle(row(10),row(11),0.2,'c');
%         circle(row(13),row(14),0.2,'y');
%         circle(row(16),row(17),0.2,'m');
%         circle(row(19),row(20),0.2,'k');
%         circle(row(22),row(23),0.2,'r');
%         circle(row(25),row(26),0.2,'b');
%         circle(row(28),row(29),0.2,'g');
%         circle(row(31),row(32),0.2,'c');
%         circle(row(34),row(35),0.2,'y');

        plot3([row(1),row2(1)],[row(2),row2(2)],[row(3),row2(3)],'r')
        plot3([row(4),row2(4)],[row(5),row2(5)],[row(6),row2(6)],'r')
        plot3([row(7),row2(7)],[row(8),row2(8)],[row(9),row2(9)],'r')
        plot3([row(10),row2(10)],[row(11),row2(11)],[row(12),row2(12)],'r')
        plot3([row(13),row2(13)],[row(14),row2(14)],[row(15),row2(15)],'r')
        plot3([row(16),row2(16)],[row(17),row2(17)],[row(18),row2(18)],'r')
        plot3([row(19),row2(19)],[row(20),row2(20)],[row(21),row2(21)],'r')
        plot3([row(22),row2(22)],[row(23),row2(23)],[row(24),row2(24)],'r')
        plot3([row(25),row2(25)],[row(26),row2(26)],[row(27),row2(27)],'r')
        plot3([row(28),row2(28)],[row(29),row2(29)],[row(30),row2(30)],'r')
        plot3([row(31),row2(31)],[row(32),row2(32)],[row(33),row2(33)],'r')
        plot3([row(34),row2(34)],[row(35),row2(35)],[row(36),row2(36)],'r')
        
    end
    
    if n_uavs == 16
        
        row = uav(i,:);
        row2 = uav(i+1,:);        
%         if formation == "line"
%             
% %             plot3([row(1),row(4)],[row(2),row(5)],[row(3),row(6)],'Color','b');
% %             plot3([row(4),row(7)],[row(5),row(8)],[row(6),row(9)],'Color','b');
% %             plot3([row(7),row(10)],[row(8),row(11)],[row(9),row(12)],'Color','b');
% %             plot3([row(10),row(13)],[row(11),row(14)],[row(12),row(15)],'Color','b');
% %             plot3([row(13),row(16)],[row(14),row(17)],[row(15),row(18)],'Color','b');
% %             plot3([row(16),row(19)],[row(17),row(20)],[row(18),row(21)],'Color','b');
% %             plot3([row(19),row(22)],[row(20),row(23)],[row(21),row(24)],'Color','b');
% %             plot3([row(22),row(25)],[row(23),row(26)],[row(24),row(27)],'Color','b');
% %             plot3([row(25),row(28)],[row(26),row(29)],[row(27),row(30)],'Color','b');
% %             plot3([row(28),row(31)],[row(29),row(32)],[row(30),row(33)],'Color','b');
% %             plot3([row(31),row(34)],[row(32),row(35)],[row(33),row(36)],'Color','b');
% %             plot3([row(34),row(37)],[row(35),row(38)],[row(36),row(39)],'Color','b');
% %             plot3([row(37),row(40)],[row(38),row(41)],[row(39),row(42)],'Color','b');
% %             plot3([row(40),row(43)],[row(41),row(44)],[row(42),row(45)],'Color','b');
% %             plot3([row(43),row(46)],[row(44),row(47)],[row(45),row(48)],'Color','b');
% %             plot3([row(46),row(1)],[row(47),row(2)],[row(48),row(3)],'Color','b');
%         end
        
%         circle(row(1),row(2),0.2,'r');
%         circle(row(4),row(5),0.2,'b');
%         circle(row(7),row(8),0.2,'g');
%         circle(row(10),row(11),0.2,'c');
%         circle(row(13),row(14),0.2,'y');
%         circle(row(16),row(17),0.2,'m');
%         circle(row(19),row(20),0.2,'k');
%         circle(row(22),row(23),0.2,'r');
%         circle(row(25),row(26),0.2,'b');
%         circle(row(28),row(29),0.2,'g');
%         circle(row(31),row(32),0.2,'c');
%         circle(row(34),row(35),0.2,'y');
%         circle(row(37),row(38),0.2,'m');
%         circle(row(40),row(41),0.2,'k');
%         circle(row(43),row(44),0.2,'r');
%         circle(row(46),row(47),0.2,'b');

        plot3([row(1),row2(1)],[row(2),row2(2)],[row(3),row2(3)],'r')
        plot3([row(4),row2(4)],[row(5),row2(5)],[row(6),row2(6)],'r')
        plot3([row(7),row2(7)],[row(8),row2(8)],[row(9),row2(9)],'r')
        plot3([row(10),row2(10)],[row(11),row2(11)],[row(12),row2(12)],'r')
        plot3([row(13),row2(13)],[row(14),row2(14)],[row(15),row2(15)],'r')
        plot3([row(16),row2(16)],[row(17),row2(17)],[row(18),row2(18)],'r')
        plot3([row(19),row2(19)],[row(20),row2(20)],[row(21),row2(21)],'r')
        plot3([row(22),row2(22)],[row(23),row2(23)],[row(24),row2(24)],'r')
        plot3([row(25),row2(25)],[row(26),row2(26)],[row(27),row2(27)],'r')
        plot3([row(28),row2(28)],[row(29),row2(29)],[row(30),row2(30)],'r')
        plot3([row(31),row2(31)],[row(32),row2(32)],[row(33),row2(33)],'r')
        plot3([row(34),row2(34)],[row(35),row2(35)],[row(36),row2(36)],'r')
        plot3([row(37),row2(37)],[row(38),row2(38)],[row(39),row2(39)],'r')
        plot3([row(40),row2(40)],[row(41),row2(41)],[row(42),row2(42)],'r')
        plot3([row(43),row2(43)],[row(44),row2(44)],[row(45),row2(45)],'r')
        plot3([row(46),row2(46)],[row(47),row2(47)],[row(48),row2(48)],'r')
        
    end
    
    if n_uavs == 30
        
        row = uav(i,:);
        row2 = uav(i+1,:);        
%         if formation == "line"
%             
%             plot3([row(1),row(4)],[row(2),row(5)],[row(3),row(6)],'Color','b');
%             plot3([row(4),row(7)],[row(5),row(8)],[row(6),row(9)],'Color','b');
%             plot3([row(7),row(10)],[row(8),row(11)],[row(9),row(12)],'Color','b');
%             plot3([row(10),row(13)],[row(11),row(14)],[row(12),row(15)],'Color','b');
%             plot3([row(13),row(16)],[row(14),row(17)],[row(15),row(18)],'Color','b');
%             plot3([row(16),row(19)],[row(17),row(20)],[row(18),row(21)],'Color','b');
%             plot3([row(19),row(22)],[row(20),row(23)],[row(21),row(24)],'Color','b');
%             plot3([row(22),row(25)],[row(23),row(26)],[row(24),row(27)],'Color','b');
%             plot3([row(25),row(28)],[row(26),row(29)],[row(27),row(30)],'Color','b');
%             plot3([row(28),row(31)],[row(29),row(32)],[row(30),row(33)],'Color','b');
%             plot3([row(31),row(34)],[row(32),row(35)],[row(33),row(36)],'Color','b');
%             plot3([row(34),row(37)],[row(35),row(38)],[row(36),row(39)],'Color','b');
%             plot3([row(37),row(40)],[row(38),row(41)],[row(39),row(42)],'Color','b');
%             plot3([row(40),row(43)],[row(41),row(44)],[row(42),row(45)],'Color','b');
%             plot3([row(43),row(46)],[row(44),row(47)],[row(45),row(48)],'Color','b');
%             plot3([row(46),row(49)],[row(47),row(50)],[row(48),row(51)],'Color','b');
%             plot3([row(49),row(52)],[row(50),row(53)],[row(51),row(54)],'Color','b');
%             plot3([row(52),row(55)],[row(53),row(56)],[row(54),row(57)],'Color','b');
%             plot3([row(55),row(58)],[row(56),row(59)],[row(57),row(60)],'Color','b');
%             plot3([row(58),row(1)],[row(59),row(2)],[row(60),row(3)],'Color','b');
%         
%         end
        
%         circle(row(1),row(2),0.2,'r');
%         circle(row(4),row(5),0.2,'b');
%         circle(row(7),row(8),0.2,'g');
%         circle(row(10),row(11),0.2,'c');
%         circle(row(13),row(14),0.2,'y');
%         circle(row(16),row(17),0.2,'m');
%         circle(row(19),row(20),0.2,'k');
%         circle(row(22),row(23),0.2,'r');
%         circle(row(25),row(26),0.2,'b');
%         circle(row(28),row(29),0.2,'g');
%         circle(row(31),row(32),0.2,'c');
%         circle(row(34),row(35),0.2,'y');
%         circle(row(37),row(38),0.2,'m');
%         circle(row(40),row(41),0.2,'k');
%         circle(row(43),row(44),0.2,'r');
%         circle(row(46),row(47),0.2,'b');
%         circle(row(49),row(50),0.2,'g');
%         circle(row(52),row(53),0.2,'c');
%         circle(row(55),row(56),0.2,'y');
%         circle(row(58),row(59),0.2,'m');
%         circle(row(61),row(62),0.2,'k');
%         circle(row(64),row(65),0.2,'r');
%         circle(row(67),row(68),0.2,'b');
%         circle(row(70),row(71),0.2,'g');
%         circle(row(73),row(74),0.2,'c');
%         circle(row(76),row(77),0.2,'y');
%         circle(row(79),row(80),0.2,'m');
%         circle(row(82),row(83),0.2,'k');
%         circle(row(85),row(86),0.2,'r');
%         circle(row(88),row(89),0.2,'b');



        plot3([row(1),row2(1)],[row(2),row2(2)],[row(3),row2(3)],'r')
        plot3([row(4),row2(4)],[row(5),row2(5)],[row(6),row2(6)],'r')
        plot3([row(7),row2(7)],[row(8),row2(8)],[row(9),row2(9)],'r')
        plot3([row(10),row2(10)],[row(11),row2(11)],[row(12),row2(12)],'r')
        plot3([row(13),row2(13)],[row(14),row2(14)],[row(15),row2(15)],'r')
        plot3([row(16),row2(16)],[row(17),row2(17)],[row(18),row2(18)],'r')
        plot3([row(19),row2(19)],[row(20),row2(20)],[row(21),row2(21)],'r')
        plot3([row(22),row2(22)],[row(23),row2(23)],[row(24),row2(24)],'r')
        plot3([row(25),row2(25)],[row(26),row2(26)],[row(27),row2(27)],'r')
        plot3([row(28),row2(28)],[row(29),row2(29)],[row(30),row2(30)],'r')
        plot3([row(31),row2(31)],[row(32),row2(32)],[row(33),row2(33)],'r')
        plot3([row(34),row2(34)],[row(35),row2(35)],[row(36),row2(36)],'r')
        plot3([row(37),row2(37)],[row(38),row2(38)],[row(39),row2(39)],'r')
        plot3([row(40),row2(40)],[row(41),row2(41)],[row(42),row2(42)],'r')
        plot3([row(43),row2(43)],[row(44),row2(44)],[row(45),row2(45)],'r')
        plot3([row(46),row2(46)],[row(47),row2(47)],[row(48),row2(48)],'r')
        plot3([row(49),row2(49)],[row(50),row2(50)],[row(51),row2(51)],'r')
        plot3([row(52),row2(52)],[row(53),row2(53)],[row(54),row2(54)],'r')
        plot3([row(55),row2(55)],[row(56),row2(56)],[row(57),row2(57)],'r')
        plot3([row(58),row2(58)],[row(59),row2(59)],[row(60),row2(60)],'r')
        plot3([row(61),row2(61)],[row(62),row2(62)],[row(63),row2(63)],'r')
        plot3([row(64),row2(64)],[row(65),row2(65)],[row(66),row2(66)],'r')
        plot3([row(67),row2(67)],[row(68),row2(68)],[row(69),row2(69)],'r')
        plot3([row(70),row2(70)],[row(71),row2(71)],[row(72),row2(72)],'r')
        plot3([row(73),row2(73)],[row(74),row2(74)],[row(75),row2(75)],'r')
        plot3([row(76),row2(76)],[row(77),row2(77)],[row(78),row2(78)],'r')
        plot3([row(79),row2(79)],[row(80),row2(80)],[row(81),row2(81)],'r')
        plot3([row(82),row2(82)],[row(83),row2(83)],[row(84),row2(84)],'r')
        plot3([row(85),row2(85)],[row(86),row2(86)],[row(87),row2(87)],'r')
        plot3([row(88),row2(88)],[row(89),row2(89)],[row(90),row2(90)],'r')
        
    end
    
    
    if n_uavs == 32
        
        row = uav(i,:);
        row2 = uav(i+1,:);        
%         if formation == "line"
%             
%             plot3([row(1),row(4)],[row(2),row(5)],[row(3),row(6)],'Color','b');
%             plot3([row(4),row(7)],[row(5),row(8)],[row(6),row(9)],'Color','b');
%             plot3([row(7),row(10)],[row(8),row(11)],[row(9),row(12)],'Color','b');
%             plot3([row(10),row(13)],[row(11),row(14)],[row(12),row(15)],'Color','b');
%             plot3([row(13),row(16)],[row(14),row(17)],[row(15),row(18)],'Color','b');
%             plot3([row(16),row(19)],[row(17),row(20)],[row(18),row(21)],'Color','b');
%             plot3([row(19),row(22)],[row(20),row(23)],[row(21),row(24)],'Color','b');
%             plot3([row(22),row(25)],[row(23),row(26)],[row(24),row(27)],'Color','b');
%             plot3([row(25),row(28)],[row(26),row(29)],[row(27),row(30)],'Color','b');
%             plot3([row(28),row(31)],[row(29),row(32)],[row(30),row(33)],'Color','b');
%             plot3([row(31),row(34)],[row(32),row(35)],[row(33),row(36)],'Color','b');
%             plot3([row(34),row(37)],[row(35),row(38)],[row(36),row(39)],'Color','b');
%             plot3([row(37),row(40)],[row(38),row(41)],[row(39),row(42)],'Color','b');
%             plot3([row(40),row(43)],[row(41),row(44)],[row(42),row(45)],'Color','b');
%             plot3([row(43),row(46)],[row(44),row(47)],[row(45),row(48)],'Color','b');
%             plot3([row(46),row(49)],[row(47),row(50)],[row(48),row(51)],'Color','b');
%             plot3([row(49),row(52)],[row(50),row(53)],[row(51),row(54)],'Color','b');
%             plot3([row(52),row(55)],[row(53),row(56)],[row(54),row(57)],'Color','b');
%             plot3([row(55),row(58)],[row(56),row(59)],[row(57),row(60)],'Color','b');
%             plot3([row(58),row(61)],[row(59),row(62)],[row(60),row(63)],'Color','b');
%             plot3([row(61),row(64)],[row(62),row(65)],[row(63),row(66)],'Color','b');
%             plot3([row(64),row(67)],[row(65),row(68)],[row(66),row(69)],'Color','b');
%             plot3([row(67),row(70)],[row(68),row(71)],[row(69),row(72)],'Color','b');
%             plot3([row(70),row(73)],[row(71),row(74)],[row(72),row(75)],'Color','b');
%             plot3([row(73),row(76)],[row(74),row(77)],[row(75),row(78)],'Color','b');
%             plot3([row(76),row(79)],[row(77),row(80)],[row(78),row(81)],'Color','b');
%             plot3([row(79),row(82)],[row(80),row(83)],[row(81),row(84)],'Color','b');
%             plot3([row(82),row(85)],[row(83),row(86)],[row(84),row(87)],'Color','b');
%             plot3([row(85),row(88)],[row(86),row(89)],[row(87),row(90)],'Color','b');
%             plot3([row(88),row(91)],[row(89),row(92)],[row(90),row(93)],'Color','b');
%             plot3([row(91),row(94)],[row(92),row(95)],[row(93),row(96)],'Color','b');
%             plot3([row(94),row(1)],[row(95),row(2)],[row(96),row(3)],'Color','b');
% 
%         end 
        
%         circle(row(1),row(2),0.2,'r');
%         circle(row(4),row(5),0.2,'b');
%         circle(row(7),row(8),0.2,'g');
%         circle(row(10),row(11),0.2,'c');
%         circle(row(13),row(14),0.2,'y');
%         circle(row(16),row(17),0.2,'m');
%         circle(row(19),row(20),0.2,'k');
%         circle(row(22),row(23),0.2,'r');
%         circle(row(25),row(26),0.2,'b');
%         circle(row(28),row(29),0.2,'g');
%         circle(row(31),row(32),0.2,'c');
%         circle(row(34),row(35),0.2,'y');
%         circle(row(37),row(38),0.2,'m');
%         circle(row(40),row(41),0.2,'k');
%         circle(row(43),row(44),0.2,'r');
%         circle(row(46),row(47),0.2,'b');
%         circle(row(49),row(50),0.2,'g');
%         circle(row(52),row(53),0.2,'c');
%         circle(row(55),row(56),0.2,'y');
%         circle(row(58),row(59),0.2,'m');
%         circle(row(61),row(62),0.2,'k');
%         circle(row(64),row(65),0.2,'r');
%         circle(row(67),row(68),0.2,'b');
%         circle(row(70),row(71),0.2,'g');
%         circle(row(73),row(74),0.2,'c');
%         circle(row(76),row(77),0.2,'y');
%         circle(row(79),row(80),0.2,'m');
%         circle(row(82),row(83),0.2,'k');
%         circle(row(85),row(86),0.2,'r');
%         circle(row(88),row(89),0.2,'b');
%         circle(row(91),row(92),0.2,'g');
%         circle(row(94),row(95),0.2,'c');

        plot3([row(1),row2(1)],[row(2),row2(2)],[row(3),row2(3)],'r')
        plot3([row(4),row2(4)],[row(5),row2(5)],[row(6),row2(6)],'r')
        plot3([row(7),row2(7)],[row(8),row2(8)],[row(9),row2(9)],'r')
        plot3([row(10),row2(10)],[row(11),row2(11)],[row(12),row2(12)],'r')
        plot3([row(13),row2(13)],[row(14),row2(14)],[row(15),row2(15)],'r')
        plot3([row(16),row2(16)],[row(17),row2(17)],[row(18),row2(18)],'r')
        plot3([row(19),row2(19)],[row(20),row2(20)],[row(21),row2(21)],'r')
        plot3([row(22),row2(22)],[row(23),row2(23)],[row(24),row2(24)],'r')
        plot3([row(25),row2(25)],[row(26),row2(26)],[row(27),row2(27)],'r')
        plot3([row(28),row2(28)],[row(29),row2(29)],[row(30),row2(30)],'r')
        plot3([row(31),row2(31)],[row(32),row2(32)],[row(33),row2(33)],'r')
        plot3([row(34),row2(34)],[row(35),row2(35)],[row(36),row2(36)],'r')
        plot3([row(37),row2(37)],[row(38),row2(38)],[row(39),row2(39)],'r')
        plot3([row(40),row2(40)],[row(41),row2(41)],[row(42),row2(42)],'r')
        plot3([row(43),row2(43)],[row(44),row2(44)],[row(45),row2(45)],'r')
        plot3([row(46),row2(46)],[row(47),row2(47)],[row(48),row2(48)],'r')
        plot3([row(49),row2(49)],[row(50),row2(50)],[row(51),row2(51)],'r')
        plot3([row(52),row2(52)],[row(53),row2(53)],[row(54),row2(54)],'r')
        plot3([row(55),row2(55)],[row(56),row2(56)],[row(57),row2(57)],'r')
        plot3([row(58),row2(58)],[row(59),row2(59)],[row(60),row2(60)],'r')
        plot3([row(61),row2(61)],[row(62),row2(62)],[row(63),row2(63)],'r')
        plot3([row(64),row2(64)],[row(65),row2(65)],[row(66),row2(66)],'r')
        plot3([row(67),row2(67)],[row(68),row2(68)],[row(69),row2(69)],'r')
        plot3([row(70),row2(70)],[row(71),row2(71)],[row(72),row2(72)],'r')
        plot3([row(73),row2(73)],[row(74),row2(74)],[row(75),row2(75)],'r')
        plot3([row(76),row2(76)],[row(77),row2(77)],[row(78),row2(78)],'r')
        plot3([row(79),row2(79)],[row(80),row2(80)],[row(81),row2(81)],'r')
        plot3([row(82),row2(82)],[row(83),row2(83)],[row(84),row2(84)],'r')
        plot3([row(85),row2(85)],[row(86),row2(86)],[row(87),row2(87)],'r')
        plot3([row(88),row2(88)],[row(89),row2(89)],[row(90),row2(90)],'r')
        plot3([row(91),row2(91)],[row(92),row2(92)],[row(93),row2(93)],'r')
        plot3([row(94),row2(94)],[row(95),row2(95)],[row(96),row2(96)],'r')
        
        
    end
end

saveas(fig1,'_Trajectories.png')
%Plot Goal and Start
% plot3(goal(1),goal(2),goal(3),'x')
% plot3(start(1),start(2),start(3),'x')

%% Simulation

if sim_mode == true
    
    figure();
    xlabel('X [m]')
    ylabel('Y [m]')
    hold on;
    x1 = start(1)-20;
    y1 = start(2)-20;
    x2 = goal(1)+20;
    y2 = goal(2)+20;
    axis([x1 x2 y1 y2])

    % Plot Obstacles
    l = size(obs,2);

    for i=1:l
        r = obs(4,i);
        [x,y,z] = cylinder(r);
        x = x + obs(1,i);
        y = y + obs(2,i);
        z = z + obs(3,i);
        z(2,:) = z(2,:)*60;
        surf(x,y,z);
        plot3(obs(1,i),obs(2,i),obs(3,i),'o')
        x = 0;
        y = 0;
        z = 0;
    end
    if mod(iter,2) == 0
        iter = iter-1;
    end
    
    %Plot UAVs
    pause(3)
    for i=1:2:iter 
        
        row = uav(i,:);
        
        if n_uavs == 4
            
            h1 = circle2(row(1),row(2),0.2,'b');
            h2 = circle2(row(4),row(5),0.2,'g');
            h3 = circle2(row(7),row(8),0.2,'m');
            h4 = circle2(row(10),row(11),0.2,'c');
            
            %h5 = plot3(vrb2(1,i),vrb2(2,i),vrb2(3,i),'x','Color','r');
            t = toc;
            pause(0.1-t)
            tic;
            set(h1,'Visible','off')
            set(h2,'Visible','off')
            set(h3,'Visible','off')
            set(h4,'Visible','off')
            
            %set(h5,'Visible','off')
            
        end
        
        if n_uavs == 5
            
            h1 = circle2(row(1),row(2),0.2,'b');
            h2 = circle2(row(4),row(5),0.2,'g');
            h3 = circle2(row(7),row(8),0.2,'m');
            h4 = circle2(row(10),row(11),0.2,'c');
            h5 = circle2(row(13),row(14),0.2,'b');
            
            %h6 = plot3(vrb2(1,i),vrb2(2,i),vrb2(3,i),'x','Color','r');
            t = toc;
            pause(0.1-t)
            tic;
            
            set(h1,'Visible','off')
            set(h2,'Visible','off')
            set(h3,'Visible','off')
            set(h4,'Visible','off')
            set(h5,'Visible','off')
            
            %set(h6,'Visible','off')
            
        end
        
        if n_uavs == 8
            
            h1 = circle2(row(1),row(2),0.2,'b');
            h2 = circle2(row(4),row(5),0.2,'g');
            h3 = circle2(row(7),row(8),0.2,'m');
            h4 = circle2(row(10),row(11),0.2,'c');
            
            h5 = circle2(row(13),row(14),0.2,'b');
            h6 = circle2(row(16),row(17),0.2,'g');
            h7 = circle2(row(19),row(20),0.2,'m');
            h8 = circle2(row(22),row(23),0.2,'c');
            
            %h9 = plot3(vrb2(1,i),vrb2(2,i),vrb2(3,i),'x','Color','r');
            t = toc;
            pause(0.1-t)
            tic;
        
            set(h1,'Visible','off')
            set(h2,'Visible','off')
            set(h3,'Visible','off')
            set(h4,'Visible','off')
            set(h5,'Visible','off')
            set(h6,'Visible','off')
            set(h7,'Visible','off')
            set(h8,'Visible','off')
            
            %set(h9,'Visible','off')
            
        end
        
        
        if n_uavs == 12
            
            h1 = circle2(row(1),row(2),0.2,'b');
            h2 = circle2(row(4),row(5),0.2,'g');
            h3 = circle2(row(7),row(8),0.2,'m');
            h4 = circle2(row(10),row(11),0.2,'c');
            
            h5 = circle2(row(13),row(14),0.2,'b');
            h6 = circle2(row(16),row(17),0.2,'g');
            h7 = circle2(row(19),row(20),0.2,'m');
            h8 = circle2(row(22),row(23),0.2,'c');
            
            h9 = circle2(row(25),row(26),0.2,'b');
            h10= circle2(row(28),row(29),0.2,'g');
            h11= circle2(row(31),row(32),0.2,'m');
            h12= circle2(row(34),row(35),0.2,'c');
            
            %h13= plot3(vrb2(1,i),vrb2(2,i),vrb2(3,i),'x','Color','r');
            t = toc;
            pause(0.1-t)
            tic;
        
            set(h1,'Visible','off')
            set(h2,'Visible','off')
            set(h3,'Visible','off')
            set(h4,'Visible','off')
            set(h5,'Visible','off')
            set(h6,'Visible','off')
            set(h7,'Visible','off')
            set(h8,'Visible','off')
            set(h9,'Visible','off')
            set(h10,'Visible','off')
            set(h11,'Visible','off')
            set(h12,'Visible','off')
            %set(h13,'Visible','off')
            
        end
        
        if n_uavs == 16
            
            h1 = circle2(row(1),row(2),0.2,'b');
            h2 = circle2(row(4),row(5),0.2,'g');
            h3 = circle2(row(7),row(8),0.2,'m');
            h4 = circle2(row(10),row(11),0.2,'c');
            
            h5 = circle2(row(13),row(14),0.2,'b');
            h6 = circle2(row(16),row(17),0.2,'g');
            h7 = circle2(row(19),row(20),0.2,'m');
            h8 = circle2(row(22),row(23),0.2,'c');
            
            h9 = circle2(row(25),row(26),0.2,'b');
            h10= circle2(row(28),row(29),0.2,'g');
            h11= circle2(row(31),row(32),0.2,'m');
            h12= circle2(row(34),row(35),0.2,'c');
            
            h13= circle2(row(37),row(38),0.2,'b');
            h14= circle2(row(40),row(41),0.2,'g');
            h15= circle2(row(43),row(44),0.2,'m');
            h16= circle2(row(46),row(47),0.2,'c');
            
            %h17= plot3(vrb2(1,i),vrb2(2,i),vrb2(3,i),'x','Color','r');
            t = toc;
            pause(0.1-t)
            tic;
        
            set(h1,'Visible','off')
            set(h2,'Visible','off')
            set(h3,'Visible','off')
            set(h4,'Visible','off')
            set(h5,'Visible','off')
            set(h6,'Visible','off')
            set(h7,'Visible','off')
            set(h8,'Visible','off')
            set(h9,'Visible','off')
            set(h10,'Visible','off')
            set(h11,'Visible','off')
            set(h12,'Visible','off')
            set(h13,'Visible','off')
            set(h14,'Visible','off')
            set(h15,'Visible','off')
            set(h16,'Visible','off')
            
            %set(h17,'Visible','off')
            
        end
        
        if n_uavs == 30
            
%             disp(size(row));
%             disp(row);
            
            h1 = circle2(row(1),row(2),0.2,'k');
            h2 = circle2(row(4),row(5),0.2,'k');
            h3 = circle2(row(7),row(8),0.2,'k');
            h4 = circle2(row(10),row(11),0.2,'k');
            
            h5 = circle2(row(13),row(14),0.2,'k');
            h6 = circle2(row(16),row(17),0.2,'k');
            h7 = circle2(row(19),row(20),0.2,'k');
            h8 = circle2(row(22),row(23),0.2,'k');
            
            h9 = circle2(row(25),row(26),0.2,'k');
            h10= circle2(row(28),row(29),0.2,'k');
            h11= circle2(row(31),row(32),0.2,'k');
            h12= circle2(row(34),row(35),0.2,'k');
            
            h13= circle2(row(37),row(38),0.2,'k');
            h14= circle2(row(40),row(41),0.2,'k');
            h15= circle2(row(43),row(44),0.2,'k');
            h16= circle2(row(46),row(47),0.2,'k');
            
            h17= circle2(row(49),row(50),0.2,'k');
            h18= circle2(row(52),row(53),0.2,'k');
            h19= circle2(row(55),row(56),0.2,'k');
            h20= circle2(row(58),row(59),0.2,'k');
            
            h21= circle2(row(61),row(62),0.2,'k');
            h22= circle2(row(64),row(65),0.2,'k');
            h23= circle2(row(67),row(68),0.2,'k');
            h24= circle2(row(70),row(71),0.2,'k');
           
            h25= circle2(row(73),row(74),0.2,'k');
            h26= circle2(row(76),row(77),0.2,'k');
            h27= circle2(row(79),row(80),0.2,'k');
            h28= circle2(row(82),row(83),0.2,'k');
            
            h29= circle2(row(85),row(86),0.2,'k');
            h30= circle2(row(88),row(89),0.2,'k');
            
            %h31= plot3(vrb2(1,i),vrb2(2,i),vrb2(3,i),'x','Color','r');
            t = toc;
            pause(0.1-t)
            tic;
        
            set(h1,'Visible','off')
            set(h2,'Visible','off')
            set(h3,'Visible','off')
            set(h4,'Visible','off')
            set(h5,'Visible','off')
            set(h6,'Visible','off')
            set(h7,'Visible','off')
            set(h8,'Visible','off')
            set(h9,'Visible','off')
            set(h10,'Visible','off')
            set(h11,'Visible','off')
            set(h12,'Visible','off')
            set(h13,'Visible','off')
            set(h14,'Visible','off')
            set(h15,'Visible','off')
            set(h16,'Visible','off')
            set(h17,'Visible','off')
            set(h18,'Visible','off')
            set(h19,'Visible','off')
            set(h20,'Visible','off')
            set(h21,'Visible','off')
            set(h22,'Visible','off')
            set(h23,'Visible','off')
            set(h24,'Visible','off')
            set(h25,'Visible','off')
            set(h26,'Visible','off')
            set(h27,'Visible','off')
            set(h28,'Visible','off')
            set(h29,'Visible','off')
            set(h30,'Visible','off')
            
            %set(h31,'Visible','off')
            
        end 
        
        if n_uavs == 32
            
            h1 = circle2(row(1),row(2),0.2,'b');
            h2 = circle2(row(4),row(5),0.2,'g');
            h3 = circle2(row(7),row(8),0.2,'m');
            h4 = circle2(row(10),row(11),0.2,'c');
            
            h5 = circle2(row(13),row(14),0.2,'b');
            h6 = circle2(row(16),row(17),0.2,'g');
            h7 = circle2(row(19),row(20),0.2,'m');
            h8 = circle2(row(22),row(23),0.2,'c');
            
            h9 = circle2(row(25),row(26),0.2,'b');
            h10= circle2(row(28),row(29),0.2,'g');
            h11= circle2(row(31),row(32),0.2,'m');
            h12= circle2(row(34),row(35),0.2,'c');
            
            h13= circle2(row(37),row(38),0.2,'b');
            h14= circle2(row(40),row(41),0.2,'g');
            h15= circle2(row(43),row(44),0.2,'m');
            h16= circle2(row(46),row(47),0.2,'c');
            
            h17= circle2(row(49),row(50),0.2,'b');
            h18= circle2(row(52),row(53),0.2,'g');
            h19= circle2(row(55),row(56),0.2,'m');
            h20= circle2(row(58),row(59),0.2,'c');
            
            h21= circle2(row(61),row(62),0.2,'b');
            h22= circle2(row(64),row(65),0.2,'g');
            h23= circle2(row(67),row(68),0.2,'m');
            h24= circle2(row(70),row(71),0.2,'c');
           
            h25= circle2(row(73),row(74),0.2,'b');
            h26= circle2(row(76),row(77),0.2,'g');
            h27= circle2(row(79),row(80),0.2,'m');
            h28= circle2(row(82),row(83),0.2,'c');
            
            h29= circle2(row(85),row(86),0.2,'b');
            h30= circle2(row(88),row(89),0.2,'g');
            h31= circle2(row(91),row(92),0.2,'m');
            h32= circle2(row(94),row(95),0.2,'c');
            
            %h33= plot3(vrb2(1,i),vrb2(2,i),vrb2(3,i),'x','Color','r');
            t = toc;
            pause(0.1-t)
            tic;
        
            set(h1,'Visible','off')
            set(h2,'Visible','off')
            set(h3,'Visible','off')
            set(h4,'Visible','off')
            set(h5,'Visible','off')
            set(h6,'Visible','off')
            set(h7,'Visible','off')
            set(h8,'Visible','off')
            set(h9,'Visible','off')
            set(h10,'Visible','off')
            set(h11,'Visible','off')
            set(h12,'Visible','off')
            set(h13,'Visible','off')
            set(h14,'Visible','off')
            set(h15,'Visible','off')
            set(h16,'Visible','off')
            set(h17,'Visible','off')
            set(h18,'Visible','off')
            set(h19,'Visible','off')
            set(h20,'Visible','off')
            set(h21,'Visible','off')
            set(h22,'Visible','off')
            set(h23,'Visible','off')
            set(h24,'Visible','off')
            set(h25,'Visible','off')
            set(h26,'Visible','off')
            set(h27,'Visible','off')
            set(h28,'Visible','off')
            set(h29,'Visible','off')
            set(h30,'Visible','off')
            set(h31,'Visible','off')
            set(h32,'Visible','off')
            
            %set(h33,'Visible','off')
            
        end
        
        title('Simulation')
    end
   
end

%% Circles
function h = circle2(x,y,r,color)
    ang=0:0.01:2*pi; 
    xp=r*cos(ang);
    yp=r*sin(ang);
    size_p = size(xp);
    zp = zeros(size_p(1),size_p(2));
    h = plot3(x+xp,y+yp,zp,'Color',color);
end

function circle(x,y,r,color_circ)
    ang=0:0.01:2*pi; 
    xp=r*cos(ang);
    yp=r*sin(ang);
    plot(x+xp,y+yp,color_circ);
end




end