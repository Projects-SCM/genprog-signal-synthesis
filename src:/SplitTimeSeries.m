function wavelets=SplitTimeSeries(x,wsize)
wavelets=[];

st=1:wsize:length(x);
en=wsize:wsize:length(x);
if(length(st)>length(en))
    en=[en,length(x)];
end

for i=1:length(st)
    wavelets{i}=x(st(i):en(i));
end

end