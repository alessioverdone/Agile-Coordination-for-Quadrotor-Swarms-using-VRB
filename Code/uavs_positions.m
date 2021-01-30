function [UAVs_pos, UAVs_r] = uavs_positions(VRB_pos, n_uavs, formation)


    
    if n_uavs == 4
        
        UAVs_pos = [VRB_pos(1)-1   VRB_pos(1)-1   VRB_pos(1)+1   VRB_pos(1)+1;
                    VRB_pos(2)+1   VRB_pos(2)-1   VRB_pos(2)-1   VRB_pos(2)+1;
                               0              0              0              0];
                           
        UAVs_r   = [UAVs_pos(:,1)-VRB_pos UAVs_pos(:,2)-VRB_pos UAVs_pos(:,3)-VRB_pos UAVs_pos(:,4)- VRB_pos];
        
    end
    
    if n_uavs == 5
        
        UAVs_pos = [VRB_pos(1)-1   VRB_pos(1)-1   VRB_pos(1)+1   VRB_pos(1)+1   VRB_pos(1);
                    VRB_pos(2)+1   VRB_pos(2)-1   VRB_pos(2)-1   VRB_pos(2)+1   VRB_pos(2);
                               0              0              0              0           0];
                           
        UAVs_r   = [UAVs_pos(:,1)-VRB_pos UAVs_pos(:,2)-VRB_pos UAVs_pos(:,3)-VRB_pos UAVs_pos(:,4)- VRB_pos UAVs_pos(:,5)- VRB_pos];
        
    end
    
    if n_uavs == 8
        
        UAVs_pos = [VRB_pos(1)-1   VRB_pos(1)-1   VRB_pos(1)-1   VRB_pos(1)     VRB_pos(1)+1   VRB_pos(1)+1   VRB_pos(1)+1   VRB_pos(1)  ;
                    VRB_pos(2)+1   VRB_pos(2)     VRB_pos(2)-1   VRB_pos(2)-1   VRB_pos(2)-1   VRB_pos(2)     VRB_pos(2)+1   VRB_pos(2)+1;
                               0              0              0              0              0              0              0              0];
                           
        UAVs_r   = [UAVs_pos(:,1)-VRB_pos UAVs_pos(:,2)-VRB_pos UAVs_pos(:,3)-VRB_pos UAVs_pos(:,4)- VRB_pos UAVs_pos(:,5)-VRB_pos UAVs_pos(:,6)-VRB_pos UAVs_pos(:,7)-VRB_pos UAVs_pos(:,8)- VRB_pos];
        
    end
    
    if n_uavs == 12
        
        UAVs_pos = [VRB_pos(1)-1   VRB_pos(1)-1   VRB_pos(1)-1   VRB_pos(1)     VRB_pos(1)+1   VRB_pos(1)+1   VRB_pos(1)+1   VRB_pos(1)     VRB_pos(1)-0.5   VRB_pos(1)-0.5   VRB_pos(1)-0.5       VRB_pos(1);
                    VRB_pos(2)+1   VRB_pos(2)     VRB_pos(2)-1   VRB_pos(2)-1   VRB_pos(2)-1   VRB_pos(2)     VRB_pos(2)+1   VRB_pos(2)+1   VRB_pos(2)+0.5   VRB_pos(2)       VRB_pos(2)-0.5   VRB_pos(2)-0.5;
                               0              0              0              0              0              0              0              0                0                0                0               0];
                           
        UAVs_r   = [UAVs_pos(:,1)-VRB_pos UAVs_pos(:,2)-VRB_pos UAVs_pos(:,3)-VRB_pos UAVs_pos(:,4)- VRB_pos UAVs_pos(:,5)-VRB_pos UAVs_pos(:,6)-VRB_pos UAVs_pos(:,7)-VRB_pos UAVs_pos(:,8)- VRB_pos UAVs_pos(:,9)-VRB_pos UAVs_pos(:,10)-VRB_pos UAVs_pos(:,11)-VRB_pos UAVs_pos(:,12)- VRB_pos];
    end
    
    if n_uavs == 16
        
        UAVs_pos = [VRB_pos(1)-1   VRB_pos(1)    VRB_pos(1)+1   VRB_pos(1)+1   VRB_pos(1)+1   VRB_pos(1)    VRB_pos(1)-1   VRB_pos(1)-1   VRB_pos(1)-0.5   VRB_pos(1)       VRB_pos(1)+0.5   VRB_pos(1)+0.5    VRB_pos(1)+0.5   VRB_pos(1)      VRB_pos(1)-0.5   VRB_pos(1)-0.5;
                    VRB_pos(2)-1   VRB_pos(2)-1  VRB_pos(2)-1   VRB_pos(2)     VRB_pos(2)+1   VRB_pos(2)+1  VRB_pos(2)+1   VRB_pos(2)     VRB_pos(2)-0.5   VRB_pos(2)-0.5   VRB_pos(2)-0.5   VRB_pos(2)        VRB_pos(2)+0.5   VRB_pos(2)+0.5  VRB_pos(2)+0.5   VRB_pos(2);
                               0              0              0              0              0              0              0              0                0                0                0              0                0                0                0                0];
                           
        UAVs_r   = [UAVs_pos(:,1)-VRB_pos UAVs_pos(:,2)-VRB_pos UAVs_pos(:,3)-VRB_pos UAVs_pos(:,4)- VRB_pos UAVs_pos(:,5)-VRB_pos UAVs_pos(:,6)-VRB_pos UAVs_pos(:,7)-VRB_pos UAVs_pos(:,8)- VRB_pos UAVs_pos(:,9)-VRB_pos UAVs_pos(:,10)-VRB_pos UAVs_pos(:,11)-VRB_pos UAVs_pos(:,12)- VRB_pos UAVs_pos(:,13)-VRB_pos UAVs_pos(:,14)-VRB_pos UAVs_pos(:,15)-VRB_pos UAVs_pos(:,16)- VRB_pos];
        
    end

    
    
    if n_uavs == 30
        
        UAVs_pos =[VRB_pos(1)-1   VRB_pos(1)-1   VRB_pos(1)-1   VRB_pos(1)     VRB_pos(1)+1   VRB_pos(1)+1   VRB_pos(1)+1   VRB_pos(1)     VRB_pos(1)-0.5   VRB_pos(1)-0.5   VRB_pos(1)-0.5   VRB_pos(1)       VRB_pos(1)+0.5   VRB_pos(1)+0.5   VRB_pos(1)+0.5   VRB_pos(1)      VRB_pos(1)-2   VRB_pos(1)-2   VRB_pos(1)-2   VRB_pos(1)     VRB_pos(1)+2   VRB_pos(1)+2   VRB_pos(1)+2   VRB_pos(1)     VRB_pos(1)-1.5   VRB_pos(1)-1.5   VRB_pos(1)-1.5   VRB_pos(1)       VRB_pos(1)+1.5   VRB_pos(1)+1.5;
                   VRB_pos(2)+1   VRB_pos(2)     VRB_pos(2)-1   VRB_pos(2)-1   VRB_pos(2)-1   VRB_pos(2)     VRB_pos(2)+1   VRB_pos(2)+1   VRB_pos(2)+0.5   VRB_pos(2)       VRB_pos(2)-0.5   VRB_pos(2)-0.5   VRB_pos(2)-0.5   VRB_pos(2)       VRB_pos(2)+0.5   VRB_pos(2)+0.5  VRB_pos(2)+2   VRB_pos(2)     VRB_pos(2)-2   VRB_pos(2)-2   VRB_pos(2)-2   VRB_pos(2)     VRB_pos(2)+2   VRB_pos(2)+2   VRB_pos(2)+1.5   VRB_pos(2)        VRB_pos(2)-1.5    VRB_pos(2)-1.5    VRB_pos(2)-1.5        VRB_pos(2);
                              0              0              0              0              0              0              0              0                0                0                0              0                0                0                0                0              0              0              0              0              0              0              0              0                0                0                0              0                0                0];
                                 
        UAVs_r   = [UAVs_pos(:,1)-VRB_pos UAVs_pos(:,2)-VRB_pos UAVs_pos(:,3)-VRB_pos UAVs_pos(:,4)- VRB_pos UAVs_pos(:,5)-VRB_pos UAVs_pos(:,6)-VRB_pos UAVs_pos(:,7)-VRB_pos UAVs_pos(:,8)- VRB_pos UAVs_pos(:,9)-VRB_pos UAVs_pos(:,10)-VRB_pos UAVs_pos(:,11)-VRB_pos UAVs_pos(:,12)- VRB_pos UAVs_pos(:,13)-VRB_pos UAVs_pos(:,14)-VRB_pos UAVs_pos(:,15)-VRB_pos UAVs_pos(:,16)- VRB_pos UAVs_pos(:,17)- VRB_pos UAVs_pos(:,18)- VRB_pos UAVs_pos(:,19)- VRB_pos UAVs_pos(:,20)- VRB_pos UAVs_pos(:,21)- VRB_pos UAVs_pos(:,22)- VRB_pos UAVs_pos(:,23)- VRB_pos UAVs_pos(:,24)- VRB_pos UAVs_pos(:,25)- VRB_pos UAVs_pos(:,26)- VRB_pos UAVs_pos(:,27)- VRB_pos UAVs_pos(:,28)- VRB_pos UAVs_pos(:,29)- VRB_pos UAVs_pos(:,30)- VRB_pos];
        
    end

    
    if n_uavs == 32
        
         UAVs_pos =[VRB_pos(1)-1   VRB_pos(1)-1   VRB_pos(1)-1   VRB_pos(1)     VRB_pos(1)+1   VRB_pos(1)+1   VRB_pos(1)+1   VRB_pos(1)     VRB_pos(1)-0.5   VRB_pos(1)-0.5   VRB_pos(1)-0.5   VRB_pos(1)       VRB_pos(1)+0.5   VRB_pos(1)+0.5   VRB_pos(1)+0.5   VRB_pos(1)      VRB_pos(1)-2   VRB_pos(1)-2   VRB_pos(1)-2   VRB_pos(1)     VRB_pos(1)+2   VRB_pos(1)+2   VRB_pos(1)+2   VRB_pos(1)     VRB_pos(1)-1.5   VRB_pos(1)-1.5   VRB_pos(1)-1.5   VRB_pos(1)       VRB_pos(1)+1.5   VRB_pos(1)+1.5   VRB_pos(1)+1.5   VRB_pos(1)    ;
                    VRB_pos(2)+1   VRB_pos(2)     VRB_pos(2)-1   VRB_pos(2)-1   VRB_pos(2)-1   VRB_pos(2)     VRB_pos(2)+1   VRB_pos(2)+1   VRB_pos(2)+0.5   VRB_pos(2)       VRB_pos(2)-0.5   VRB_pos(2)-0.5   VRB_pos(2)-0.5   VRB_pos(2)       VRB_pos(2)+0.5   VRB_pos(2)+0.5  VRB_pos(2)+2   VRB_pos(2)     VRB_pos(2)-2   VRB_pos(2)-2   VRB_pos(2)-2   VRB_pos(2)     VRB_pos(2)+2   VRB_pos(2)+2   VRB_pos(2)+1.5   VRB_pos(2)       VRB_pos(2)-1.5   VRB_pos(2)-1.5   VRB_pos(2)-1.5   VRB_pos(2)       VRB_pos(2)+1.5   VRB_pos(2)+1.5;
                               0              0              0              0              0              0              0              0                0                0                0              0                0                0                0                0              0              0              0              0              0              0              0              0                0                0                0              0                0                0                0                0];
                              
        UAVs_r   = [UAVs_pos(:,1)-VRB_pos UAVs_pos(:,2)-VRB_pos UAVs_pos(:,3)-VRB_pos UAVs_pos(:,4)- VRB_pos UAVs_pos(:,5)-VRB_pos UAVs_pos(:,6)-VRB_pos UAVs_pos(:,7)-VRB_pos UAVs_pos(:,8)- VRB_pos UAVs_pos(:,9)-VRB_pos UAVs_pos(:,10)-VRB_pos UAVs_pos(:,11)-VRB_pos UAVs_pos(:,12)- VRB_pos UAVs_pos(:,13)-VRB_pos UAVs_pos(:,14)-VRB_pos UAVs_pos(:,15)-VRB_pos UAVs_pos(:,16)- VRB_pos UAVs_pos(:,17)- VRB_pos UAVs_pos(:,18)- VRB_pos UAVs_pos(:,19)- VRB_pos UAVs_pos(:,20)- VRB_pos UAVs_pos(:,21)- VRB_pos UAVs_pos(:,22)- VRB_pos UAVs_pos(:,23)- VRB_pos UAVs_pos(:,24)- VRB_pos UAVs_pos(:,25)- VRB_pos UAVs_pos(:,26)- VRB_pos UAVs_pos(:,27)- VRB_pos UAVs_pos(:,28)- VRB_pos UAVs_pos(:,29)- VRB_pos UAVs_pos(:,30)- VRB_pos UAVs_pos(:,31)- VRB_pos UAVs_pos(:,32)- VRB_pos];
        
    end



end