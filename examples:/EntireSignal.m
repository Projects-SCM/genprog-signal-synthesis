tic

%extract wavelet
n=1;
x=data(n,2:end);
wsize=50;
wmat=SplitTimeSeries(x,wsize);

len=length(wmat);

syn_x=[];
len
for kk=1:len
    w=wmat(kk,:);
    numMem=50;
    waveletLength=length(w);
    initMat =initPop(numMem,waveletLength,w);

    %fitness
    fitness=computeFitness2(w,initMat);

    ITERATION=20000;
    FIT=zeros(ITERATION,length(fitness));
    iter=1;
    FIT(iter,:)=fitness;
    FIT_MEAN=zeros(1,ITERATION);

    nextPop=initMat;


    bestFit=1000;
    while(~(bestFit>0 && bestFit<.5) && iter<ITERATION)
        [fitness,nextPop]=generational(fitness,nextPop,w);
        iter=iter+1;
        FIT(iter,:)=fitness;
        FIT_MEAN(iter)=mean(fitness);
        [bestFit,~]=min(fitness);

    end
    
    [mostFit,id]=min(fitness);
    syn_x=[syn_x,nextPop(id,:)];
    kk
end

figure; hold all; plot(x);plot(syn_x);
dtw(x,syn_x)

toc