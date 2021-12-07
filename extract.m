function [img1]=extract(img2,h,w)

    figure,imshow(img2);
    [X2,Y2] = ginput(4);

    %% Création d'image
    img1 = zeros(h,w,3);

    [X1] = [1 ; w ; w ; 1];
    [Y1] = [1 ; 1 ; h ; h];

    H=homographie(X1,X2,Y1,Y2);  
    [h2,w2,z2] = size(img2);

    for i=1:w
        for j=1:h    
             x2=(H(1,1)*i + H(1,2)*j +H(1,3))/(H(3,1)*i+H(3,2)*j +H(3,3));
             y2= (H(2,1)*i + H(2,2)*j +H(2,3))/(H(3,1)*i + H(3,2)*j+H(3,3));
            if(x2>=1 && x2<=w2 && y2>=1 && y2<=h2)
                img1(j,i,:)=img2(floor(y2),floor(x2),:);

            end
        end
    end

    figure,imshow(uint8(img1));
end

