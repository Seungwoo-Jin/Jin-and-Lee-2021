function thisCLST = GetSpikePosition(thisCLST, Pos)
rowSpike=length(thisCLST.Timestamp);
row=length(Pos.t);
thisCLST.x=zeros(rowSpike,1);
thisCLST.y=zeros(rowSpike,1);
thisCLST.t=zeros(rowSpike,1);
thisCLST.SmoothingVelocity=zeros(rowSpike,1);

k=1;
for i=1:rowSpike
    i
    for j=k:row-3
        if (thisCLST.Timestamp(i,1)>=Pos.t(j))&&(thisCLST.Timestamp(i,1)<Pos.t(j+1))
            if(thisCLST.Timestamp(i,1)-Pos.t(j))>(Pos.t(j+1)-thisCLST.Timestamp(i,1))
                thisCLST.x(i)=Pos.x(j+1);
                thisCLST.y(i)=Pos.y(j+1);
                thisCLST.t(i)=Pos.t(j+1);
                thisCLST.SmoothingVelocity(i)=Pos.SmoothingVelocity(j+1);
                k=j;
                break;
            elseif (thisCLST.Timestamp(i,1)-Pos.t(j))<=(Pos.t(j+1)-thisCLST.Timestamp(i,1))
                thisCLST.x(i)=Pos.x(j);
                thisCLST.y(i)=Pos.y(j);
                thisCLST.t(i)=Pos.t(j);
                thisCLST.SmoothingVelocity(i)=Pos.SmoothingVelocity(j);
                k=j;
                break;
            end
            
        end
    end
end
