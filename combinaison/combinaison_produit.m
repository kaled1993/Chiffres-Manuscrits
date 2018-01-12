function [ vectProbaFinal , tauxReconnaissance ] = combinaison_produit( vectProba1 , vectProba2 )
%Réalise la combinaison des probabilités issues des deux classifieurs par
%la méthode du produit


vectProbaFinal = cell(size(vectProba1));

chiffresReconnus = 0;

for i=1:1:size(vectProbaFinal,1)
    for j=1:1:size(vectProbaFinal,2)
        vectProbaFinal{i,j} = vectProba1{i,j} .* vectProba2{i,j};
        
        % on determine l'indice du nombre reconnu
        [~ , nombreReconnu] = max(vectProbaFinal{i,j});
        
        % on le compare à l'indice du chiffre actuel 
        if nombreReconnu == i 
            chiffresReconnus = chiffresReconnus +1;
        end
    end
end

tauxReconnaissance = chiffresReconnus/100;

end