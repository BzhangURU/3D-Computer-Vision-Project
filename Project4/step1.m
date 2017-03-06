%keep pressing any key to continue the program
clc
clear all
close all


im1=imread('toy_formatted8.png');
im2=imread('toy_formatted9.png');
sigma=2;
im1_filter=gaussian_filter(im1,sigma);
im2_filter=gaussian_filter(im2,sigma);

im_dx_blur=zeros(size(im1_filter,1),size(im1_filter,2));
im_dy_blur=zeros(size(im1_filter,1),size(im1_filter,2));
im_dt_blur=zeros(size(im1_filter,1),size(im1_filter,2));
im_dt_frame=zeros(size(im1_filter,1),size(im1_filter,2));
im_velocity_u=zeros(size(im1_filter,1),size(im1_filter,2));
im_velocity_v=zeros(size(im1_filter,1),size(im1_filter,2));
true_velocity_u=zeros(size(im1_filter,1),size(im1_filter,2));
true_velocity_v=zeros(size(im1_filter,1),size(im1_filter,2));

for count_y=2:size(im1_filter,1)-1
    for count_x=2:size(im1_filter,2)-1
        im_dx_blur(count_y,count_x)=(im2_filter(count_y,count_x+1)-im2_filter(count_y,count_x-1))/2;
        im_dy_blur(count_y,count_x)=(im2_filter(count_y+1,count_x)-im2_filter(count_y-1,count_x))/2;
        im_dt_blur(count_y,count_x)=im2_filter(count_y,count_x)-im1_filter(count_y,count_x);
        im_dt_frame(count_y,count_x)=double(im2(count_y,count_x))-double(im1(count_y,count_x));
    end
end

im_dx_max=max(max(im_dx_blur));
im_dx_min=min(min(im_dx_blur));
im_dx_blur_show=255/(im_dx_max-im_dx_min)*(im_dx_blur-im_dx_min*ones(size(im_dx_blur,1),size(im_dx_blur,2)));
im_dx_blur_show=uint8(im_dx_blur_show);
imshow(im_dx_blur_show);
title('dx');
pause;


im_dy_max=max(max(im_dy_blur));
im_dy_min=min(min(im_dy_blur));
im_dy_blur_show=255/(im_dy_max-im_dy_min)*(im_dy_blur-im_dy_min*ones(size(im_dy_blur,1),size(im_dy_blur,2)));
im_dy_blur_show=uint8(im_dy_blur_show);
imshow(im_dy_blur_show);
title('dy');
pause;


im_dt_max=max(max(im_dt_blur));
im_dt_min=min(min(im_dt_blur));
im_dt_blur_show=255/(im_dt_max-im_dt_min)*(im_dt_blur-im_dt_min*ones(size(im_dt_blur,1),size(im_dt_blur,2)));
im_dt_blur_show=uint8(im_dt_blur_show);
imshow(im_dt_blur_show);
title('dt blur');
pause;


im_dt_framemax=max(max(im_dt_frame));
im_dt_framemin=min(min(im_dt_frame));
im_dt_frame_show=255/(im_dt_framemax-im_dt_framemin)*(im_dt_frame-im_dt_framemin*ones(size(im_dt_frame,1),size(im_dt_frame,2)));
im_dt_frame_show=uint8(im_dt_frame_show);
imshow(im_dt_frame_show);
title('dt frame');
pause;

for count_y=1+sigma*3:size(im1_filter,1)-1-sigma*3
    for count_x=1+sigma*3:size(im1_filter,2)-1-sigma*3
        im_velocity_u(count_y,count_x)=-im_dt_blur(count_y,count_x)*im_dx_blur(count_y,count_x)/(im_dx_blur(count_y,count_x)*im_dx_blur(count_y,count_x)+im_dy_blur(count_y,count_x)*im_dy_blur(count_y,count_x));
        im_velocity_v(count_y,count_x)=-im_dt_blur(count_y,count_x)*im_dy_blur(count_y,count_x)/(im_dx_blur(count_y,count_x)*im_dx_blur(count_y,count_x)+im_dy_blur(count_y,count_x)*im_dy_blur(count_y,count_x));
    end
end


max_u=max(max(abs(im_velocity_u)));
min_u=min(min(abs(im_velocity_u)));

max_v=max(max(abs(im_velocity_v)));
min_v=min(min(abs(im_velocity_v)));

largest=max(max_u,max_v);
imshow(im2);
title('normal vector, perpendicular to boundary');
% hold on;
% line([100,120],[200,350]);




%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%normal vector, perpendicular to boundary
for count_y=10:10:size(im1_filter,1)-10
    for count_x=10:10:size(im1_filter,2)-10
        hold on;
        line([count_x,count_x+im_velocity_u(count_y,count_x)*2],[count_y,count_y+im_velocity_v(count_y,count_x)*2]);
    end
end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Assume velocity around neighbors is same


true_velocity_u=zeros(size(im1_filter,1),size(im1_filter,2));
true_velocity_v=zeros(size(im1_filter,1),size(im1_filter,2));
for count_y=1+sigma*3:size(im1_filter,1)-2-sigma*3
    for count_x=1+sigma*3:size(im1_filter,2)-2-sigma*3
        b=[im_dt_blur(count_y,count_x);im_dt_blur(count_y,count_x+1);im_dt_blur(count_y+1,count_x);im_dt_blur(count_y+1,count_x+1)];
        A=[im_dx_blur(count_y,count_x),im_dy_blur(count_y,count_x);
            im_dx_blur(count_y,count_x+1),im_dy_blur(count_y,count_x+1);
            im_dx_blur(count_y+1,count_x),im_dy_blur(count_y+1,count_x);
            im_dx_blur(count_y+1,count_x+1),im_dy_blur(count_y+1,count_x)+1];
        
        velocity_result=-inv(A'*A)*A'*b;
        true_velocity_u(count_y,count_x)=velocity_result(1);
        true_velocity_v(count_y,count_x)=velocity_result(2);
    end
end

pause;

imshow(im2);
title('true vector');
for count_y=10:10:size(im1_filter,1)-10
    for count_x=10:10:size(im1_filter,2)-10
        hold on;
        line([count_x,count_x+true_velocity_u(count_y,count_x)*2],[count_y,count_y+true_velocity_v(count_y,count_x)*2]);
    end
end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Lucas Kanade
patch_size=41;
half_size=20;

Lucas_velocity_u=zeros(size(im1_filter,1),size(im1_filter,2));
Lucas_velocity_v=zeros(size(im1_filter,1),size(im1_filter,2));
for count_y=1+sigma*3+half_size:size(im1_filter,1)-2-sigma*3-half_size
    for count_x=1+sigma*3+half_size:size(im1_filter,2)-2-sigma*3-half_size
        denominator_x2=0;
        denominator_y2=0;
        denominator_xy=0;
        matrix_middle=zeros(2,2);
        matrix_last=zeros(2,1);
        
        for patch_y=count_y-half_size:count_y+half_size
            for patch_x=count_x-half_size:count_x+half_size
                denominator_x2=denominator_x2+im_dx_blur(patch_y,patch_x)*im_dx_blur(patch_y,patch_x);
                denominator_y2=denominator_y2+im_dy_blur(patch_y,patch_x)*im_dy_blur(patch_y,patch_x);
                denominator_xy=denominator_xy+im_dx_blur(patch_y,patch_x)*im_dy_blur(patch_y,patch_x);
                matrix_middle(1,1)=matrix_middle(1,1)+im_dy_blur(patch_y,patch_x)*im_dy_blur(patch_y,patch_x);
                matrix_middle(1,2)=matrix_middle(1,2)-im_dx_blur(patch_y,patch_x)*im_dy_blur(patch_y,patch_x);
                matrix_middle(2,1)=matrix_middle(2,1)-im_dx_blur(patch_y,patch_x)*im_dy_blur(patch_y,patch_x);
                matrix_middle(2,2)=matrix_middle(2,2)+im_dx_blur(patch_y,patch_x)*im_dx_blur(patch_y,patch_x);
                matrix_last(1)=matrix_last(1)-im_dx_blur(patch_y,patch_x)*im_dt_blur(patch_y,patch_x);
                matrix_last(2)=matrix_last(2)-im_dy_blur(patch_y,patch_x)*im_dt_blur(patch_y,patch_x);
            end
        end
        lucas_v=(1/(denominator_x2*denominator_y2-denominator_xy*denominator_xy))*matrix_middle*matrix_last;
        Lucas_velocity_u(count_y,count_x)=lucas_v(1);
        Lucas_velocity_v(count_y,count_x)=lucas_v(2);
        
        
    end
end

pause;

imshow(im2);
title('lucas true vector');
for count_y=10:10:size(im1_filter,1)-10
    for count_x=10:10:size(im1_filter,2)-10
        hold on;
        line([count_x,count_x+Lucas_velocity_u(count_y,count_x)*3],[count_y,count_y+Lucas_velocity_v(count_y,count_x)*3]);
    end
end














