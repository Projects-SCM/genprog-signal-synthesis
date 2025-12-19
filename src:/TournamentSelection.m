function parents =TournamentSelection(fitness,initMat)
[r,c]=size(initMat);
k=round(r/4);

parents=zeros(2,c);
%Select 2 parents
for i=1:2
    RandChromo=randi(r,k,1);
    fit=fitness(RandChromo);
    [a,b]=max(fit);
    parents(i,:)=initMat(RandChromo(b),:);
end