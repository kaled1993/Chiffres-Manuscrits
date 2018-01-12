function [ vecteur_probas ] = Proba_chiffre(matrice_coord_chiffre,I,n,m,densites_base,K)
%Détermine le vecteur de probabilité d'appartenance aux 10 classes


vecteur_probas = zeros(10,1);

densites_chiffre = calcul_densites(matrice_coord_chiffre,I,n,m);

matrice_distance = zeros(size(densites_base,1),size(densites_base,2));

for i=1:1:size(densites_base,1)
    for j=1:1:size(densites_base,2)
        matrice_distance(i,j) = distance(densites_base{i,j},densites_chiffre,n,m);
    end
end
      
for i=1:1:K
    [vecteur_min,indice_temp] = min(matrice_distance);
    [~ , indice_colonne] = min(vecteur_min);
    indice_ligne = indice_temp(indice_colonne);
    
    vecteur_probas(indice_ligne) = vecteur_probas(indice_ligne) + 1.0/K;
    
    matrice_distance(indice_ligne,indice_colonne) = max(max(matrice_distance));
end

end


