function [ vecteurs_densites ] = apprentissage_densite_chiffres(Extrait_base,ImageBase ,n, m)
%Détermine le vecteur caractéristique de chacun des chiffres de la base I.

vecteurs_densites = cell(size(Extrait_base,1),size(Extrait_base,2));

for i=1:1:size(Extrait_base,1)
    for j=1:1:size(Extrait_base,2)
        vecteurs_densites{i,j} = calcul_densites(Extrait_base{i,j},ImageBase,n,m);
    end
end

end
