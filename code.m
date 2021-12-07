%clc
%clear all
close all


img1 = imread('rectanglebleu.jpg');
img2 = imread('foreground.jpg');

%% On applique H au pixels de l'image que l'on veut retoucher (checker si on est dans le rectangle)

[h,w,z] = size(img1);
[X1] = [1 ; w ; w ; 1];
[Y1] = [1 ; 1 ; h ; h];
figure,imshow(img2);
[X2,Y2] = ginput(4);


%% On applique H au pixels de l'image que l'on veut retoucher (checker si on est dans le rectangle)
H=system_solve(X1,Y1,X2,Y2);  % H va de 2 vers 1
[h2,w2,z2] = size(img2);



Hinv = eye(3)/H;
for i=1:w2
    for j=1:h2    
         x1=(Hinv(1,1)*i + Hinv(1,2)*j +Hinv(1,3))/(Hinv(3,1)*i+Hinv(3,2)*j +Hinv(3,3));
         y1= (Hinv(2,1)*i + Hinv(2,2)*j +Hinv(2,3))/(Hinv(3,1)*i + Hinv(3,2)*j+Hinv(3,3));
        if(x1>=1 && x1<=w && y1>=1 && y1<=h)
            img2(j,i,:)=img1(floor(y1),floor(x1),:);

        end
    end
end
            
figure,imshow(img2);

%1) Fonction qui donne des triplets � partir d'une image
%Utiliser triplet(image,masque,boite englobante)pour chaque image masque on initialise avec que des 1
%Calculer des nouvelles boites englobantes en appliquant l'homographie �

%Utiliser triplet(image,masque,boite englobante) masque on initialise avec que des 1
%Calculer des nouvelles boites englobantes en appliquant l'homographie �

%l'image de base (aux 4 points) puis min et max de ces 4 nouveaux points
%Puis, la boite englobante donne la taille de la matrice image et mask et
%les remplir, pour cela,

%2)fonction (triplet,homographie) --> triplet
%3)Masque utilis� pour la fusion (triplet,triplet)-> triplet


%Extraction d'image, homographie sur le cadre dans une image prédéfini de
%taille w*h



