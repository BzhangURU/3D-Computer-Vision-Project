%get surface image
clc
clear all
close all

load('N_1.mat');
load('N_2.mat');
load('N_3.mat');

for count_x=1:size(N_1,1)
    for count_y=1:size(N_1,2)
        %N=S\[double(im_1(count_x,count_y));double(im_2(count_x,count_y));double(im_3(count_x,count_y))];
%         N_1(count_x,count_y)=N(1)/sqrt(N(1)*N(1)+N(2)*N(2)+N(3)*N(3));
%         N_2(count_x,count_y)=N(2)/sqrt(N(1)*N(1)+N(2)*N(2)+N(3)*N(3));
%         N_3(count_x,count_y)=N(3)/sqrt(N(1)*N(1)+N(2)*N(2)+N(3)*N(3));
%         N_1(count_x,count_y)=N(1)/N(3);
%         N_2(count_x,count_y)=N(2)/N(3);
%         N_3(count_x,count_y)=1;
        N_1(count_x,count_y)=N_1(count_x,count_y)/N_3(count_x,count_y);
        N_2(count_x,count_y)=N_2(count_x,count_y)/N_3(count_x,count_y);
        %N_3(count_x,count_y)=N(3);
    end
end



X=N_1;
Y=N_2;
z=frankotchellappa(N_1,N_2);

% [ X, Y ] = meshgrid( 1:100, 1:100 );
% figure;
% %surf( X, Y, DepthMap, 'EdgeColor', 'none' );
% surf( X, Y, DepthMap, 'black', 'none' );
% camlight left;
% lighting phong

z_max=max(max(z));
z_min=min(min(z));
z_min_matrix=z_min*ones(size(z,1),size(z,2));
z_show=(z-z_min_matrix)/(z_max-z_min);
imshow(z_show);
pause;
xx=1:size(z_show,1);
yy=1:size(z_show,2);
surfc(xx,yy,z_show);
xlabel('x-axis');
ylabel('y-axis');