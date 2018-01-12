function [ dist ] = distance( densites_chiffre_base , densite_chiffre , n,m )
%D�termine la distance entre la matrice de densit� d'un chiffre de la base 
%d'apprentissage avec la matrice de densit� du chiffre pass� en param�tre
dist = 0;
for i=1:1:n
    for j=1:1:m
        dist = dist + (densites_chiffre_base(i,j)-densite_chiffre(i,j))^2;
    end
end

dist = sqrt(dist);
end

