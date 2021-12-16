function [I,M,B]=img2triplet(img)
    
    [h,w,~] = size(img);
    M = ones(h,w);
    B = [1 1  w 1  w h 1 h];
 
    I = img;
end
