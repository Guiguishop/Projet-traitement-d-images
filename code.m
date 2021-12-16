clc
close all

%% Images entr�es
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

[I,M,B] = img2triplet(img1);
[Ih,Mh,Bh]  = homographie_triplet(I,M,B);

%%

%1) Fonction qui donne des triplets � partir d'une image
%Utiliser triplet(image,masque,boite englobante)pour chaque image masque on initialise avec que des 1
%Calculer des nouvelles boites englobantes en appliquant l'homographie � l'image de base (aux 4 points) puis min et max de ces 4 nouveaux points
%Puis, la boite englobante donne la taille de la matrice image et mask et
%les remplir, pour cela,


%2)fonction (triplet,homographie) --> triplet
%3)Masque utilis� pour la fusion (triplet,triplet)-> triplet


% 1 I -> {I,M,B}
% 2 {I1,M1,B1} , H -> {I2,M2,B2}
% 3 {I1,M1,B1},{I2,M2,B2} -> {I3,M3,B3}

% 2) B1 = boîte englobante cad points limites du rectangle, après
% homographie, B2 = quadrangle, utilisation de min et max pour déterminer
% le rectangle

% 3) voir sujet pour relation entre img3, img2 et img1
