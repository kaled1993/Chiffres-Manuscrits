function [ dist ] = distance( densites_chiffre_base , densite_chiffre , n,m )
%Détermine la distance entre la matrice de densité d'un chiffre de la base 
%d'apprentissage avec la matrice de densité du chiffre passé en paramètre
dist = 0;
for i=1:1:n
    for j=1:1:m
        dist = dist + (densites_chiffre_base(i,j)-densite_chiffre(i,j))^2;
    end
end

dist = sqrt(dist);
end

