clc
clear all
close all

%%
%Utiliser A\B pour résoudre AX =B et pour le calcul du pseudo-inverse

img1 = imread('background.jpg');
img2 = imread('foreground.jpg');
figure, imshow(img1);
[X1,Y1] = ginput(4);
close
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

A = zeros(8,8);
for i=1:length(A)
    for j=1:lenght(A)
        A(2*(i-1)+1,j)=X1(i);
        A(2*(i-1)+2,j)=Y1(i);
        A(2*(i-1)+3,j)=1;
        A(2*(i-1)+7,j)=-X2(i)*X1(i);
        A(2*(i-1)+8,j)=-X2(i)*Y1(i);
    
    
    
    end
end


