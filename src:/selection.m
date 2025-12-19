function selected=selection(fitness,initMat)

%lower the distance;higher the fit
q05=quantile(fitness,.05);

ind=find(fitness<=q05);

selected=initMat(ind,:);

end