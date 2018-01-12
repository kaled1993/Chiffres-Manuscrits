function [densites] = calcul_densites(matrice_coord_chiffre,I,n,m)
%Fonction permettant de calculer la densité en pixel de chaque zone du 
%rectangle engloblant du chiffre passé en paramètre.

densites = zeros(n,m);

haut = matrice_coord_chiffre(1,1)+1;
gauche = matrice_coord_chiffre(1,2)+1;
bas = matrice_coord_chiffre(2,1)-1;
droite = matrice_coord_chiffre(2,2)-1;

pasVertical = (abs(bas-haut)/(n));
pasHorizontal = (abs(droite-gauche)/(m));

k=1;
for i=haut:pasVertical:bas-pasVertical
    l=1;
    indiceVertical = ceil(i);
    for j=gauche:pasHorizontal:droite-pasHorizontal
    indiceHorizontal = ceil(j);
    zone = I(indiceVertical:ceil(i+pasVertical), indiceHorizontal:ceil(j+pasHorizontal));
    indicesPixelsNoirs = find(zone<50);
    nbPixelsNoirs = size(indicesPixelsNoirs,1);
    
    densites(k,l) = nbPixelsNoirs/(pasHorizontal*pasVertical);
    l=l+1;
    end
    k=k+1;
end

end