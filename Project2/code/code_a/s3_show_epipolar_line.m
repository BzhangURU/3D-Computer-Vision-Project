clc
clear all
close all

imgname1='.\image1.JPG';
imgname2='.\image2.JPG';
myimg1=imread(imgname1);
myimg2=imread(imgname2);

%load('.\coordinates_save.mat');
load('.\F_matrix.mat');


display('Please click a point on the image');

imshow(myimg1);
[u_image1,v_image1]=ginput(1);
%text(u_image1,v_image1,'**');
hold on;
plot(u_image1,v_image1,'.','MarkerSize',10,'MarkerEdgeColor','r');
pause;
vector=[u_image1,v_image1,1];
F=[F_matrix(1) F_matrix(2) F_matrix(3);F_matrix(4) F_matrix(5) F_matrix(6);F_matrix(7) F_matrix(8) F_matrix(9)];
line_vector=vector*F;

%line_point_y
count_point=1;
if abs(line_vector(1))>abs(line_vector(2))
    for yy=1:size(myimg1,1)
        xx=(-line_vector(2)*yy-line_vector(3))/line_vector(1);
        if xx>1&&xx<size(myimg1,2)
            line_point_x(count_point)=xx;
            line_point_y(count_point)=yy;
            count_point=count_point+1;
        end
    end
else
    for xx=1:size(myimg1,2)
        yy=(-line_vector(1)*xx-line_vector(3))/line_vector(2);
        if yy>1&&yy<size(myimg1,1)
            line_point_x(count_point)=xx;
            line_point_y(count_point)=yy;
            count_point=count_point+1;
        end
    end
end

imshow(myimg2);
hold on;
plot(line_point_x,line_point_y,'r-');



% a=imread('image1.jpg');
% b=imresize(a,0.25);
% imshow(b)
% hold on
% c=[100 200 300 450];
% d=[50 250 200 15];
% plot(c,d,'r-')


