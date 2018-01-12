%Script permettant d'executer le classifieur 2 en faisant varier la taille
%de la matrice de densité dans un premier temps puis en fait varier k dans
%un deuxiéme test

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

N = 20;
M = 20;
K = 20;

taux1 = zeros(N,M);
% en varie dans un premier lieu la matrice de dansité 
for n=1:1:N
    for m=1:1:M
        densites = apprentissage_densite_chiffres(Extrait_base,ImageBase ,n, m);
        [Proba,taux1(n,m)] = calcule_taux_reconnaissance( Extrait_test , Extrait_base,ImageTest,densites, n, m, K );
    end
end
%tracé la graphe. 
figure , surf(taux1);
ylabel('n');
xlabel('m');
zlabel('Taux de reconnaissance');



%on varie k et n=m
taux2 = zeros(N,K);
MaxTaux = 0.0 ;

for n=1:1:N
    for k=1:1:K
       densites = apprentissage_densite_chiffres(Extrait_base,ImageBase ,n, n);
        [Proba,taux2(n,k)] = calcule_taux_reconnaissance( Extrait_test , Extrait_base,ImageTest,densites, n, n, k );
    end
    if(MaxTaux<max(taux2))
    MaxTaux=max(taux2) ;
    Proba2=Proba ;
    end
end

 max(MaxTaux)
figure , surf(taux2);
ylabel('n=m');
xlabel('k');
zlabel('Taux de reconnaissance');


save('vecteurs_proba_classifieur2.mat','Proba2');
save('../combinaison/vecteurs_proba_classifieur2.mat','Proba2');

