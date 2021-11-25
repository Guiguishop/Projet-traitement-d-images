clc
clear all
close all

%%
%Utiliser A\B pour résoudre AX =B et pour le calcul du pseudo-inverse

img1 = imread('background.jpg');
img2 = imread('foreground.jpg');
%figure, imshow(img1);
%[X1,Y1] = ginput(4);
%close
figure,imshow(img2);
[X2,Y2] = ginput(4);
close

%%
H = zeros(3,3);
H(3,3)=1;

B = zeros(8,1);

if (length(X2) == length(Y2))
    for i=1:length(X2)
        B(2*(i-1)+1,1)=X2(i);
        B(2*(i-1)+2,1)=Y2(i);
    end
else
    disp("Error dim");
end

