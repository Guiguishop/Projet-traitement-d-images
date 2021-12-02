function [H]= homographie(X1,X2,Y1,Y2)
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
    for i=1:2:5
        A(i,:)=[X1(i) Y1(i) 1 0 0 0 -X2(i)*X1(i) -X2(i)*Y1(i)];
        A(i+1,:)=[0 0 0 X1(i) Y1(i) 1 -X1(i)*Y2(i) -Y1(i)*Y2(i)]; 
    end

    H_=A\B;
    H=[H_(1) H_(2) H_(3);H_(4) H_(5) H_(6);H_(7) H_(8) 1];
end

    