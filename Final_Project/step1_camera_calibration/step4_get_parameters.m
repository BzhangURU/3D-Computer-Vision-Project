 %Bodong Zhang
 %The program extract parameters from m_matrix
 %By measurement, the distance between original points in world frame and
 %camera coordinate system is 433mm
 
 
 load('.\m_matrix.mat');
 a1=[m_matrix(1);m_matrix(2);m_matrix(3)];
 a2=[m_matrix(5);m_matrix(6);m_matrix(7)];
 a3=[m_matrix(9);m_matrix(10);m_matrix(11)];
 
 
 
 

 norm_a3=sqrt(a3'*a3); 
 a1=a1/norm_a3;
 a2=a2/norm_a3;
 a3=a3/norm_a3;
 
 
 total_matrix=[m_matrix(1),m_matrix(2),m_matrix(3),m_matrix(4);m_matrix(5),m_matrix(6),m_matrix(7),m_matrix(8);m_matrix(9),m_matrix(10),m_matrix(11),m_matrix(12)];
 total_matrix=total_matrix/norm_a3;
 
 
 
 
 cos_angle=-((cross(a1,a3)')*cross(a2,a3))/( (sqrt(cross(a1,a3)'*cross(a1,a3)))*(sqrt(cross(a2,a3)'*cross(a2,a3)))  )
 angle=acos(cos_angle);
 %0.0071
 
 alpha=(sqrt(cross(a1,a3)'*cross(a1,a3)))*sqrt(1-cos_angle*cos_angle)
 betta=(sqrt(cross(a2,a3)'*cross(a2,a3)))*sqrt(1-cos_angle*cos_angle)
 
 u0=a1'*a3
 v0=a2'*a3
 
 intrinsic=[alpha,-alpha*cot(angle),u0;0,betta/sin(angle),v0;0,0,1]
 extrinsic=inv(intrinsic)*total_matrix
 
 
 