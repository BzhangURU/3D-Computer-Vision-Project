%The program calculate matrix F and save
clc
clear all
close all

load('.\coordinates_save.mat');
Q=zeros(size(coordinates,1),9);

for count_i=1:size(coordinates,1)
    Q(count_i,1)=coordinates(count_i,1)*coordinates(count_i,3);
    Q(count_i,2)=coordinates(count_i,1)*coordinates(count_i,4);
    Q(count_i,3)=coordinates(count_i,1);
    Q(count_i,4)=coordinates(count_i,3)*coordinates(count_i,2);
    Q(count_i,5)=coordinates(count_i,2)*coordinates(count_i,4);
    Q(count_i,6)=coordinates(count_i,2);
    Q(count_i,7)=coordinates(count_i,3);
    Q(count_i,8)=coordinates(count_i,4);
    Q(count_i,9)=1;
end




[U S V]=svd(Q);
 [min_val,min_index]=min(diag(S(1:9,1:9)));
 F_matrix=V(1:9,min_index);
 save('F_matrix.mat','F_matrix');