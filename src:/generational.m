function [fitness,nextPop]=generational(fitness,initMat,w)
    nextPop=initMat;
    [r,c]=size(initMat);
    
    for i=1:r
        parents=TournamentSelection(fitness,nextPop);
        selectorBit=2;
        randomBit=0;
        offsprings=crossover(parents,selectorBit,randomBit);
        offsprings=mutation(offsprings);

        f_ofs=computeFitness2(w,offsprings);
        [leastFit,id]=max(fitness);
        if(f_ofs<leastFit)
            fitness(id)=f_ofs;
            nextPop(id,:)=offsprings;
        end
    end

end