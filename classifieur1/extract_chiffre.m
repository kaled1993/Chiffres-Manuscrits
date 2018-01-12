function [tableau_rectangles_englobants] = localisation_extraction_chiffre(I)
%Fonction permettant d'extraire les chiffres de l'image et de déterminer
%leurs rectangles englobants
% Paramètres : 
%   I : matrice de l'image issue de imread
% Sorite : 
%   tableau_rectangles_englobants : cellule contenant les matrices 
%   représentant les rectangles englobants de chaque chiffre de l'image 
%   passée en paramètre 

nbLignes = size(I,1);

nbColonnes = size(I,2);

projectionHorizontale = sum(I<50,2);

indicesLignesHautes = zeros(10,1);

indicesLignesBasses = zeros(10,1);


% détermination des lignes hautes et basses des classes de chiffre
j=1;
k=1;
for i = 2:1:nbLignes 
   if(projectionHorizontale(i-1)==0 && projectionHorizontale(i)~=0 )
        indicesLignesHautes(j)=i-1;
        j=j+1;
   elseif(projectionHorizontale(i-1)~=0 && projectionHorizontale(i)==0 )
         indicesLignesBasses(k)=i;
        k=k+1;
   end
end

%initialisation des vecteurs d'indices. La taille en colonne sera mise à
%jour après l'étude de l'image
indicesLignesGauches = zeros(10,1);

indicesLignesDroites = zeros(10,1);


% détermination des lignes gauches et droites pour chaque chi
for i = 1:1:10
    bande = I(indicesLignesHautes(i):indicesLignesBasses(i),:);
    projectionVerticale = sum(bande<50,1);
    
    j=1;
    k=1;
    for m = 2:1:nbColonnes 
        if(projectionVerticale(m-1)==0 && projectionVerticale(m)~=0 )
            indicesLignesGauches(i,j)=m-1;
            j=j+1;
        elseif(projectionVerticale(m-1)~=0 && projectionVerticale(m)==0 )
            indicesLignesDroites(i,k)=m;
            k=k+1;
        end 
    end
end

tableau_rectangles_englobants = cell(size(indicesLignesGauches));

% détermination des rectangles engloblants
for i=1:1:size(tableau_rectangles_englobants,1)
    for m=1:1:size(tableau_rectangles_englobants,2)
        
       bande2 = I(indicesLignesHautes(i):indicesLignesBasses(i),indicesLignesGauches(i,m):indicesLignesDroites(i,m));
       projectionHorizontale2 = sum(bande2<50,2);
       
       for x= 2:1:size(projectionHorizontale2)
            if(projectionHorizontale2(x-1)==0 && projectionHorizontale2(x)~=0 )
                nouvelleLigneHaute=indicesLignesHautes(i)+x-2;
            elseif(projectionHorizontale2(x-1)~=0 && projectionHorizontale2(x)==0 )
                nouvelleLigneBasse=indicesLignesHautes(i)+x-1;
            end
        end
        
       tableau_rectangles_englobants{i,m} = [ nouvelleLigneHaute, indicesLignesGauches(i,m) ;
                                              nouvelleLigneBasse, indicesLignesDroites(i,m)];
        
    end
end

end