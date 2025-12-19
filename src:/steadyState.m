function [fitness,nextPop]=steadyState(fitness,initMat,w)
    
    parents=TournamentSelection(fitness,initMat);
    selectorBit=2;
    randomBit=0;
    offsprings=crossover(parents,selectorBit,randomBit);
    offsprings=mutation(offsprings);
    
    f_ofs=computeFitness(w,offsrpings);
    [leastFit,id]=max(fitness);
    if(f_ofs<leastFit)
        fitness(id)=f_ofs;
        nextPop=initMat;
        nextPop(id,:)=offsprings;
    end
    
end