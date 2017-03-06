clc
clear all
close all

imgname1='.\image1.JPG';
imgname2='.\image2.JPG';
myimg1=imread(imgname2);
myimg2=imread(imgname1);

myimg_left=imresize(myimg1,0.2);
myimg_right=imresize(myimg2,0.2);

imwrite(myimg_left,'myimg_left.jpg');
imwrite(myimg_right,'myimg_right.jpg');