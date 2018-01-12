function [ dist ] = distance( centre , chiffre , d )
%D�termine la distance entre le centre et le vecteur profil du chiffre
% Param�tres : 
%   centre : vecteur de profil moyenne de la classe
%   chiffre : vecteur de profil du chiffre
%   d : taille du profil gauche et droit
% Sortie : 
%   dist : distance euclidienne entre les deux premiers vecteurs pass�s en
%   param�tre

dist = 0;

for i=1:1:2*d
    dist = dist + (centre(i)-chiffre(i))^2;
end

dist = sqrt(dist);
end

