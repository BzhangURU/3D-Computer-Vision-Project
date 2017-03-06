clc
clear all
close all

im1=imread('im1.png');
im2=imread('im2.png');
im3=imread('im3.png');
S1=[0 0 1];
S2=[0.2 0 1]/sqrt(0.2^2+1);
S3=[0 0.2 1]/sqrt(0.2^2+1);

S=[S1;S2;S3];
inv_S=inv(S);

im_1=zeros(size(im1,1),size(im1,2));
im_2=zeros(size(im1,1),size(im1,2));
im_3=zeros(size(im1,1),size(im1,2));
albedo=zeros(size(im1,1),size(im1,2));
im_1=double(im1)/255;
im_2=double(im2)/255;
im_3=double(im3)/255;


N_1=zeros(size(im_1,1),size(im_1,2));
N_2=zeros(size(im_1,1),size(im_1,2));
N_3=zeros(size(im_1,1),size(im_1,2));
N_1_show=zeros(size(im_1,1),size(im_1,2));
N_2_show=zeros(size(im_1,1),size(im_1,2));
N_3_show=zeros(size(im_1,1),size(im_1,2));
%SN=I
for count_x=1:size(im_1,1)
    for count_y=1:size(im_1,2)
        N=S\[double(im_1(count_x,count_y));double(im_2(count_x,count_y));double(im_3(count_x,count_y))];
        N_1_show(count_x,count_y)=N(1)/sqrt(N(1)*N(1)+N(2)*N(2)+N(3)*N(3));
        N_2_show(count_x,count_y)=N(2)/sqrt(N(1)*N(1)+N(2)*N(2)+N(3)*N(3));
        N_3_show(count_x,count_y)=N(3)/sqrt(N(1)*N(1)+N(2)*N(2)+N(3)*N(3));
%         N_1(count_x,count_y)=N(1)/N(3);
%         N_2(count_x,count_y)=N(2)/N(3);
%         N_3(count_x,count_y)=1;
        N_1(count_x,count_y)=N(1);
        N_2(count_x,count_y)=N(2);
        N_3(count_x,count_y)=N(3);
        
        albedo(count_x,count_y)=sqrt(N(1)*N(1)+N(2)*N(2)+N(3)*N(3));
    end
end

imshow(N_1_show);
pause;
imshow(N_2_show);
pause;
imshow(N_3_show);
save('N_1.mat','N_1');
save('N_2.mat','N_2');
save('N_3.mat','N_3');
pause;
imshow(albedo);



