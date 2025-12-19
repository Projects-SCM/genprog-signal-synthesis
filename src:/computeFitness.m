function fitness=computeFitness(w,initMat)
[r,c]=size(initMat);
fitness=zeros(1,r);
for i=1:r
    fitness(i)=dtw(w,initMat(i,:));
end

end