 %Bodong Zhang
 %The program plot the difference between the real point and the estimated
 %points in image
 clc
 clear all
 close all
 imgname='.\pattern.jpg';
 myimg=imread(imgname);
 imshow(myimg);
 load('.\coordinates.mat');%ground truth
 load('.\m_matrix.mat');
 
 title('green: ground truth    red: estimation');
 
 count_num=0;
 distance=0;
 
 for point_i=1:size(coordinates,1)
        hold on;
        
        plot(coordinates(point_i,1),coordinates(point_i,2),'.','MarkerSize',10,'MarkerEdgeColor','g');
        
        m1=[m_matrix(1),m_matrix(2),m_matrix(3),m_matrix(4)];
        m2=[m_matrix(5),m_matrix(6),m_matrix(7),m_matrix(8)];
        m3=[m_matrix(9),m_matrix(10),m_matrix(11),m_matrix(12)];
        P=[coordinates(point_i,3)*28;coordinates(point_i,4)*28;coordinates(point_i,5)*28;1];
        u=(m1*P)/(m3*P);
        v=(m2*P)/(m3*P);
        hold on;
        plot(u(1),v(1),'.','MarkerSize',10,'MarkerEdgeColor','r');
        count_num=count_num+1;
        distance=distance+sqrt((u(1)-coordinates(point_i,1))*(u(1)-coordinates(point_i,1))+(v(1)-coordinates(point_i,2))*(v(1)-coordinates(point_i,2)));
        
        %text(evaluation_data{1,2*point_i-1}(1,1),evaluation_data{1,2*point_i}(1,1),num2str(point_i));
 end
  NEW=[28*1;28*6;0;1];
 u=(m1*NEW)/(m3*NEW);
 v=(m2*NEW)/(m3*NEW);
 hold on;
 plot(u(1),v(1),'.','MarkerSize',10,'MarkerEdgeColor','r');
 distance/count_num
 pause;
 
 
 