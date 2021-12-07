%clc
%clear all
close all

%% Images entr�es
img1 = imread('rectanglebleu.jpg');
img2 = imread('panneau.jpg');
%  figure, imshow(img1);
[h,w,z] = size(img1);
[X1] = [1 ; 1 ; w ; w];
[Y1] = [1 ; h ; 1 ; h];
figure,imshow(img2);
[X2,Y2] = ginput(4);


%%

%     B = zeros(8,1);
% 
%     if (length(X2) == length(Y2))
%         for i=1:length(X2)
%             B(2*(i-1)+1,1)=X2(i);
%             B(2*(i-1)+2,1)=Y2(i);
%         end
%     else
%         disp("Error dim");
%     end
% 
% 
%     A=zeros(8,8);
%     index=0;
%     for i=1:8
%         for j=1:8
%                 index = round(i/2);       
%                 if( (j==1 && mod(i,2)~=0) || (j==4 && mod(i,2)==0))
%                     A(i,j)=X1(index);
%                 end
%                 if( (j==2 && mod(i,2)~=0) || (j==5 && mod(i,2)==0))
%                         A(i,j)= Y1(index);
%                 end
%                 if( (j==3 && mod(i,2)~=0) || (j==6 && mod(i,2)==0))
%                         A(i,j)=1;
%                 end
%                 if(j ==7 && mod(i,2)==0)
%                     A(i,j)= -X1(index)*Y2(index);
%                 end
%                 if( j==7 && mod(i,2)~=0)
%                     A(i,j)= -X1(index)*X2(index);
%                 end
%                 if(j==8 && mod(i,2)==0)
%                     A(i,j)= -Y1(index)*Y2(index);
%                 end
%                 if(j==8 && mod(i,2)~=0)
%                     A(i,j) = -Y1(index)*X2(index);
%                 end
%         end
%     end
% 
%     H_=A\B;
%     H=[H_(1) H_(2) H_(3);H_(4) H_(5) H_(6);H_(7) H_(8) 1];

H=system_solve(X1,Y1,X2,Y2);

%% On applique H au pixels de l'image que l'on veut retoucher (checker si on est dans le rectangle)


[h2,w2,z2] = size(img2);

% for i=1:w2
%     for j=1:h2
%         x2= H(1,1)*X1
%         M = H*[i;j;1];
%         x= M(1);
%         y = M(2);
% 
%         if (x>=X1(1) && x<=X1(4) && y>=Y1(1) && y<=Y1(4)) % On vérifie si on est dans le rectangle
%             M2= inv(H)*M;
%             x2= M2(1);
%             y2= M(2);
%             img2(round(x2),round(y2),:)=img1(round(x1),round(x2),:);
%         end
%        
%     end
% end
for i=1:w2
    for j=1:h2
         H = inv(H);
        
        
        x1=floor((H(1,1)*i + H(1,2)*j +H(1,3))/(H(3,1)*i+H(3,2)*j +H(3,3)));
        y1= floor((H(2,1)*i + H(2,2)*j +H(2,3))/(H(3,1)*i + H(3,2)*j+H(3,3)));
        if(x1>=1 && x1<w && y1>=1 && y1<h)
            img2(j,i,:)=img1(y1,x1,:);
        end
    end
end
            
figure,imshow(img2);
%Utiliser triplet(image,masque,boite englobante) masque on initialise avec que des 1
%Calculer des nouvelles boites englobantes en appliquant l'homographie �
%l'image de base (aux 4 points) puis min et max de ces 4 nouveaux points
%Puis, la boite englobante donne la taille de la matrice image et mask et
%les remplir, pour cela,



