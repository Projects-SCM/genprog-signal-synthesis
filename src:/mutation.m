function offspring=mutation(offspring)

    function ofs=Random(ofs)
        [r,c]=size(ofs);
        rind=randi(c,1);
        ofs(rind)=ofs(rind)+rand(1,1);
    end

    function ofs=Swap(ofs)
        [r,c]=size(ofs);
        rind=randi(c,1);
        rind2=randi(c,1);
        temp=ofs(rind);
        ofs(rind)=ofs(rind2);
        ofs(rind2)=temp;
    end

    function ofs=Scramble(ofs)
        [r,c]=size(ofs);
        rind=randi(c,1);
        rind2=randi(c,1);
        
        if(rind<rind2)
        elseif(rind>rind2)
        end
    end
    
    rr=rand(1,1);
    
    if(rr>0.95)
        %mutation=1
        %random reset-1
        %swap-2
        %scramble-3
        
        ri=randi(3,1);
        if(ri==1)
            offspring=Random(offspring);
        elseif(ri==2)
            offspring=Swap(offspring);
        else
            offspring=Scramble(offspring);
        end
    end
end