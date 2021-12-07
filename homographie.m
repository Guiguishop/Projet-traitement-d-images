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
    for i=1:2:7
        index = round(i/2);
        A(i,:)=[X1(index) Y1(index) 1 0 0 0 -X2(index)*X1(index) -X2(index)*Y1(index)];
        A(i+1,:)=[0 0 0 X1(index) Y1(index) 1 -X1(index)*Y2(index) -Y1(index)*Y2(index)]; 
    end

    H_=A\B;
    H=[H_(1) H_(2) H_(3);H_(4) H_(5) H_(6);H_(7) H_(8) 1];

%     B = zeros(8,1);
% 
%     if (length(X2) == length(Y2))
%         for i=1:length(X2)
%             B(2*(i-1)+1,1)=X2(i);
%             B(2*(i-1)+2,1)=Y2(i);
%         end
%     else
%         disp("Error dim");
%     end
% 
% 
%     A=zeros(8,8);
%     index=0;
%     for i=1:8
%         for j=1:8
%                 index = round(i/2);       
%                 if( (j==1 && mod(i,2)~=0) || (j==4 && mod(i,2)==0))
%                     A(i,j)=X1(index);
%                 end
%                 if( (j==2 && mod(i,2)~=0) || (j==5 && mod(i,2)==0))
%                         A(i,j)= Y1(index);
%                 end
%                 if( (j==3 && mod(i,2)~=0) || (j==6 && mod(i,2)==0))
%                         A(i,j)=1;
%                 end
%                 if(j ==7 && mod(i,2)==0)
%                     A(i,j)= -X1(index)*Y2(index);
%                 end
%                 if( j==7 && mod(i,2)~=0)
%                     A(i,j)= -X1(index)*X2(index);
%                 end
%                 if(j==8 && mod(i,2)==0)
%                     A(i,j)= -Y1(index)*Y2(index);
%                 end
%                 if(j==8 && mod(i,2)~=0)
%                     A(i,j) = -Y1(index)*X2(index);
%                 end
%         end
%     end
% 
%     H_=A\B;
%     H=[H_(1) H_(2) H_(3);H_(4) H_(5) H_(6);H_(7) H_(8) 1];

end

    