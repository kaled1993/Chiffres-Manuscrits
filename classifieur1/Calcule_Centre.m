function [ centres ] = Calcule_Centre(ExtraitBase,ImageBase,d)
%Détermine le centre de chacun des 10 classes de chiffres.


% centres  = cellule contenant les centres de chaque classe de chiffres
centres = cell(10,1);


somme = zeros(2*d,1);

for i=1:1:10 
    for j=1:1:size(ExtraitBase,2)
        somme = somme + profils_extraction(ExtraitBase{i,j},ImageBase,d);
    end
        somme = somme /size(ExtraitBase,2);
        centres{i} = somme;
end

end
