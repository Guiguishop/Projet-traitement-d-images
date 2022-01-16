function [Ih,Mh,Bh_f] = homographie_triplet(I,M,B,H)
    [h,w,z]= size(I);
    
    %Calcul de la nouvelle boîte englobante
    Bh = zeros(1,8);
    for i=1:2:7
         Bh(i)=floor((H(1,1)*B(i) + H(1,2)*B(i+1) +H(1,3))/(H(3,1)*B(i)+H(3,2)*B(i+1) +H(3,3)));
         Bh(i+1)= floor((H(2,1)*B(i) + H(2,2)*B(i+1) +H(2,3))/(H(3,1)*B(i)+H(3,2)*B(i+1) +H(3,3)));
    end
    
    min_x = min([Bh(1) Bh(3) Bh(5) Bh(7)]); %min(x)
    min_y = min([Bh(2) Bh(4) Bh(6) Bh(8)]); %min(y)
    max_x = max([Bh(1) Bh(3) Bh(5) Bh(7)]); %max(x)
    max_y= max([Bh(2) Bh(4) Bh(6) Bh(8)]); %max(y)
    
    Bh_f = [min_x min_y max_x min_y max_x max_y min_x max_y];
    
    w_new=max_x-min_x +1;
    h_new=max_y-min_y+1;
    disp(h_new)
    disp(w_new)
    
    %Calcul de la nouvelle image et du nouveau masque
    Ih = zeros(h_new,w_new,z);
    Mh= zeros(h_new,w_new);
    Mh(1:h,1:w)=M;
    
%     for i=1:w_new
%         for j=1:h_new
%              if(h_new>h || w_new>w)
%                  if(j<=h && i<=w)
%                     Mh(j,i)=M(j,i);
%                  end
%              elseif(h_new<=h && w_new<=w)
%                  Mh(j,i)=M(j,i);
%              end        
%         end
%     end
        
    Hinv = inv(H);
    for i=1:w
        for j=1:h    
            x=(Hinv(1,1)*i + Hinv(1,2)*j +Hinv(1,3))/(Hinv(3,1)*i+Hinv(3,2)*j +Hinv(3,3));
            y= (Hinv(2,1)*i + Hinv(2,2)*j +Hinv(2,3))/(Hinv(3,1)*i + Hinv(3,2)*j+Hinv(3,3));
            if(x>=1 && x<=w && y>=1 && y<=h)
                Ih(j,i,:)=I(floor(y),floor(x),:);
                Mh(j,i) = 1;
            end
        end
    end 
    
end


