function w=extractWavelet(x,t,fs)


tsec=floor(t);
%distinct_sec=unique(tsec);
diff_time=diff(tsec);
diff_time=[0,diff_time'];

count=0;
bound=zeros(1,length(x));
for i=1:length(diff_time)
    if(diff_time(i)==1 && count<4)
        count=count+1;
    end
    
    if(count==4)%%%% taking into account period
        bound(i)=1;
        count=0;
    end
end

%%give 1 minute to stabilize
stR=fs*60; %starting at 1500, find the first to ones in bound
onesInd=find(bound==1);

ind=randi(length(onesInd)-1,1);
st=onesInd(ind);
en=onesInd(ind+1);
count=0;
while(st<stR)
    ind=randi(length(onesInd)-1,1);
    st=onesInd(ind);
    en=onesInd(ind+1);
    count=count+1;
end

w=x(st:en);
count
% count=0;
% en=0;
% st=0;
% for i=stR:length(bound)
%     if(bound(i)==1)
%         count=count+1;
%         
%          if(count==1)
%              st=i;
%          end
%     end
%    
%     
%     if(count==2)
%         en=i;
%         break;
%     end
%    
% end

%%%xx=x(st:en);

end