%2  use three points and rotate image to calculate more precise z

clc
clear all
close all
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%calibrated camera: By manual measurement xc=311, yc=188,zc=427
xc=311;
yc=188;
zc=427;
camera_vector=[xc yc zc];
%get points location in image 
load('.\m_matrix.mat');
%imgname='.\7_18_133.jpg';
imgname='.\4points_images\1.jpg';
%imgname='.\image_04.jpg';
myimg=imread(imgname);
imshow(myimg);
text(size(myimg,1),size(myimg,2),'**');
display('Please point out the location of original point');
[u_0,v_0]=ginput(1);
text(u_0,v_0,'**');

display('Please point out the location of point(x=150,y=0,z=0)');
[u_1,v_1]=ginput(1);
text(u_1,v_1,'**');

display('Please point out the location of point(x=0,y=150,z=0)');
[u_2,v_2]=ginput(1);
text(u_2,v_2,'**');

% u_0=662.5;%image_05
% u_1=2250.5;
% u_2=930;
% v_0=830;
% v_1=894;
% v_2=186;%image_05


% u_0=1014.5;%image_07
% u_1=2010.5;
% u_2=1446.5;
% v_0=830.5;
% v_1=1262.5;
% v_2=234.5;%image_07

% % % m1=[m_matrix(1),m_matrix(2),m_matrix(3),m_matrix(4)];
% % %         m2=[m_matrix(5),m_matrix(6),m_matrix(7),m_matrix(8)];
% % %         m3=[m_matrix(9),m_matrix(10),m_matrix(11),m_matrix(12)];
% % %         P=[coordinates(point_i,3)*28;coordinates(point_i,4)*28;coordinates(point_i,5)*28;1];
% % %         u=(m1*P)/(m3*P);
% % %         v=(m2*P)/(m3*P);

%syms x_0 y_0 z_0 x_1 y_1 z_1 x_2 y_2 z_2

% one=m_matrix(1)*x_0+m_matrix(2)*y_0+m_matrix(3)*z_0+m_matrix(4)-u_0*(m_matrix(9)*x_0+m_matrix(10)*y_0+m_matrix(11)*z_0+m_matrix(12));
% two=m_matrix(5)*x_0+m_matrix(6)*y_0+m_matrix(7)*z_0+m_matrix(8)-v_0*(m_matrix(9)*x_0+m_matrix(10)*y_0+m_matrix(11)*z_0+m_matrix(12));
% three=m_matrix(1)*x_1+m_matrix(2)*y_1+m_matrix(3)*z_1+m_matrix(4)-u_1*(m_matrix(9)*x_1+m_matrix(10)*y_1+m_matrix(11)*z_1+m_matrix(12));
% four=m_matrix(5)*x_1+m_matrix(6)*y_1+m_matrix(7)*z_1+m_matrix(8)-v_1*(m_matrix(9)*x_1+m_matrix(10)*y_1+m_matrix(11)*z_1+m_matrix(12));
% five=m_matrix(1)*x_2+m_matrix(2)*y_2+m_matrix(3)*z_2+m_matrix(4)-u_2*(m_matrix(9)*x_2+m_matrix(10)*y_2+m_matrix(11)*z_2+m_matrix(12));
% six=m_matrix(5)*x_2+m_matrix(6)*y_2+m_matrix(7)*z_2+m_matrix(8)-v_2*(m_matrix(9)*x_2+m_matrix(10)*y_2+m_matrix(11)*z_2+m_matrix(12));
% seven=(x_1-x_0)*(x_1-x_0)+(y_1-y_0)*(y_1-y_0)+(z_1-z_0)*(z_1-z_0)-150*150;
% eight=(x_2-x_0)*(x_2-x_0)+(y_2-y_0)*(y_2-y_0)+(z_2-z_0)*(z_2-z_0)-150*150;
% nine=(x_1-x_0)*(x_2-x_0)+(y_1-y_0)*(y_2-y_0)+(z_1-z_0)*(z_2-z_0);
% 
% [x_0,y_0,z_0,x_1,y_1,z_1,x_2,y_2,z_2]=solve(one,two,three,four,five,six,seven,eight,nine,x_0,y_0,z_0,x_1,y_1,z_1,x_2,y_2,z_2)




syms z_0 z_1 z_2



x_0=(   -(m_matrix(4)-u_0*m_matrix(12))*(m_matrix(6)-v_0*m_matrix(10))+(m_matrix(8)-v_0*m_matrix(12))*(m_matrix(2)-u_0*m_matrix(10))-z_0*((m_matrix(3)-u_0*m_matrix(11))*(m_matrix(6)-v_0*m_matrix(10))-(m_matrix(7)-v_0*m_matrix(11))*(m_matrix(2)-u_0*m_matrix(10)))    )/((m_matrix(1)-u_0*m_matrix(9))*(m_matrix(6)-v_0*m_matrix(10))-(m_matrix(5)-v_0*m_matrix(9))*(m_matrix(2)-u_0*m_matrix(10)));                    
y_0=(    (m_matrix(8)-v_0*m_matrix(12))*(m_matrix(1)-u_0*m_matrix(9))-(m_matrix(4)-u_0*m_matrix(12))*(m_matrix(5)-v_0*m_matrix(9))  -z_0*((m_matrix(3)-u_0*m_matrix(11))*(m_matrix(5)-v_0*m_matrix(9))-(m_matrix(7)-v_0*m_matrix(11))*(m_matrix(1)-u_0*m_matrix(9)))    )/(   (m_matrix(2)-u_0*m_matrix(10))*(m_matrix(5)-v_0*m_matrix(9))-(m_matrix(6)-v_0*m_matrix(10))*(m_matrix(1)-u_0*m_matrix(9))     );

x_1=(   -(m_matrix(4)-u_1*m_matrix(12))*(m_matrix(6)-v_1*m_matrix(10))+(m_matrix(8)-v_1*m_matrix(12))*(m_matrix(2)-u_1*m_matrix(10))-z_1*((m_matrix(3)-u_1*m_matrix(11))*(m_matrix(6)-v_1*m_matrix(10))-(m_matrix(7)-v_1*m_matrix(11))*(m_matrix(2)-u_1*m_matrix(10)))    )/((m_matrix(1)-u_1*m_matrix(9))*(m_matrix(6)-v_1*m_matrix(10))-(m_matrix(5)-v_1*m_matrix(9))*(m_matrix(2)-u_1*m_matrix(10)));                    
y_1=(    (m_matrix(8)-v_1*m_matrix(12))*(m_matrix(1)-u_1*m_matrix(9))-(m_matrix(4)-u_1*m_matrix(12))*(m_matrix(5)-v_1*m_matrix(9))  -z_1*((m_matrix(3)-u_1*m_matrix(11))*(m_matrix(5)-v_1*m_matrix(9))-(m_matrix(7)-v_1*m_matrix(11))*(m_matrix(1)-u_1*m_matrix(9)))    )/(   (m_matrix(2)-u_1*m_matrix(10))*(m_matrix(5)-v_1*m_matrix(9))-(m_matrix(6)-v_1*m_matrix(10))*(m_matrix(1)-u_1*m_matrix(9))     );

x_2=(   -(m_matrix(4)-u_2*m_matrix(12))*(m_matrix(6)-v_2*m_matrix(10))+(m_matrix(8)-v_2*m_matrix(12))*(m_matrix(2)-u_2*m_matrix(10))-z_2*((m_matrix(3)-u_2*m_matrix(11))*(m_matrix(6)-v_2*m_matrix(10))-(m_matrix(7)-v_2*m_matrix(11))*(m_matrix(2)-u_2*m_matrix(10)))    )/((m_matrix(1)-u_2*m_matrix(9))*(m_matrix(6)-v_2*m_matrix(10))-(m_matrix(5)-v_2*m_matrix(9))*(m_matrix(2)-u_2*m_matrix(10)));                    
y_2=(    (m_matrix(8)-v_2*m_matrix(12))*(m_matrix(1)-u_2*m_matrix(9))-(m_matrix(4)-u_2*m_matrix(12))*(m_matrix(5)-v_2*m_matrix(9))  -z_2*((m_matrix(3)-u_2*m_matrix(11))*(m_matrix(5)-v_2*m_matrix(9))-(m_matrix(7)-v_2*m_matrix(11))*(m_matrix(1)-u_2*m_matrix(9)))    )/(   (m_matrix(2)-u_2*m_matrix(10))*(m_matrix(5)-v_2*m_matrix(9))-(m_matrix(6)-v_2*m_matrix(10))*(m_matrix(1)-u_2*m_matrix(9))     );

seven=(x_1-x_0)*(x_1-x_0)+(y_1-y_0)*(y_1-y_0)+(z_1-z_0)*(z_1-z_0)-150*150;
eight=(x_2-x_0)*(x_2-x_0)+(y_2-y_0)*(y_2-y_0)+(z_2-z_0)*(z_2-z_0)-150*150;
nine=(x_1-x_0)*(x_2-x_0)+(y_1-y_0)*(y_2-y_0)+(z_1-z_0)*(z_2-z_0);

[z_0,z_1,z_2]=solve(seven,eight,nine,z_0,z_1,z_2)







%two solutions!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
% camera_vector=[xc yc zc];
% vector0=[x_0 y_0 z_0];
% vector1=[x_1 y_1 z_1];
% vector2=[x_2 y_2 z_2];
% camera_location_x=(camera_vector-vector0).*(vector1-vector0)/150
% camera_location_y=(camera_vector-vector0).*(vector2-vector0)/150
% camera_location_x2=((xc-x_0)*(x_1-x_0)+(yc-y_0)*(y_1-y_0)+(zc-z_0)*(z_1-z_0))/150
% camera_location_y2=((xc-x_0)*(x_2-x_0)+(yc-y_0)*(y_2-y_0)+(zc-z_0)*(z_2-z_0))/150
% cross_vector=cross(vector1-vector0,vector2-vector0)/(150*150);
% camera_location_z=(camera_vector-vector0).*cross_vector

x_0=(   -(m_matrix(4)-u_0*m_matrix(12))*(m_matrix(6)-v_0*m_matrix(10))+(m_matrix(8)-v_0*m_matrix(12))*(m_matrix(2)-u_0*m_matrix(10))-z_0*((m_matrix(3)-u_0*m_matrix(11))*(m_matrix(6)-v_0*m_matrix(10))-(m_matrix(7)-v_0*m_matrix(11))*(m_matrix(2)-u_0*m_matrix(10)))    )/((m_matrix(1)-u_0*m_matrix(9))*(m_matrix(6)-v_0*m_matrix(10))-(m_matrix(5)-v_0*m_matrix(9))*(m_matrix(2)-u_0*m_matrix(10)));                    
y_0=(    (m_matrix(8)-v_0*m_matrix(12))*(m_matrix(1)-u_0*m_matrix(9))-(m_matrix(4)-u_0*m_matrix(12))*(m_matrix(5)-v_0*m_matrix(9))  -z_0*((m_matrix(3)-u_0*m_matrix(11))*(m_matrix(5)-v_0*m_matrix(9))-(m_matrix(7)-v_0*m_matrix(11))*(m_matrix(1)-u_0*m_matrix(9)))    )/(   (m_matrix(2)-u_0*m_matrix(10))*(m_matrix(5)-v_0*m_matrix(9))-(m_matrix(6)-v_0*m_matrix(10))*(m_matrix(1)-u_0*m_matrix(9))     );

x_1=(   -(m_matrix(4)-u_1*m_matrix(12))*(m_matrix(6)-v_1*m_matrix(10))+(m_matrix(8)-v_1*m_matrix(12))*(m_matrix(2)-u_1*m_matrix(10))-z_1*((m_matrix(3)-u_1*m_matrix(11))*(m_matrix(6)-v_1*m_matrix(10))-(m_matrix(7)-v_1*m_matrix(11))*(m_matrix(2)-u_1*m_matrix(10)))    )/((m_matrix(1)-u_1*m_matrix(9))*(m_matrix(6)-v_1*m_matrix(10))-(m_matrix(5)-v_1*m_matrix(9))*(m_matrix(2)-u_1*m_matrix(10)));                    
y_1=(    (m_matrix(8)-v_1*m_matrix(12))*(m_matrix(1)-u_1*m_matrix(9))-(m_matrix(4)-u_1*m_matrix(12))*(m_matrix(5)-v_1*m_matrix(9))  -z_1*((m_matrix(3)-u_1*m_matrix(11))*(m_matrix(5)-v_1*m_matrix(9))-(m_matrix(7)-v_1*m_matrix(11))*(m_matrix(1)-u_1*m_matrix(9)))    )/(   (m_matrix(2)-u_1*m_matrix(10))*(m_matrix(5)-v_1*m_matrix(9))-(m_matrix(6)-v_1*m_matrix(10))*(m_matrix(1)-u_1*m_matrix(9))     );

x_2=(   -(m_matrix(4)-u_2*m_matrix(12))*(m_matrix(6)-v_2*m_matrix(10))+(m_matrix(8)-v_2*m_matrix(12))*(m_matrix(2)-u_2*m_matrix(10))-z_2*((m_matrix(3)-u_2*m_matrix(11))*(m_matrix(6)-v_2*m_matrix(10))-(m_matrix(7)-v_2*m_matrix(11))*(m_matrix(2)-u_2*m_matrix(10)))    )/((m_matrix(1)-u_2*m_matrix(9))*(m_matrix(6)-v_2*m_matrix(10))-(m_matrix(5)-v_2*m_matrix(9))*(m_matrix(2)-u_2*m_matrix(10)));                    
y_2=(    (m_matrix(8)-v_2*m_matrix(12))*(m_matrix(1)-u_2*m_matrix(9))-(m_matrix(4)-u_2*m_matrix(12))*(m_matrix(5)-v_2*m_matrix(9))  -z_2*((m_matrix(3)-u_2*m_matrix(11))*(m_matrix(5)-v_2*m_matrix(9))-(m_matrix(7)-v_2*m_matrix(11))*(m_matrix(1)-u_2*m_matrix(9)))    )/(   (m_matrix(2)-u_2*m_matrix(10))*(m_matrix(5)-v_2*m_matrix(9))-(m_matrix(6)-v_2*m_matrix(10))*(m_matrix(1)-u_2*m_matrix(9))     );


% for i=1:8
% (x_1(i)-x_0(i))*(x_1(i)-x_0(i))+(y_1(i)-y_0(i))*(y_1(i)-y_0(i))+(z_1(i)-z_0(i))*(z_1(i)-z_0(i))-150*150
% (x_2(i)-x_0(i))*(x_2(i)-x_0(i))+(y_2(i)-y_0(i))*(y_2(i)-y_0(i))+(z_2(i)-z_0(i))*(z_2(i)-z_0(i))-150*150
% (x_1(i)-x_0(i))*(x_2(i)-x_0(i))+(y_1(i)-y_0(i))*(y_2(i)-y_0(i))+(z_1(i)-z_0(i))*(z_2(i)-z_0(i))
% end
false_solve=0;
for i=1:8
    if abs((x_1(i)-x_0(i))*(x_1(i)-x_0(i))+(y_1(i)-y_0(i))*(y_1(i)-y_0(i))+(z_1(i)-z_0(i))*(z_1(i)-z_0(i))-150*150)>1
        false_solve=1;
    end
    if abs((x_2(i)-x_0(i))*(x_2(i)-x_0(i))+(y_2(i)-y_0(i))*(y_2(i)-y_0(i))+(z_2(i)-z_0(i))*(z_2(i)-z_0(i))-150*150)>1
        false_solve=1;
    end
    if abs((x_1(i)-x_0(i))*(x_2(i)-x_0(i))+(y_1(i)-y_0(i))*(y_2(i)-y_0(i))+(z_1(i)-z_0(i))*(z_2(i)-z_0(i)))>1
        false_solve=1;
    end
end

true=zeros(1,8);
%check whether the three points are at the back of camera
%[0 28 28*3]directionis middle of screen,[0 28 28*3]-camera_vector is
%camera eyesight

for count_i=1:8
    if isreal(z_0(count_i))&&isreal(z_1(count_i))&&isreal(z_2(count_i))
    
        true(count_i)=1;
    end
end

for count_i=1:8
    if true(count_i)==1
        %if dot(([0 28 28*3]-camera_vector),([x_0(count_i) y_0(count_i) z_0(count_i)]-camera_vector))>0&&dot(([0 28 28*3]-camera_vector),([x_1(count_i) y_1(count_i) z_1(count_i)]-camera_vector))>0&&if dot(([0 28 28*3]-camera_vector),([x_2(count_i) y_2(count_i) z_2(count_i)]-camera_vector))>0
    %     if dot(([0 28 28*3]-camera_vector),([x_0(count_i) y_0(count_i) z_0(count_i)]-camera_vector))>0    
    %         if dot(([0 28 28*3]-camera_vector),([x_1(count_i) y_1(count_i) z_1(count_i)]-camera_vector))>0
    %             if dot(([0 28 28*3]-camera_vector),([x_2(count_i) y_2(count_i) z_2(count_i)]-camera_vector))>0
        if dot(([0 28 28*3]-camera_vector),([x_0(count_i) y_0(count_i) z_0(count_i)]-camera_vector))>0&&dot(([0 28 28*3]-camera_vector),([x_1(count_i) y_1(count_i) z_1(count_i)]-camera_vector))>0&&dot(([0 28 28*3]-camera_vector),([x_2(count_i) y_2(count_i) z_2(count_i)]-camera_vector))>0                
            
            else true(count_i)=0;
        end

        %end
        if dot(([0 28 28*3]-camera_vector),([x_0(count_i) y_0(count_i) z_0(count_i)]-camera_vector))<0&&dot(([0 28 28*3]-camera_vector),([x_1(count_i) y_1(count_i) z_1(count_i)]-camera_vector))<0&&dot(([0 28 28*3]-camera_vector),([x_2(count_i) y_2(count_i) z_2(count_i)]-camera_vector))<0
%         if dot(([0 28 28*3]-camera_vector),([x_0(count_i) y_0(count_i) z_0(count_i)]-camera_vector))<0    
%             if dot(([0 28 28*3]-camera_vector),([x_1(count_i) y_1(count_i) z_1(count_i)]-camera_vector))<0
%                 if dot(([0 28 28*3]-camera_vector),([x_2(count_i) y_2(count_i) z_2(count_i)]-camera_vector))<0
                    true(count_i)=2;
%                 end
%             end
        end
    end
end
true
camera_location_x=zeros(1,8);
camera_location_y=zeros(1,8);
camera_location_z=zeros(1,8);
for count_i=1:8
    if true(count_i)==1
    vector0=[x_0(count_i) y_0(count_i) z_0(count_i)];
    vector1=[x_1(count_i) y_1(count_i) z_1(count_i)];
    vector2=[x_2(count_i) y_2(count_i) z_2(count_i)];
    camera_location_x(count_i)=dot((camera_vector-vector0),(vector1-vector0))/150;
    camera_location_y(count_i)=dot((camera_vector-vector0),(vector2-vector0))/150;
    cross_vector=cross(vector1-vector0,vector2-vector0)/(150*150);
    camera_location_z(count_i)=dot((camera_vector-vector0),cross_vector);
    display('');
    elseif true(count_i)==2
        vector0=[2*xc-x_0(count_i) 2*yc-y_0(count_i) 2*zc-z_0(count_i)];
        vector1=[2*xc-x_1(count_i) 2*yc-y_1(count_i) 2*zc-z_1(count_i)];
        vector2=[2*xc-x_2(count_i) 2*yc-y_2(count_i) 2*zc-z_2(count_i)];
        camera_location_x(count_i)=dot((camera_vector-vector0),(vector1-vector0))/150;
        camera_location_y(count_i)=dot((camera_vector-vector0),(vector2-vector0))/150;
        cross_vector=cross(vector1-vector0,vector2-vector0)/(150*150);
        camera_location_z(count_i)=dot((camera_vector-vector0),cross_vector);
        display('');
    end
    if camera_location_z(count_i)<10
        true(count_i)=0;
    end
    
    
end
camera_location_x
camera_location_y
camera_location_z
true



camera_real_location_x=camera_location_x(2);
camera_real_location_y=camera_location_y(2);
%camera_real_location_z=camera_location_z(2)

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%calculate new z


% u_0_temp=v_0;
% v_0=-u_0+size(myimg,2);
% u_0=u_0_temp;
% 
% u_1_temp=v_1;
% v_1=-u_1+size(myimg,2);
% u_1=u_1_temp;
% 
% u_2_temp=v_2;
% v_2=-u_2+size(myimg,2);
% u_2=u_2_temp;%rotate anti clockwise


u_0_temp=-v_0+size(myimg,1);
v_0=u_0;
u_0=u_0_temp;

u_1_temp=-v_1+size(myimg,1);
v_1=u_1;
u_1=u_1_temp;

u_2_temp=-v_2+size(myimg,1);
v_2=u_2;
u_2=u_2_temp;%rotate clockwise




syms z_0 z_1 z_2



x_0=(   -(m_matrix(4)-u_0*m_matrix(12))*(m_matrix(6)-v_0*m_matrix(10))+(m_matrix(8)-v_0*m_matrix(12))*(m_matrix(2)-u_0*m_matrix(10))-z_0*((m_matrix(3)-u_0*m_matrix(11))*(m_matrix(6)-v_0*m_matrix(10))-(m_matrix(7)-v_0*m_matrix(11))*(m_matrix(2)-u_0*m_matrix(10)))    )/((m_matrix(1)-u_0*m_matrix(9))*(m_matrix(6)-v_0*m_matrix(10))-(m_matrix(5)-v_0*m_matrix(9))*(m_matrix(2)-u_0*m_matrix(10)));                    
y_0=(    (m_matrix(8)-v_0*m_matrix(12))*(m_matrix(1)-u_0*m_matrix(9))-(m_matrix(4)-u_0*m_matrix(12))*(m_matrix(5)-v_0*m_matrix(9))  -z_0*((m_matrix(3)-u_0*m_matrix(11))*(m_matrix(5)-v_0*m_matrix(9))-(m_matrix(7)-v_0*m_matrix(11))*(m_matrix(1)-u_0*m_matrix(9)))    )/(   (m_matrix(2)-u_0*m_matrix(10))*(m_matrix(5)-v_0*m_matrix(9))-(m_matrix(6)-v_0*m_matrix(10))*(m_matrix(1)-u_0*m_matrix(9))     );

x_1=(   -(m_matrix(4)-u_1*m_matrix(12))*(m_matrix(6)-v_1*m_matrix(10))+(m_matrix(8)-v_1*m_matrix(12))*(m_matrix(2)-u_1*m_matrix(10))-z_1*((m_matrix(3)-u_1*m_matrix(11))*(m_matrix(6)-v_1*m_matrix(10))-(m_matrix(7)-v_1*m_matrix(11))*(m_matrix(2)-u_1*m_matrix(10)))    )/((m_matrix(1)-u_1*m_matrix(9))*(m_matrix(6)-v_1*m_matrix(10))-(m_matrix(5)-v_1*m_matrix(9))*(m_matrix(2)-u_1*m_matrix(10)));                    
y_1=(    (m_matrix(8)-v_1*m_matrix(12))*(m_matrix(1)-u_1*m_matrix(9))-(m_matrix(4)-u_1*m_matrix(12))*(m_matrix(5)-v_1*m_matrix(9))  -z_1*((m_matrix(3)-u_1*m_matrix(11))*(m_matrix(5)-v_1*m_matrix(9))-(m_matrix(7)-v_1*m_matrix(11))*(m_matrix(1)-u_1*m_matrix(9)))    )/(   (m_matrix(2)-u_1*m_matrix(10))*(m_matrix(5)-v_1*m_matrix(9))-(m_matrix(6)-v_1*m_matrix(10))*(m_matrix(1)-u_1*m_matrix(9))     );

x_2=(   -(m_matrix(4)-u_2*m_matrix(12))*(m_matrix(6)-v_2*m_matrix(10))+(m_matrix(8)-v_2*m_matrix(12))*(m_matrix(2)-u_2*m_matrix(10))-z_2*((m_matrix(3)-u_2*m_matrix(11))*(m_matrix(6)-v_2*m_matrix(10))-(m_matrix(7)-v_2*m_matrix(11))*(m_matrix(2)-u_2*m_matrix(10)))    )/((m_matrix(1)-u_2*m_matrix(9))*(m_matrix(6)-v_2*m_matrix(10))-(m_matrix(5)-v_2*m_matrix(9))*(m_matrix(2)-u_2*m_matrix(10)));                    
y_2=(    (m_matrix(8)-v_2*m_matrix(12))*(m_matrix(1)-u_2*m_matrix(9))-(m_matrix(4)-u_2*m_matrix(12))*(m_matrix(5)-v_2*m_matrix(9))  -z_2*((m_matrix(3)-u_2*m_matrix(11))*(m_matrix(5)-v_2*m_matrix(9))-(m_matrix(7)-v_2*m_matrix(11))*(m_matrix(1)-u_2*m_matrix(9)))    )/(   (m_matrix(2)-u_2*m_matrix(10))*(m_matrix(5)-v_2*m_matrix(9))-(m_matrix(6)-v_2*m_matrix(10))*(m_matrix(1)-u_2*m_matrix(9))     );

seven=(x_1-x_0)*(x_1-x_0)+(y_1-y_0)*(y_1-y_0)+(z_1-z_0)*(z_1-z_0)-150*150;
eight=(x_2-x_0)*(x_2-x_0)+(y_2-y_0)*(y_2-y_0)+(z_2-z_0)*(z_2-z_0)-150*150;
nine=(x_1-x_0)*(x_2-x_0)+(y_1-y_0)*(y_2-y_0)+(z_1-z_0)*(z_2-z_0);

[z_0,z_1,z_2]=solve(seven,eight,nine,z_0,z_1,z_2)







%two solutions!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
% camera_vector=[xc yc zc];
% vector0=[x_0 y_0 z_0];
% vector1=[x_1 y_1 z_1];
% vector2=[x_2 y_2 z_2];
% camera_location_x=(camera_vector-vector0).*(vector1-vector0)/150
% camera_location_y=(camera_vector-vector0).*(vector2-vector0)/150
% camera_location_x2=((xc-x_0)*(x_1-x_0)+(yc-y_0)*(y_1-y_0)+(zc-z_0)*(z_1-z_0))/150
% camera_location_y2=((xc-x_0)*(x_2-x_0)+(yc-y_0)*(y_2-y_0)+(zc-z_0)*(z_2-z_0))/150
% cross_vector=cross(vector1-vector0,vector2-vector0)/(150*150);
% camera_location_z=(camera_vector-vector0).*cross_vector

x_0=(   -(m_matrix(4)-u_0*m_matrix(12))*(m_matrix(6)-v_0*m_matrix(10))+(m_matrix(8)-v_0*m_matrix(12))*(m_matrix(2)-u_0*m_matrix(10))-z_0*((m_matrix(3)-u_0*m_matrix(11))*(m_matrix(6)-v_0*m_matrix(10))-(m_matrix(7)-v_0*m_matrix(11))*(m_matrix(2)-u_0*m_matrix(10)))    )/((m_matrix(1)-u_0*m_matrix(9))*(m_matrix(6)-v_0*m_matrix(10))-(m_matrix(5)-v_0*m_matrix(9))*(m_matrix(2)-u_0*m_matrix(10)));                    
y_0=(    (m_matrix(8)-v_0*m_matrix(12))*(m_matrix(1)-u_0*m_matrix(9))-(m_matrix(4)-u_0*m_matrix(12))*(m_matrix(5)-v_0*m_matrix(9))  -z_0*((m_matrix(3)-u_0*m_matrix(11))*(m_matrix(5)-v_0*m_matrix(9))-(m_matrix(7)-v_0*m_matrix(11))*(m_matrix(1)-u_0*m_matrix(9)))    )/(   (m_matrix(2)-u_0*m_matrix(10))*(m_matrix(5)-v_0*m_matrix(9))-(m_matrix(6)-v_0*m_matrix(10))*(m_matrix(1)-u_0*m_matrix(9))     );

x_1=(   -(m_matrix(4)-u_1*m_matrix(12))*(m_matrix(6)-v_1*m_matrix(10))+(m_matrix(8)-v_1*m_matrix(12))*(m_matrix(2)-u_1*m_matrix(10))-z_1*((m_matrix(3)-u_1*m_matrix(11))*(m_matrix(6)-v_1*m_matrix(10))-(m_matrix(7)-v_1*m_matrix(11))*(m_matrix(2)-u_1*m_matrix(10)))    )/((m_matrix(1)-u_1*m_matrix(9))*(m_matrix(6)-v_1*m_matrix(10))-(m_matrix(5)-v_1*m_matrix(9))*(m_matrix(2)-u_1*m_matrix(10)));                    
y_1=(    (m_matrix(8)-v_1*m_matrix(12))*(m_matrix(1)-u_1*m_matrix(9))-(m_matrix(4)-u_1*m_matrix(12))*(m_matrix(5)-v_1*m_matrix(9))  -z_1*((m_matrix(3)-u_1*m_matrix(11))*(m_matrix(5)-v_1*m_matrix(9))-(m_matrix(7)-v_1*m_matrix(11))*(m_matrix(1)-u_1*m_matrix(9)))    )/(   (m_matrix(2)-u_1*m_matrix(10))*(m_matrix(5)-v_1*m_matrix(9))-(m_matrix(6)-v_1*m_matrix(10))*(m_matrix(1)-u_1*m_matrix(9))     );

x_2=(   -(m_matrix(4)-u_2*m_matrix(12))*(m_matrix(6)-v_2*m_matrix(10))+(m_matrix(8)-v_2*m_matrix(12))*(m_matrix(2)-u_2*m_matrix(10))-z_2*((m_matrix(3)-u_2*m_matrix(11))*(m_matrix(6)-v_2*m_matrix(10))-(m_matrix(7)-v_2*m_matrix(11))*(m_matrix(2)-u_2*m_matrix(10)))    )/((m_matrix(1)-u_2*m_matrix(9))*(m_matrix(6)-v_2*m_matrix(10))-(m_matrix(5)-v_2*m_matrix(9))*(m_matrix(2)-u_2*m_matrix(10)));                    
y_2=(    (m_matrix(8)-v_2*m_matrix(12))*(m_matrix(1)-u_2*m_matrix(9))-(m_matrix(4)-u_2*m_matrix(12))*(m_matrix(5)-v_2*m_matrix(9))  -z_2*((m_matrix(3)-u_2*m_matrix(11))*(m_matrix(5)-v_2*m_matrix(9))-(m_matrix(7)-v_2*m_matrix(11))*(m_matrix(1)-u_2*m_matrix(9)))    )/(   (m_matrix(2)-u_2*m_matrix(10))*(m_matrix(5)-v_2*m_matrix(9))-(m_matrix(6)-v_2*m_matrix(10))*(m_matrix(1)-u_2*m_matrix(9))     );


% for i=1:8
% (x_1(i)-x_0(i))*(x_1(i)-x_0(i))+(y_1(i)-y_0(i))*(y_1(i)-y_0(i))+(z_1(i)-z_0(i))*(z_1(i)-z_0(i))-150*150
% (x_2(i)-x_0(i))*(x_2(i)-x_0(i))+(y_2(i)-y_0(i))*(y_2(i)-y_0(i))+(z_2(i)-z_0(i))*(z_2(i)-z_0(i))-150*150
% (x_1(i)-x_0(i))*(x_2(i)-x_0(i))+(y_1(i)-y_0(i))*(y_2(i)-y_0(i))+(z_1(i)-z_0(i))*(z_2(i)-z_0(i))
% end

for i=1:8
    if abs((x_1(i)-x_0(i))*(x_1(i)-x_0(i))+(y_1(i)-y_0(i))*(y_1(i)-y_0(i))+(z_1(i)-z_0(i))*(z_1(i)-z_0(i))-150*150)>1
        false_solve=1;
    end
    if abs((x_2(i)-x_0(i))*(x_2(i)-x_0(i))+(y_2(i)-y_0(i))*(y_2(i)-y_0(i))+(z_2(i)-z_0(i))*(z_2(i)-z_0(i))-150*150)>1
        false_solve=1;
    end
    if abs((x_1(i)-x_0(i))*(x_2(i)-x_0(i))+(y_1(i)-y_0(i))*(y_2(i)-y_0(i))+(z_1(i)-z_0(i))*(z_2(i)-z_0(i)))>1
        false_solve=1;
    end
end

true=zeros(1,8);
%check whether the three points are at the back of camera
%[0 28 28*3]directionis middle of screen,[0 28 28*3]-camera_vector is
%camera eyesight

for count_i=1:8
    if isreal(z_0(count_i))&&isreal(z_1(count_i))&&isreal(z_2(count_i))
    
        true(count_i)=1;
    end
end

for count_i=1:8
    if true(count_i)==1
        %if dot(([0 28 28*3]-camera_vector),([x_0(count_i) y_0(count_i) z_0(count_i)]-camera_vector))>0&&dot(([0 28 28*3]-camera_vector),([x_1(count_i) y_1(count_i) z_1(count_i)]-camera_vector))>0&&if dot(([0 28 28*3]-camera_vector),([x_2(count_i) y_2(count_i) z_2(count_i)]-camera_vector))>0
    %     if dot(([0 28 28*3]-camera_vector),([x_0(count_i) y_0(count_i) z_0(count_i)]-camera_vector))>0    
    %         if dot(([0 28 28*3]-camera_vector),([x_1(count_i) y_1(count_i) z_1(count_i)]-camera_vector))>0
    %             if dot(([0 28 28*3]-camera_vector),([x_2(count_i) y_2(count_i) z_2(count_i)]-camera_vector))>0
        if dot(([0 28 28*3]-camera_vector),([x_0(count_i) y_0(count_i) z_0(count_i)]-camera_vector))>0&&dot(([0 28 28*3]-camera_vector),([x_1(count_i) y_1(count_i) z_1(count_i)]-camera_vector))>0&&dot(([0 28 28*3]-camera_vector),([x_2(count_i) y_2(count_i) z_2(count_i)]-camera_vector))>0                
            
            else true(count_i)=0;
        end

        %end
        if dot(([0 28 28*3]-camera_vector),([x_0(count_i) y_0(count_i) z_0(count_i)]-camera_vector))<0&&dot(([0 28 28*3]-camera_vector),([x_1(count_i) y_1(count_i) z_1(count_i)]-camera_vector))<0&&dot(([0 28 28*3]-camera_vector),([x_2(count_i) y_2(count_i) z_2(count_i)]-camera_vector))<0
%         if dot(([0 28 28*3]-camera_vector),([x_0(count_i) y_0(count_i) z_0(count_i)]-camera_vector))<0    
%             if dot(([0 28 28*3]-camera_vector),([x_1(count_i) y_1(count_i) z_1(count_i)]-camera_vector))<0
%                 if dot(([0 28 28*3]-camera_vector),([x_2(count_i) y_2(count_i) z_2(count_i)]-camera_vector))<0
                    true(count_i)=2;
%                 end
%             end
        end
    end
end
true
camera_location_x=zeros(1,8);
camera_location_y=zeros(1,8);
camera_location_z=zeros(1,8);
for count_i=1:8
    if true(count_i)==1
    vector0=[x_0(count_i) y_0(count_i) z_0(count_i)];
    vector1=[x_1(count_i) y_1(count_i) z_1(count_i)];
    vector2=[x_2(count_i) y_2(count_i) z_2(count_i)];
    camera_location_x(count_i)=dot((camera_vector-vector0),(vector1-vector0))/150;
    camera_location_y(count_i)=dot((camera_vector-vector0),(vector2-vector0))/150;
    cross_vector=cross(vector1-vector0,vector2-vector0)/(150*150);
    camera_location_z(count_i)=dot((camera_vector-vector0),cross_vector);
    display('');
    elseif true(count_i)==2
        vector0=[2*xc-x_0(count_i) 2*yc-y_0(count_i) 2*zc-z_0(count_i)];
        vector1=[2*xc-x_1(count_i) 2*yc-y_1(count_i) 2*zc-z_1(count_i)];
        vector2=[2*xc-x_2(count_i) 2*yc-y_2(count_i) 2*zc-z_2(count_i)];
        camera_location_x(count_i)=dot((camera_vector-vector0),(vector1-vector0))/150;
        camera_location_y(count_i)=dot((camera_vector-vector0),(vector2-vector0))/150;
        cross_vector=cross(vector1-vector0,vector2-vector0)/(150*150);
        camera_location_z(count_i)=dot((camera_vector-vector0),cross_vector);
        display('');
    end
    if camera_location_z(count_i)<10
        true(count_i)=0;
    end
    
    
end
camera_location_x
camera_location_y
camera_location_z
true



camera_real_location_x
camera_real_location_y
camera_real_location_z=camera_location_z(2)

if false_solve==1
    display('The equations have not been successfully solved, please run the program again!');
    display('!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!');
    display('!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!');
end
