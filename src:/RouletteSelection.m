function parents =RouletteSelection(fitness,initMat)
[r,c]=size(initMat);

f=fitness/sum(fitness);%normalizing so that sum  equals 1


parents=zeros(2,c);
%Select 2 parents
for i=1:2
    rrand=rand(1,1);
    s=0;
    for j=1:r
        s=s+f(j);
        s
        if(s>rrand)
            parents(i,:)=initMat(j,:);
            break;
        end
    end
   
end