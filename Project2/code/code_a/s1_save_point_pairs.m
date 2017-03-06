%This program read two images and allow users to point out point pairs,
%and then save them


clc
clear all
close all
imgname1='.\image1.JPG';
imgname2='.\image2.JPG';
myimg1=imread(imgname1);
myimg2=imread(imgname2);
%imshow(myimg);

%save coordinates
coordinates=zeros(300,4);%img1_x  img1_y  img2_x   img2_y
count=1;

while(1)
    display('Please click the point pairs');
    imshow(myimg1);
    [u_image1,v_image1]=ginput(1);
    text(u_image1,v_image1,'**');
    coordinates(count,1)=u_image1;
    coordinates(count,2)=v_image1;
    
    imshow(myimg2);
    [u_image2,v_image2]=ginput(1);
    text(u_image2,v_image2,'**');
    coordinates(count,3)=u_image2;
    coordinates(count,4)=v_image2;
    
    count=count+1;
    key=input('press 1 to continue, press 2 to stop');
    if key==2||count>size(coordinates,1)
        break;
    end
end


save('coordinates.mat','coordinates');