function initMat =initPop(numMem,waveletLength,w)
initMat=zeros(numMem,waveletLength);
MAX_T=20;

wsize=(2*pi)/waveletLength;
x=-pi:wsize:pi;

len=length(x);
if(len>waveletLength)
    for i=1:(len-waveletLength)
        r=randi(length(x),1);
        x(r)=[];
    end
elseif(length(x)<waveletLength)
    'WHAT?WHY?!?!'
end

MAX_A=2*max(w);
MAX_B=1000;
MAX_C=1000;

MAX_D=2*max(w);
MAX_E=1000;
MAX_F=1000;

for i=1:numMem
    T=randi(MAX_T,1);
    sum=zeros(1,waveletLength);
    for j=1:T
        selector=randi(2,1);
        
        if(selector==1)
            A=-MAX_A+(MAX_A*2)*rand(1,1);%[-MAX_A,MAX_A]
            B=-MAX_B+(MAX_B*2)*rand(1,1);
            C=-MAX_C+(MAX_C*2)*rand(1,1);
            sum=sum+A*sin(B*x +C);
        else
            D=-MAX_D+(MAX_D*2)*rand(1,1);
            E=-MAX_E+(MAX_E*2)*rand(1,1);
            F=-MAX_F+(MAX_F*2)*rand(1,1);
            sum=sum+D*cos(E*x +F);
        end
        
    end
    initMat(i,:)=sum;
end





end