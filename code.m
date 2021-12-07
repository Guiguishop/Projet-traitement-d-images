%clc
%clear all
close all

%% Images entrï¿½es
img1 = imread('rectanglebleu.jpg');
img2 = imread('panneau.jpg');
% figure, imshow(img1);
% [X1,Y1] = ginput(4);
% figure,imshow(img2);
% [X2,Y2] = ginput(4);


%% On applique H au pixels de l'image que l'on veut retoucher (checker si on est dans le rectangle)
H=homographie(X1,X2,Y1,Y2);
[h,w,z] = size(img1);
[h2,w2,z2] = size(img2);
M2 = zeros(3,1);
M= zeros(3,1);

% for i=1:w2
%     for j=1:h2
%         x2= H(1,1)*X1
%         M = H*[i;j;1];
%         x= M(1);
%         y = M(2);
% 
%         if (x>=X1(1) && x<=X1(4) && y>=Y1(1) && y<=Y1(4)) % On vÃ©rifie si on est dans le rectangle
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
       M1 = inv(H) * [i;j;1];
       x1=M1(1);
       y1=M1(2);
        if(x1>1 && x1<=w && y1>1 && y1<=h)     % si on est dans le rectangle
            img2(j,i,:)=img1(floor(y1),floor(x1),:);
        end
    end
end
            
figure,imshow(img2);

%1) Fonction qui donne des triplets à partir d'une image
%Utiliser triplet(image,masque,boite englobante)pour chaque image masque on initialise avec que des 1
%Calculer des nouvelles boites englobantes en appliquant l'homographie à
%l'image de base (aux 4 points) puis min et max de ces 4 nouveaux points
%Puis, la boite englobante donne la taille de la matrice image et mask et
%les remplir, pour cela,

%2)fonction (triplet,homographie) --> triplet
%3)Masque utilisé pour la fusion (triplet,triplet)-> triplet



