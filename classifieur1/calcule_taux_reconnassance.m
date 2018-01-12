function [  vectProba , taux_reconnaissance ] = calcule_taux_reconnassance( ExtraitTest , ExtraitBase,ImageTest,centres, d )
%Détermine le vecteur de probabilité d'appartenance aux 10 classes
%pour tous les chiffres de l'image de test.
%vectProba : cellule contrenant vecteurs de probabilité d'appartenance des chiffres aux
%classes
%taux_reconnaissance = pourcentage de chiffres correctement identifiés

vectProba = cell(size(ExtraitTest));

chiffresReconnus = 0;

for i=1:1:size(ExtraitTest,1)
    for j=1:1:size(ExtraitTest,2)
        vectProba{i,j} = proba_chiffre(ExtraitTest{i,j},ImageTest,d,centres);
        
        % on determine le chiffre ou l'indice du nombre reconnu 
        [~ , nombreReconnu] = max(vectProba{i,j});
        
        % on le compare à l'indice au chiffre actuel si il sont egaux taux
        % de reconnaissace augmente
        if nombreReconnu == i 
            chiffresReconnus = chiffresReconnus +1;
        end
        
    end
end

taux_reconnaissance = chiffresReconnus/100;

end

