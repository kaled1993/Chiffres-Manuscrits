function [rectangles] = extract_chiffre(I)


%nombre ligne
nbl = size(I,1);

%nombre colone
nbc = size(I,2);

%projection horizontal
pHorizontale = sum(I<50,2);

%indices prixels ligne hautes
lHautes = zeros(10,1);

%indices prixels ligne basses
lBasses = zeros(10,1);


% détermination des lignes hautes et basses des classes de chiffre
j=1;
k=1;
for i = 2:1:nbl
   if(pHorizontale(i-1)==0 && pHorizontale(i)~=0 )
        lHautes(j)=i-1;
        j=j+1;
   elseif(pHorizontale(i-1)~=0 && pHorizontale(i)==0 )
         lBasses(k)=i;
        k=k+1;
   end
end

%initialisation des vecteurs d'indices des colonnes.
lGauches = zeros(10,1);
lDroites = zeros(10,1);


% détermination les extrimités gauches et droites pour chaque chiffre
for i = 1:1:10
    bande = I(lHautes(i):lBasses(i),:);
    %projection Verticale
    pVerticale = sum(bande<50,1);
    
    j=1;
    k=1;
    for m = 2:1:nbc 
        if(pVerticale(m-1)==0 && pVerticale(m)~=0 )
            lGauches(i,j)=m-1;
            j=j+1;
        elseif(pVerticale(m-1)~=0 && pVerticale(m)==0 )
            lDroites(i,k)=m;
            k=k+1;
        end 
    end
end

rectangles = cell(size(lGauches));

% détermination des rectangles engloblants
for i=1:1:size(rectangles,1)
    for m=1:1:size(rectangles,2)
        
       bande2 = I(lHautes(i):lBasses(i),lGauches(i,m):lDroites(i,m));
       pHorizontale2 = sum(bande2<50,2);
       
       for x= 2:1:size(pHorizontale2)
            if(pHorizontale2(x-1)==0 && pHorizontale2(x)~=0 )
                lHaute2=lHautes(i)+x-2;
            elseif(pHorizontale2(x-1)~=0 && pHorizontale2(x)==0 )
                lBasse2=lHautes(i)+x-1;
            end
        end
        
       rectangles{i,m} = [ lHaute2, lGauches(i,m) ;lBasse2, lDroites(i,m)];
        
    end
end

end