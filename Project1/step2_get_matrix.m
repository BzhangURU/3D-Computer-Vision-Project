 %Bodong Zhang
 
 %This program use the coordinates to get m1  m2  m3
 
 load('.\coordinates.mat');
 
 
 %first get Q matrix
 
 Q=zeros(2*size(coordinates,1),12);
 for linei=1:size(coordinates,1)
     Q(linei*2-1,1)=coordinates(linei,3)*28;  %Px   the square is 28mm*28mm
     Q(linei*2-1,2)=coordinates(linei,4)*28;  %Py
     Q(linei*2-1,3)=coordinates(linei,5)*28;  %Pz
     Q(linei*2-1,4)=1;
     Q(linei*2-1,9)=-coordinates(linei,1)*coordinates(linei,3)*28;
     Q(linei*2-1,10)=-coordinates(linei,1)*coordinates(linei,4)*28;
     Q(linei*2-1,11)=-coordinates(linei,1)*coordinates(linei,5)*28;
     Q(linei*2-1,12)=-coordinates(linei,1);
     
     Q(linei*2,5)=coordinates(linei,3)*28;  %Px   the square is 28mm*28mm
     Q(linei*2,6)=coordinates(linei,4)*28;  %Py
     Q(linei*2,7)=coordinates(linei,5)*28;  %Pz
     Q(linei*2,8)=1;
     Q(linei*2,9)=-coordinates(linei,2)*coordinates(linei,3)*28;
     Q(linei*2,10)=-coordinates(linei,2)*coordinates(linei,4)*28;
     Q(linei*2,11)=-coordinates(linei,2)*coordinates(linei,5)*28;
     Q(linei*2,12)=-coordinates(linei,2);
 end
 
 
 
 %get m according to the algorithm in slide
 
 [U S V]=svd(Q);
 [min_val,min_index]=min(diag(S(1:12,1:12)));
 m_matrix=V(1:12,min_index);
 save('m_matrix.mat','m_matrix');