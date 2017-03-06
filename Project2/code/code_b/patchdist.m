function dist_value= patchdist(myimg_l,myimg_r,yy,xx,xx_find,patch_size,half_size,mean_l,mean_r)
%UNTITLED8 Summary of this function goes here
%   Detailed explanation goes here


%Be careful, dist=-coor
    w_l=zeros(patch_size*patch_size*3,1);
    for count_y=yy-half_size+1:yy+half_size-1
        for count_x=xx-half_size+1:xx+half_size-1
            w_l((count_y-(yy-half_size+1))*patch_size*3+(count_x-(xx-half_size+1))*3+1)=double(myimg_l(count_y,count_x,1))-mean_l(1);
            w_l((count_y-(yy-half_size+1))*patch_size*3+(count_x-(xx-half_size+1))*3+2)=double(myimg_l(count_y,count_x,2))-mean_l(2);
            w_l((count_y-(yy-half_size+1))*patch_size*3+(count_x-(xx-half_size+1))*3+3)=double(myimg_l(count_y,count_x,3))-mean_l(3);
        end
    end
    
    w_r=zeros(patch_size*patch_size*3,1);
    for count_yr=yy-half_size+1:yy+half_size-1
        %count_yr
        for count_xr=xx_find-half_size+1:xx_find+half_size-1
            %count_xr
            %myimg_r(count_yr,count_xr,1)
            %mean_r(1)
            w_r((count_yr-(yy-half_size+1))*patch_size*3+(count_xr-(xx_find-half_size+1))*3+1)=double(myimg_r(count_yr,count_xr,1))-mean_r(1);
            w_r((count_yr-(yy-half_size+1))*patch_size*3+(count_xr-(xx_find-half_size+1))*3+2)=double(myimg_r(count_yr,count_xr,2))-mean_r(2);
            w_r((count_yr-(yy-half_size+1))*patch_size*3+(count_xr-(xx_find-half_size+1))*3+3)=double(myimg_r(count_yr,count_xr,3))-mean_r(3);
        end
    end
    %w_l
    %w_r
    dist_value=-sum(w_l.*w_r)/(norm(w_l)*norm(w_r));
    %pause
end

