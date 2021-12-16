clc
close all

%% Images entrÔøΩes
img1 = imread('background.jpg');
img2 = imread('foreground.jpg');


%% Application de l'homographie mode projection

H= projection(img1,img2);  

%% Application homographie mode extraction

close all;

img = imread("avisluffy.jpg");
h=800;
w=600;
newimg = extract(img,h,w);

%% Test img2triplet

%1) fonction (triplet,homographie) --> triplet
%Utiliser triplet(image,masque,boite englobante)pour chaque image masque on initialise avec que des 1
%Calculer des nouvelles boites englobantes en appliquant l'homographie ‡ l'image de base (aux 4 points) puis min et max pour rÈcup le rectangle encadrant le quadrangle de ces 4 nouveaux points
[I,M,B] = img2triplet(img1);
[Ih,Mh,Bh]  = homographie_triplet(I,M,B);

%%

%1) Fonction qui donne des triplets ÔøΩ partir d'une image
%Utiliser triplet(image,masque,boite englobante)pour chaque image masque on initialise avec que des 1
%Calculer des nouvelles boites englobantes en appliquant l'homographie ÔøΩ l'image de base (aux 4 points) puis min et max de ces 4 nouveaux points
%Puis, la boite englobante donne la taille de la matrice image et mask et
%appliquer homographie inverse pour recup I2,mask2


%2)Masque utilisÔøΩ pour la fusion (triplet,triplet)-> triplet (voir eq6 et
%7 dans le sujet)


% 1 I -> {I,M,B}
% 2 {I1,M1,B1} , H -> {I2,M2,B2}
% 3 {I1,M1,B1},{I2,M2,B2} -> {I3,M3,B3}

% 2) B1 = bo√Æte englobante cad points limites du rectangle, apr√®s
% homographie, B2 = quadrangle, utilisation de min et max pour d√©terminer
% le rectangle

% 3) voir sujet pour relation entre img3, img2 et img1
