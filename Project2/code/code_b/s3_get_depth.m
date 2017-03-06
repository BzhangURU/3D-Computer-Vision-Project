clc
clear all
close all


load('disparity_x_3.mat');

depth_Z=zeros(size(disparity_x,1),size(disparity_x,2));
B=65;%65mm
%rear camera   sensor size: 1.12 um   focal length: 3.3mm 
pixel_size=0.00112;
f=3.3;

for yy=1:size(disparity_x,1)
    for xx=1:size(disparity_x,2)
        if disparity_x(yy,xx)~=0
            depth_Z(yy,xx)=-f*B/(disparity_x(yy,xx)*pixel_size);
        else depth_Z(yy,xx)=intmax;
        end
    end
end

save('depth_Z_patch3.mat','depth_Z');