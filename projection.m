function [H]= projection(img1,img2) % projection de img2 sur img1

    [h,w,~] = size(img1);
    [h2,w2,~] = size(img2);
    [X1] = [1 ; w ; w ; 1];
    [Y1] = [1 ; 1 ; h ; h];
    figure,imshow(img2);
    [X2,Y2] = ginput(4);

    B = zeros(8,1);

    if (length(X2) == length(Y2))
        for i=1:length(X2)
            B(2*(i-1)+1,1)=X2(i);
            B(2*(i-1)+2,1)=Y2(i);
        end
    else
        disp("Error dim");
    end

    A=zeros(8,8);
    for i=1:2:7
        index = round(i/2);
        A(i,:)=[X1(index) Y1(index) 1 0 0 0 -X2(index)*X1(index) -X2(index)*Y1(index)];
        A(i+1,:)=[0 0 0 X1(index) Y1(index) 1 -X1(index)*Y2(index) -Y1(index)*Y2(index)]; 
    end

    H_=A\B;
    H=[H_(1) H_(2) H_(3);H_(4) H_(5) H_(6);H_(7) H_(8) 1];
    
    
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

end

    