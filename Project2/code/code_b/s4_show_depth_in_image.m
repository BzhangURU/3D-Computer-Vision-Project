clc
clear all
close all

load('depth_Z_patch3.mat')
im=imread('myimg_left.jpg');




for yy=1:size(im,1)
    for xx=1:size(im,2)
        im(yy,xx,1)=0;
        im(yy,xx,2)=0;
        im(yy,xx,3)=0;
        if depth_Z(yy,xx)<10000
            im(yy,xx,1)=255*(1-depth_Z(yy,xx)/10000);
            im(yy,xx,2)=255*(1-depth_Z(yy,xx)/10000);
            im(yy,xx,3)=255*(1-depth_Z(yy,xx)/10000);
        end
    end
end

imwrite(im,'depth_image.jpg');


