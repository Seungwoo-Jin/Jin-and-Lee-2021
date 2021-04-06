function [thisCLST, Time, TrialNumber] = GetSpikeOutboundFlag(thisCLST, TrialNumber, Time)
rowSpike=length(thisCLST.t);
thisCLST.Flag_OutboundSpk_Track=zeros(rowSpike,1);
thisCLST.Flag_OutboundSpk=zeros(rowSpike,1);
Time.latency=zeros(1,TrialNumber.Trial);
for j=1:TrialNumber.Trial
    if j==1
        Time.latency(j)=Time.Choice(j,1)-Time.Entry(j,1);
        for i=1:rowSpike
            if (thisCLST.t(i)>=(Time.Entry(j,1)))&&(thisCLST.t(i)<Time.Choice(j,1))&&(thisCLST.SmoothingVelocity(i) > 5)
                thisCLST.Flag_OutboundSpk_Track(i)=j;  
            end
        end

    elseif (j~=1) %
        for i=1:rowSpike
            if (thisCLST.t(i)>=(Time.Choice(j-1,1)+Time.LeaveRewardZone(j-1,1)))&&(thisCLST.t(i)<Time.Choice(j,1))&&(thisCLST.SmoothingVelocity(i) > 5)
                thisCLST.Flag_OutboundSpk_Track(i)=j;                    
            end
        end
    end
end
%
for j=1:TrialNumber.Trial
    if j==1
        for i=1:rowSpike
            if (thisCLST.t(i)>=Time.Entry(j,1))&&(thisCLST.t(i)<Time.Choice(j,1))&&(thisCLST.SmoothingVelocity(i) > 5)
                thisCLST.Flag_OutboundSpk(i)=j;  
            end
        end

    elseif (j~=1) %
        for i=1:rowSpike
            if (thisCLST.t(i)>=Time.Choice(j-1,1))&&(thisCLST.t(i)<Time.Choice(j,1))&&(thisCLST.SmoothingVelocity(i) > 5)
                thisCLST.Flag_OutboundSpk(i)=j;                    
            end
        end
    end
end

%% Individual
thisCLST.Flag_OutboundSpk_Individual_Track=cell(1,TrialNumber.Trial);
thisCLST.Flag_OutboundSpk_Individual=cell(1,TrialNumber.Trial);
for j=1:TrialNumber.Trial
    thisCLST.Flag_OutboundSpk_Individual_Track{1,j}=logical(thisCLST.Flag_OutboundSpk_Track==j);
    thisCLST.Flag_OutboundSpk_Individual{1,j}=logical(thisCLST.Flag_OutboundSpk==j);
end

%% Total
thisCLST.Flag_OutboundSpk_Odd_Total_Track{1,1}=zeros(rowSpike,1);
thisCLST.Flag_OutboundSpk_Odd_Total{1,1}=zeros(rowSpike,1);
% thisCLST.Flag_VM_OutboundSpk_Odd_Total{1,1}=zeros(row,1);
for i=1:2:TrialNumber.Trial
    if ~sum(i==TrialNumber.VOID)
        thisCLST.Flag_OutboundSpk_Odd_Total_Track{1,1}=thisCLST.Flag_OutboundSpk_Odd_Total_Track{1,1}|thisCLST.Flag_OutboundSpk_Individual_Track{1,i};
        thisCLST.Flag_OutboundSpk_Odd_Total{1,1}=thisCLST.Flag_OutboundSpk_Odd_Total{1,1}|thisCLST.Flag_OutboundSpk_Individual{1,i};
%         if ~sum(i==TrialNumber.VL)
%             thisCLST.Flag_VM_OutboundSpk_Odd_Total{1,1}=thisCLST.Flag_OutboundSpk_Odd_Total{1,1}|thisCLST.Flag_OutboundSpk_Individual{1,i};
%         end
    end
end
thisCLST.Flag_OutboundSpk_Even_Total_Track{1,1}=zeros(rowSpike,1);
thisCLST.Flag_OutboundSpk_Even_Total{1,1}=zeros(rowSpike,1);
% thisCLST.Flag_VM_OutboundSpk_Even_Total{1,1}=zeros(row,1);
for i=2:2:TrialNumber.Trial
    if ~sum(i==TrialNumber.VOID)
        thisCLST.Flag_OutboundSpk_Even_Total_Track{1,1}=thisCLST.Flag_OutboundSpk_Even_Total_Track{1,1}|thisCLST.Flag_OutboundSpk_Individual_Track{1,i};
        thisCLST.Flag_OutboundSpk_Even_Total{1,1}=thisCLST.Flag_OutboundSpk_Even_Total{1,1}|thisCLST.Flag_OutboundSpk_Individual{1,i};
%         if ~sum(i==TrialNumber.VL)
%             thisCLST.Flag_VM_OutboundSpk_Even_Total{1,1}=thisCLST.Flag_OutboundSpk_Even_Total{1,1}|thisCLST.Flag_OutboundSpk_Individual{1,i};
%         end
    end
end

%% B1
thisCLST.Flag_OutboundSpk_Odd_B1_Track{1,1}=zeros(rowSpike,1);
thisCLST.Flag_OutboundSpk_Odd_B1{1,1}=zeros(rowSpike,1);
% thisCLST.Flag_VM_OutboundSpk_Odd_B1{1,1}=zeros(row,1);
for i=TrialNumber.Block(1)+1:2:TrialNumber.Block(2)
    if ~sum(i==TrialNumber.VOID)
        thisCLST.Flag_OutboundSpk_Odd_B1_Track{1,1}=thisCLST.Flag_OutboundSpk_Odd_B1_Track{1,1}|thisCLST.Flag_OutboundSpk_Individual_Track{1,i};
        thisCLST.Flag_OutboundSpk_Odd_B1{1,1}=thisCLST.Flag_OutboundSpk_Odd_B1{1,1}|thisCLST.Flag_OutboundSpk_Individual{1,i};
%         if ~sum(i==TrialNumber.VL)
%             thisCLST.Flag_VM_OutboundSpk_Odd_B1{1,1}=thisCLST.Flag_OutboundSpk_Odd_B1{1,1}|thisCLST.Flag_OutboundSpk_Individual{1,i};
%         end
    end
end
thisCLST.Flag_OutboundSpk_Even_B1_Track{1,1}=zeros(rowSpike,1);
thisCLST.Flag_OutboundSpk_Even_B1{1,1}=zeros(rowSpike,1);
% thisCLST.Flag_VM_OutboundSpk_Even_B1{1,1}=zeros(row,1);
for i=TrialNumber.Block(1)+2:2:TrialNumber.Block(2)
    if ~sum(i==TrialNumber.VOID)
        thisCLST.Flag_OutboundSpk_Even_B1_Track{1,1}=thisCLST.Flag_OutboundSpk_Even_B1_Track{1,1}|thisCLST.Flag_OutboundSpk_Individual_Track{1,i};
        thisCLST.Flag_OutboundSpk_Even_B1{1,1}=thisCLST.Flag_OutboundSpk_Even_B1{1,1}|thisCLST.Flag_OutboundSpk_Individual{1,i};
%         if ~sum(i==TrialNumber.VL)
%             thisCLST.Flag_VM_OutboundSpk_Even_B1{1,1}=thisCLST.Flag_OutboundSpk_Even_B1{1,1}|thisCLST.Flag_OutboundSpk_Individual{1,i};
%         end
    end
end

%% B2
thisCLST.Flag_OutboundSpk_Odd_B2_Track{1,1}=zeros(rowSpike,1);
thisCLST.Flag_OutboundSpk_Odd_B2{1,1}=zeros(rowSpike,1);
% thisCLST.Flag_VM_OutboundSpk_Odd_B2{1,1}=zeros(row,1);
for i=TrialNumber.Block(2)+1:2:TrialNumber.Block(3)
    if ~sum(i==TrialNumber.VOID)
        thisCLST.Flag_OutboundSpk_Odd_B2_Track{1,1}=thisCLST.Flag_OutboundSpk_Odd_B2_Track{1,1}|thisCLST.Flag_OutboundSpk_Individual_Track{1,i};
        thisCLST.Flag_OutboundSpk_Odd_B2{1,1}=thisCLST.Flag_OutboundSpk_Odd_B2{1,1}|thisCLST.Flag_OutboundSpk_Individual{1,i};
%         if ~sum(i==TrialNumber.VL)
%             thisCLST.Flag_VM_OutboundSpk_Odd_B2{1,1}=thisCLST.Flag_OutboundSpk_Odd_B2{1,1}|thisCLST.Flag_OutboundSpk_Individual{1,i};
%         end
    end
end
thisCLST.Flag_OutboundSpk_Even_B2_Track{1,1}=zeros(rowSpike,1);
thisCLST.Flag_OutboundSpk_Even_B2{1,1}=zeros(rowSpike,1);
% thisCLST.Flag_VM_OutboundSpk_Even_B2{1,1}=zeros(row,1);
for i=TrialNumber.Block(2)+2:2:TrialNumber.Block(3)
    if ~sum(i==TrialNumber.VOID)
        thisCLST.Flag_OutboundSpk_Even_B2_Track{1,1}=thisCLST.Flag_OutboundSpk_Even_B2_Track{1,1}|thisCLST.Flag_OutboundSpk_Individual_Track{1,i};
        thisCLST.Flag_OutboundSpk_Even_B2{1,1}=thisCLST.Flag_OutboundSpk_Even_B2{1,1}|thisCLST.Flag_OutboundSpk_Individual{1,i};
%         if ~sum(i==TrialNumber.VL)
%             thisCLST.Flag_VM_OutboundSpk_Even_B2{1,1}=thisCLST.Flag_OutboundSpk_Even_B2{1,1}|thisCLST.Flag_OutboundSpk_Individual{1,i};
%         end
    end
end

%% B3
thisCLST.Flag_OutboundSpk_Odd_B3_Track{1,1}=zeros(rowSpike,1);
thisCLST.Flag_OutboundSpk_Odd_B3{1,1}=zeros(rowSpike,1);
% thisCLST.Flag_VM_OutboundSpk_Odd_B3{1,1}=zeros(row,1);
for i=TrialNumber.Block(3)+1:2:TrialNumber.Block(4)
    if ~sum(i==TrialNumber.VOID)
        thisCLST.Flag_OutboundSpk_Odd_B3_Track{1,1}=thisCLST.Flag_OutboundSpk_Odd_B3_Track{1,1}|thisCLST.Flag_OutboundSpk_Individual_Track{1,i};
        thisCLST.Flag_OutboundSpk_Odd_B3{1,1}=thisCLST.Flag_OutboundSpk_Odd_B3{1,1}|thisCLST.Flag_OutboundSpk_Individual{1,i};
%         if ~sum(i==TrialNumber.VL)
%             thisCLST.Flag_VM_OutboundSpk_Odd_B3{1,1}=thisCLST.Flag_OutboundSpk_Odd_B3{1,1}|thisCLST.Flag_OutboundSpk_Individual{1,i};
%         end
    end
end
thisCLST.Flag_OutboundSpk_Even_B3_Track{1,1}=zeros(rowSpike,1);
thisCLST.Flag_OutboundSpk_Even_B3{1,1}=zeros(rowSpike,1);
% thisCLST.Flag_VM_OutboundSpk_Even_B3{1,1}=zeros(row,1);
for i=TrialNumber.Block(3)+2:2:TrialNumber.Block(4)
    if ~sum(i==TrialNumber.VOID)
        thisCLST.Flag_OutboundSpk_Even_B3_Track{1,1}=thisCLST.Flag_OutboundSpk_Even_B3_Track{1,1}|thisCLST.Flag_OutboundSpk_Individual_Track{1,i};
        thisCLST.Flag_OutboundSpk_Even_B3{1,1}=thisCLST.Flag_OutboundSpk_Even_B3{1,1}|thisCLST.Flag_OutboundSpk_Individual{1,i};
%         if ~sum(i==TrialNumber.VL)
%             thisCLST.Flag_VM_OutboundSpk_Even_B3{1,1}=thisCLST.Flag_OutboundSpk_Even_B3{1,1}|thisCLST.Flag_OutboundSpk_Individual{1,i};
%         end
    end
end

%% B4
thisCLST.Flag_OutboundSpk_Odd_B4_Track{1,1}=zeros(rowSpike,1);
thisCLST.Flag_OutboundSpk_Odd_B4{1,1}=zeros(rowSpike,1);
% thisCLST.Flag_VM_OutboundSpk_Odd_B4{1,1}=zeros(row,1);
for i=TrialNumber.Block(4)+1:2:TrialNumber.Block(5)
    if ~sum(i==TrialNumber.VOID)
        thisCLST.Flag_OutboundSpk_Odd_B4_Track{1,1}=thisCLST.Flag_OutboundSpk_Odd_B4_Track{1,1}|thisCLST.Flag_OutboundSpk_Individual_Track{1,i};
        thisCLST.Flag_OutboundSpk_Odd_B4{1,1}=thisCLST.Flag_OutboundSpk_Odd_B4{1,1}|thisCLST.Flag_OutboundSpk_Individual{1,i};
%         if ~sum(i==TrialNumber.VL)
%             thisCLST.Flag_VM_OutboundSpk_Odd_B4{1,1}=thisCLST.Flag_OutboundSpk_Odd_B4{1,1}|thisCLST.Flag_OutboundSpk_Individual{1,i};
%         end
    end
end
thisCLST.Flag_OutboundSpk_Even_B4_Track{1,1}=zeros(rowSpike,1);
thisCLST.Flag_OutboundSpk_Even_B4{1,1}=zeros(rowSpike,1);
% thisCLST.Flag_VM_OutboundSpk_Even_B4{1,1}=zeros(row,1);
for i=TrialNumber.Block(4)+2:2:TrialNumber.Block(5)
    if ~sum(i==TrialNumber.VOID)
        thisCLST.Flag_OutboundSpk_Even_B4_Track{1,1}=thisCLST.Flag_OutboundSpk_Even_B4_Track{1,1}|thisCLST.Flag_OutboundSpk_Individual_Track{1,i};
        thisCLST.Flag_OutboundSpk_Even_B4{1,1}=thisCLST.Flag_OutboundSpk_Even_B4{1,1}|thisCLST.Flag_OutboundSpk_Individual{1,i};
%         if ~sum(i==TrialNumber.VL)
%             thisCLST.Flag_VM_OutboundSpk_Even_B4{1,1}=thisCLST.Flag_OutboundSpk_Even_B4{1,1}|thisCLST.Flag_OutboundSpk_Individual{1,i};
%         end
    end
end
