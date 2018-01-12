function [ vectProba , taux_reconnaissance ] = calcule_taux_reconnaissance( Extrait_test ,Extrait_base,ImageTest,densites, n, m, K )
%Détermine le vecteur de probabilité d'appartenance aux 10 classes
%pour tous les chiffres de l'image de test.


vectProba = cell(size(Extrait_test));

chiffresReconnus = 0;

for i=1:1:size(Extrait_test,1)
    for j=1:1:size(Extrait_test,2)
        vectProba{i,j} =  Proba_chiffre(Extrait_test{i,j},ImageTest,n,m,densites,K);
        
        % on determine l'indice en ligne du nombre reconnu
        [~ , nombreReconnu] = max(vectProba{i,j});
        
        % on le compare à l'indice du chiffre actuel 
      if nombreReconnu == i 
            chiffresReconnus = chiffresReconnus +1;
        end
    end
end

taux_reconnaissance = chiffresReconnus/100;

end

