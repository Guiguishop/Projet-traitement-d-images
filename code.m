clc
close all

%% Images entrï¿½es
img1 = imread('Image1.jpg');
img2 = imread('Image2.jpg');


%% Application de l'homographie mode projection

[img3,H]= projection(img1,img2);  

%% Application homographie mode extraction

% img = imread("avisluffy.jpg");
% h=800;
% w=600;
% newimg = extract(img,h,w);

%% Test img2triplet
clear all;
close all;
clc

img1 = imread('Armoire1.jpg');
img2 = imread('Armoire2.jpg');
figure,imshow(img1);
[X1,Y1]=ginput(4);
close all;
figure,imshow(img2);
[X2,Y2] = ginput(4);

H12= homographie(X1,X2,Y1,Y2); %H de 1 vers 2


%Utiliser triplet(image,masque,boite englobante)pour chaque image masque on initialise avec que des 1

%1) I -> {I,M,B} Fonction qui donne des triplets à partir d'une image
%Utiliser triplet(image,masque,boite englobante)pour chaque image masque on initialise avec que des 1
[I1,M1,B1] = img2triplet(img1);
[I2,M2,B2] = img2triplet(img2);

% 2) {I1,M1,B1} , H -> {I2,M2,B2}
%Calcul des nouvelles boites englobantes en appliquant l'homographie a
%l'image de base (aux 4 points) puis min et max pour recup le rectangle encadrant le quadrangle de ces 4 nouveaux points
%appliquer homographie inverse pour recup I2,mask2
[I2,M2,B2]  = homographie_triplet(I2,M2,B2,inv(H12));
figure,imshow(uint8(I2)),title('image2 homographiee')
figure,imshow(M2),title('masque')


%3) {I1,M1,B1},{I2,M2,B2} -> {I3,M3,B3}
%Masque utilise pour la fusion (triplet,triplet)-> triplet (voir eq6 et
%7 dans le sujet)
[If,Mf,Bf] = fusion(I1,M1,B1,I2,M2,B2);
figure,imshow(uint8(If)),title('image fusionnée')
figure,imshow(Mf),title('masque final')



% 3) voir sujet pour relation entre img3, img2 et img1
