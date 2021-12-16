function [Ih,Mh,Bh_f] = homographie_triplet(I,M,B)
    
    figure, imshow(I);
    [X1,Y1] = ginput(4);
    close
    figure, imshow(I);
    [X2,Y2] = ginput(4);
    
    Z = zeros(8,1);

    if (length(X2) == length(Y2))
        for i=1:length(X2)
            Z(2*(i-1)+1,1)=X2(i);
            Z(2*(i-1)+2,1)=Y2(i);
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

    H_=A\Z;
    H=[H_(1) H_(2) H_(3);H_(4) H_(5) H_(6);H_(7) H_(8) 1];
    
    Bh = zeros(1,8);
    
    Hinv = eye(3)/H;
    for i=1:2:8
        x=(Hinv(1,1)*B(i) + Hinv(1,2)*B(i+1) +Hinv(1,3))/(Hinv(3,1)*i+Hinv(3,2)*B(i+1) +Hinv(3,3));
        y= (Hinv(2,1)*B(i) + Hinv(2,2)*B(i+1) +Hinv(2,3))/(Hinv(3,1)*i + Hinv(3,2)*B(i+1)+Hinv(3,3));
        Bh(i) =floor(x);
        Bh(i+1) = floor(y);
    end
    
    B_tmp = Bh;
    
    Bh(1) = min([B_tmp(1),B_tmp(3),B_tmp(5),B_tmp(7)]);
    Bh(2) = min([B_tmp(2),B_tmp(4),B_tmp(6),B_tmp(8)]);
    Bh(3) = max([B_tmp(1),B_tmp(3),B_tmp(5),B_tmp(7)]);
    Bh(4) = min([B_tmp(2),B_tmp(4),B_tmp(6),B_tmp(8)]);
    Bh(5) = max([B_tmp(1),B_tmp(3),B_tmp(5),B_tmp(7)]);
    Bh(6) = max([B_tmp(2),B_tmp(4),B_tmp(6),B_tmp(8)]);
    Bh(7) = min([B_tmp(1),B_tmp(3),B_tmp(5),B_tmp(7)]);
    Bh(8) = max([B_tmp(2),B_tmp(4),B_tmp(6),B_tmp(8)]);
    
    Bh_f = [Bh(1) Bh(2) Bh(5) Bh(6)];
    
    Ih = zeros(abs(Bh(1)-Bh(5))+1,abs(Bh(2)-Bh(6))+1);
    Mh = ones(abs(Bh(1)-Bh(5))+1,abs(Bh(2)-Bh(6))+1);
    
    
end


