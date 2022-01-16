function [If,Mf,Bf] = fusion(I1,M1,B1,I2,M2,B2)
    [h1,w1,z1] = size(I1);
    I1= double(I1);
    I2=double(I2);
    
    [hm1,wm1,~]=size(M1);
    [hm2,wm2,~]=size(M2);
    
    %Calcul de la boîte englobante Bf englobant B1 et B2 à la fois
    Bf = zeros(1,8);
    Bf(1) = min([B1(1) B2(1)]);
    Bf(2)= min([B1(2) B2(2)]);
    Bf(3) = max([B1(3) B2(3)]);
    Bf(4) = min([B1(4) B2(4)]);
    Bf(5) = max([B1(5) B2(5)]);
    Bf(6) = max([B1(6) B2(6)]);
    Bf(7) = min([B1(7) B2(7)]);
    Bf(8) = max([B1(8) B2(8)]);
    
    x_max = max([Bf(1) Bf(3) Bf(5) Bf(7)]);
    x_min = min([Bf(1) Bf(3) Bf(5) Bf(7)]);
    y_max = max([Bf(2) Bf(4) Bf(6) Bf(8)]);
    y_min = min([Bf(2) Bf(4) Bf(6) Bf(8)]);
    w_new = x_max-x_min+1;
    h_new = y_max-y_min+1;
    
    %Calcul du masque fusionné et de l'image fusionnée
    If=zeros(h_new,w_new,z1);
    Mf = zeros(h_new,w_new);
    
    for i=1:w_new
        for j=1:h_new
            if(j<=min([hm1 hm2]) && i<=min([wm1 wm2]))
                Mf(j,i)= max([M1(j,i) M2(j,i)]);
                if((M1(j,i)+M2(j,i))~=0)
                    If(j,i,:)= (I1(j,i,:)*M1(j,i) + I2(j,i,:)*M2(j,i))/(M1(j,i)+M2(j,i));
                end
            end
        end
    end
    
    
end
    
    
    
    