clc
clear all
close all

im1=imread('real1.bmp');
im2=imread('real2.bmp');
im3=imread('real3.bmp');
S1=[-0.38359 -0.236647 0.892668]/sqrt(0.38359^2+0.236647^2+0.892668^2);
S2=[-0.372825 0.303914 0.87672]/sqrt(0.372825^2+0.303914^2+0.87672^2);
S3=[0.250814 0.34752 0.903505]/sqrt(0.250814^2+0.34752^2+0.903505^2);

S=[S1;S2;S3];
inv_S=inv(S);

im_1=zeros(size(im1,1),size(im1,2));
im_2=zeros(size(im1,1),size(im1,2));
im_3=zeros(size(im1,1),size(im1,2));
im_1=double(im1)/255;
im_2=double(im2)/255;
im_3=double(im3)/255;


N_1=zeros(size(im_1,1),size(im_1,2));
N_2=zeros(size(im_1,1),size(im_1,2));
N_3=zeros(size(im_1,1),size(im_1,2));
%SN=I
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
save('N_1_real.mat','N_1');
save('N_2_real.mat','N_2');
save('N_3_real.mat','N_3');

pause;
imshow(albedo);


