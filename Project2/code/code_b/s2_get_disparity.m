clc
clear all
close all


imgname1='.\myimg_left.JPG';
imgname2='.\myimg_right.JPG';
myimg_l=imread(imgname2);
myimg_r=imread(imgname1);

patch_size=3;
half_size=2;
%patch_size=5;
%half_size=3;

mean_lp=mean(myimg_l);
mean_lp=mean(mean_lp);
mean_l=zeros(1,3);
mean_l(1)=mean_lp(1,1,1);
mean_l(2)=mean_lp(1,1,2);
mean_l(3)=mean_lp(1,1,3);

mean_rp=mean(myimg_r);
mean_rp=mean(mean_rp);
mean_r=zeros(1,3);
mean_r(1)=mean_rp(1,1,1);
mean_r(2)=mean_rp(1,1,2);
mean_r(3)=mean_rp(1,1,3);

disparity_x=zeros(size(myimg_l,1),size(myimg_r,2));

for yy=half_size:size(myimg_l,1)-half_size+1
%for yy=200:210
    yy
    for xx=half_size:size(myimg_l,2)-half_size+1
    %for xx=250:260
        %xx
        bestdist=1000000;
        for xx_find=half_size:size(myimg_l,2)-half_size+1
            if(patchdist(myimg_l,myimg_r,yy,xx,xx_find,patch_size,half_size,mean_l,mean_r)<bestdist)
                disparity_x(yy,xx)=xx_find-xx;
                bestdist=patchdist(myimg_l,myimg_r,yy,xx,xx_find,patch_size,half_size,mean_l,mean_r);
            end
        end
    end
end
save('disparity_x.mat','disparity_x');