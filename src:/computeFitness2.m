function fitness=computeFitness2(w,initMat)
[r,c]=size(initMat);
fitness=zeros(1,r);
for i=1:r
    fitness(i)=dtw(w,initMat(i,:),2)+abs(mean(w)-mean(initMat(i,:)))+abs(var(w)-var(initMat(i,:)));%abs(norm(w)-norm(initMat(i,:)));
end

end