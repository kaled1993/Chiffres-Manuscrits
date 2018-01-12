function [ vectProba ] = proba_chiffre(matrice_coord_chiffre,ImageTest,d,centres)
%D�termine le vecteur de probabilit� d'appartenance aux 10 classes
%pour le chiffre pass� en param�tre.
%vecteur_proba = vecteur de probabilit� d'appartenance du chiffre aux
%classes


vectProba = zeros(10,1);

profil_chiffre = profils_extraction(matrice_coord_chiffre,ImageTest,d);

somme_exp =0;

exp_distances = zeros(10,1);

for i=1:1:10
      exp_distances(i) = exp(-distance(centres{i},profil_chiffre,d));
      somme_exp = somme_exp + exp_distances(i);
end

for i=1:1:10
      vectProba(i) = exp_distances(i)/somme_exp;
end

end


