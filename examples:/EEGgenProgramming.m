%extract actual wavelet
tic

%extract wavelet
n=1000;
w=EegData{n}(:,2);
% t=Data{n}(:,1);
% fs=25;
% w=extractWavelet(x,t,fs);
plot(w)


%init population
numMem=50;
waveletLength=length(w);
initMat =initPop(numMem,waveletLength);

%fitness
fitness=computeFitness(w,initMat);

ITERATION=70000;
FIT=zeros(ITERATION,length(fitness));
iter=1;
FIT(iter,:)=fitness;
FIT_MEAN=zeros(1,ITERATION);

nextPop=initMat;

% while(iter<ITERATION)
%     
%     [fitness,nextPop]=generational(fitness,nextPop,w);
%     iter=iter+1;
%     FIT(iter,:)=fitness;
%     FIT_MEAN(iter)=mean(fitness);
%     plot(FIT(iter,:));
% end

bestFit=1000;
while(~(bestFit>0 && bestFit<.1) && iter<ITERATION)
    [fitness,nextPop]=generational(fitness,nextPop,w);
    iter=iter+1;
    FIT(iter,:)=fitness;
    FIT_MEAN(iter)=mean(fitness);
    [bestFit,~]=min(fitness);
    
end

[mostFit,id]=min(fitness);
mostFit
figure;hold all;plot(w);plot(nextPop(id,:))
figure;hold all;plot(FIT_MEAN);
figure;hold all;plot(fitness);
dtw(w,nextPop(id,:))

toc