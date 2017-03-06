%Bodong Zhang 

%This program is used to store coordinates of points both in camera
 %coordinate system and world system.
 
 %Format: u1 v1 x1 y1 z1
 %        u2 v2 x2 y2 z2
 
 
 clc
clear all
close all
imgname='.\pattern.jpg';
myimg=imread(imgname);
imshow(myimg);









%save coordinates
coordinates=zeros(96,5);


for z=1:8
    for x=1:6
        [u_image,v_image]=ginput(1);
        text(u_image,v_image,'**');
        coordinates((z-1)*6+x,1)=u_image;
        coordinates((z-1)*6+x,2)=v_image;
        coordinates((z-1)*6+x,3)=x;
        coordinates((z-1)*6+x,4)=0;
        coordinates((z-1)*6+x,5)=z;
    end
end

for z=1:8
    for y=1:6
        [u_image,v_image]=ginput(1);
        text(u_image,v_image,'**');
        coordinates(48+(z-1)*6+y,1)=u_image;
        coordinates(48+(z-1)*6+y,2)=v_image;
        coordinates(48+(z-1)*6+y,3)=0;
        coordinates(48+(z-1)*6+y,4)=y;
        coordinates(48+(z-1)*6+y,5)=z;
    end
end

save('coordinates.mat','coordinates');
 
 