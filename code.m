%clc
%clear all
close all

%% Images entr�es

img1 = imread('rectanglebleu.jpg');
img2 = imread('panneau.jpg');
figure, imshow(img1);
[X1,Y1] = ginput(4);
close;
figure,imshow(img2);
[X2,Y2] = ginput(4);
close;


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

H=homographie(X1,X2,Y1,Y2);

%% On applique H au pixels de l'image que l'on veut retoucher (checker si on est dans le rectangle)


[h2,w2,z2] = size(img2);
M2 = zeros(3,1);
%%
for i=1:w2
    for j=1:h2
        M2 = H*[i;j;1];
        x2= M2(1);
        y2 = M2(2);
    
        if (x2>=X1(1) && x2<=X1(4) && y2>=Y1(1) && y2<=Y1(4)) % On vérifie si on est dans le rectangle
            
            img2(floor(x2),floor(y2),:)=img1(floor(x2),floor(y2),:);
        end
       
    end
end
imshow(img2);



