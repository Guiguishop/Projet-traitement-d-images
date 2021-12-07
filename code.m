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


H=system_solve(X1,Y1,X2,Y2);

%% On applique H au pixels de l'image que l'on veut retoucher (checker si on est dans le rectangle)


[h2,w2,z2] = size(img2);


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


%Extraction d'image, homographie sur le cadre dans une image prédéfini de
%taille w*h



