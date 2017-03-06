clc
clear all
close all

load('.\F_matrix.mat');
F=[F_matrix(1) F_matrix(2) F_matrix(3);F_matrix(4) F_matrix(5) F_matrix(6);F_matrix(7) F_matrix(8) F_matrix(9)];
[u,d]=eigs(F'*F)

uu=u(:,3)
uu=uu/uu(3)