function offsprings=crossover(parents,selectorBit,randomBit)

    function ofs=OnePoint(parents)
        [rr,cc]=size(parents);
        pt=randi(cc-1,1);
        
        ofs=zeros(1,cc);
        ofs(1,1:(pt-1))=parents(1,1:(pt-1));
        ofs(1,pt:end)=parents(2,pt:end);
    end

    function ofs=TwoPoint(parents)
        [rr,cc]=size(parents);
        pt=randi(cc-1,1);
        pt2=randi(cc-1,1);
        
        if(pt2>pt)
            ofs=parents(1,:);
            ofs(pt:pt2)=parents(2,pt:pt2);
        elseif(pt2<pt)
            ofs=parents(1,:);
            ofs(pt2:pt)=parents(2,pt2:pt);
        else
            ofs=TwoPoint(parents);
        end
    end

    function ofs=Uniform(parents)
        [rr,cc]=size(parents);
        ofs=zeros(1,cc);
        
        for i=1:cc
            th=rand(1,1);
            if(th<=.5)
                ofs(i)=parents(1,i);
            else
                ofs(i)=parents(2,i);
            end
        end  
    end

    function ofs =Arithmetic(parents)
        ofs=(parents(1,:)+parents(2,:))/2;
    end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

    if(randomBit)%randomly chose a crosssover
        %one-point crossover-1
        %two-point crossover=2
        %arithmetic crossover=3
        %uniform crossover=4
        r=randi(4,1);
        if(r==1)
            offsprings=OnePoint(parents);
        elseif(r==2)
            offsprings=TwoPoint(parents);
        elseif(r==3)
            offsprings=Arithmetic(parents);
        else
            offsprings=Uniform(parents);
        end

    else %use selectbit to select a crossover
        %one-point crossover-1
        %two-point crossover=2
        %arithmetic crossover=3
        %uniform crossover=4
        if(selectorBit==1)
            offsprings=OnePoint(parents);
        elseif(selectorBit==2)
            offsprings=TwoPoint(parents);
        elseif(selectorBit==3)
            offsprings=Arithmetic(parents);
        else
            offsprings=Uniform(parents);
        end
    end
end