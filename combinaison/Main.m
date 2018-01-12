%Script permetant de charger les vecteurs de probabilités générés par les
%classifieurs, et realise la combinaison par somme et par produit.


clear all
close all
clc

load('vecteurs_proba_classifieur1.mat');
load('vecteurs_proba_classifieur2.mat');

[ vecteurs_proba_final_somme, taux_somme ] = combinaison_somme( Proba1 , Proba2 );
    
[ vecteurs_proba_final_produit , taux_produit ] = combinaison_produit( Proba1 , Proba2 );

taux_somme

taux_produit