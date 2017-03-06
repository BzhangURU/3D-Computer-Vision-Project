clc
clear all
close all

load('N_1_dog.mat');
load('N_2_dog.mat');
load('N_3_dog.mat');

light=[0.5 0.5 1];
light=light/sqrt(light(1)*light(1)+light(2)*light(2)+light(3)*light(3));
I=zeros(size(N_1,1),size(N_1,2));

for count_x=1:size(N_1,1)
    for count_y=1:size(N_1,2)
        
        I(count_x,count_y)=light*[N_1(count_x,count_y);N_2(count_x,count_y);N_3(count_x,count_y)];
        %N=S\[double(im_1(count_x,count_y));double(im_2(count_x,count_y));double(im_3(count_x,count_y))];
%         N_1(count_x,count_y)=N(1)/sqrt(N(1)*N(1)+N(2)*N(2)+N(3)*N(3));
%         N_2(count_x,count_y)=N(2)/sqrt(N(1)*N(1)+N(2)*N(2)+N(3)*N(3));
%         N_3(count_x,count_y)=N(3)/sqrt(N(1)*N(1)+N(2)*N(2)+N(3)*N(3));
%         N_1(count_x,count_y)=N(1)/N(3);
%         N_2(count_x,count_y)=N(2)/N(3);
%         N_3(count_x,count_y)=1;
%         N_1(count_x,count_y)=N_1(count_x,count_y)/N_3(count_x,count_y);
%         N_2(count_x,count_y)=N_2(count_x,count_y)/N_3(count_x,count_y);
        %N_3(count_x,count_y)=N(3);
    end
end
imshow(I);
