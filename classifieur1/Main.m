%Script permettant d'executer le classifieur 1 en faisant varier la taille des profils gauche et droit.

clear all
close all
clc
% lire image de test
ImageTest = imread('../test.tif');
% lire image d'aprentissage ou l'image de base
ImageBase = imread('../app.tif');
%extraction de rectangle englobant de chaque chiffre dans les deux image
%test et base
Extrait_test = extract_chiffre(ImageTest);
Extrait_base = extract_chiffre(ImageBase);

%N nombre de variation de d dans notre cas d varie entre 1 et 20 
N = 20;
taux = zeros(N,1);
%on calcule le taux de reconnaissance pour chaque valeur de d 
for d=1:N
    centres = Calcule_Centre(Extrait_base,ImageBase, d);
    [Proba1,taux(d)] = calcule_taux_reconnassance( Extrait_test , Extrait_base,ImageTest, centres,d );
end
save('vecteurs_proba_classifieur1.mat','Proba1');
save('../combinaison/vecteurs_proba_classifieur1.mat','Proba1');
[~,best_d] = max(taux);
max(taux)
plot(taux);
xlabel('d/2');
ylabel('Taux de reconnaissance');


