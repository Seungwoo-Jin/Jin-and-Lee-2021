load('Figure4.mat');
%% Figure 4A-i
load(['Rat448-Main2-PositionData.mat']);
load(['Rat448-Main2-TT24-C1.mat']);
RasterInfo.Left=2; RasterInfo.Right=1;
thisCLST = GetSpikePosition(thisCLST,Pos);
thisCLST = GetSpikeOutboundFlag(thisCLST, TrialNumber, Time);
[PETHspike] = PeriEventTimeHistogram_Spike(TrialNumber, thisCLST, Time, RasterInfo);

% 3D plotting
FiringRate_3D=zeros(size(PETHspike.Choice,1),60);
for i=1:size(PETHspike.Choice,1)
    for j=1:size(PETHspike.Choice,2)
        temp=PETHspike.Choice(i,j);
        if ~isnan(temp)
            temp=ceil((temp+4)*10);
            FiringRate_3D(i,temp) = FiringRate_3D(i,temp) +1;
        end
    end
end
FiringRate_3D=FiringRate_3D*10;

fig=figure; hold on;
set(fig,'position', [0 0 600 600]);
%
for i=2:2:size(FiringRate_3D,1)
    x = i/2 * ones(1,60);
    temp1=GetGaussianSmoothing(FiringRate_3D(i,1:40),11);
    temp2=GetGaussianSmoothing(FiringRate_3D(i,41:60),11);
    temp=[temp1 temp2];
    p=plot3(x(1:40),1:40,temp(1:40),'--'); p.LineWidth=0.5; p.Color = [0 0 0]/255; p.MarkerSize=12;
    p=plot3(x(40:60),40:60,temp(40:60),'-'); p.LineWidth=0.5; p.Color = [0 0 0]/255; p.MarkerSize=12;
end
xlim([(TrialNumber.Block(2) - 7)/2 (TrialNumber.Block(2) + 9)/2]);
g=gca; 
g.ZAxis.TickValues=0:5:30;
grid off
g=gca;
g.YDir='rev';
grid on
FontSize=8;
set(gca,'FontSize',FontSize,'FontWeight','bold');

%% Figure 4A-ii
load('Rat448-Main4-TT24-C1_p2.mat')
% B1
temp1 = InFieldRate(MoreActiveField.Even).Even_B1_Individual; 
% B2
temp2 = InFieldRate(MoreActiveField.Even).Even_B2_Individual;
% B3
temp3 = InFieldRate(MoreActiveField.Even).Even_B3_Individual;
% B4
temp4 = InFieldRate(MoreActiveField.Even).Even_B4_Individual;    
clear temp
temp=[temp1 temp2 temp3 temp4];

figure; hold on; 
title('Rat448-Main4-TT24-C1_p2.mat')
p1=plot(temp,'.k-'); p1.MarkerSize=10;
g=gca;
l1=line([length(temp1)+0.5 length(temp1)+0.5], g.YLim); l1.Color='r'; l1.LineStyle='--';
l1=line([length(temp1)+length(temp2)+0.5 length(temp1)+length(temp2)+0.5], g.YLim); l1.Color='r'; l1.LineStyle='--';
l1=line(g.XLim, [max(temp) max(temp)]); l1.Color='b'; l1.LineStyle='-';
l1=line(g.XLim, [max(temp)*0.2 max(temp)*0.2]); l1.Color='b'; l1.LineStyle='--';    

%% Figure 4D
% Cumulative, "ON" cell
Timing_SS_iHP_Odd=[];
for i=1:length(Timing.SS.iHP_Odd)
        Timing_SS_iHP_Odd(end+1)=Timing.SS.iHP_Odd(i);
end
Timing_SSCR_iHP_Odd=[];
for i=1:length(Timing.SSCR.iHP_Odd)
        Timing_SSCR_iHP_Odd(end+1)=Timing.SSCR.iHP_Odd(i);
end
Timing_FLCR_iHP_Odd=[];
for i=1:length(Timing.FLCR.iHP_Odd)
        Timing_FLCR_iHP_Odd(end+1)=Timing.FLCR.iHP_Odd(i);
end
Timing_SSFL_iHP_Odd=[];
for i=1:length(Timing.SSFL.iHP_Odd)
        Timing_SSFL_iHP_Odd(end+1)=Timing.SSFL.iHP_Odd(i);
end


Timing_SS_iHP_Even=[];
for i=1:length(Timing.SS.iHP_Even)
        Timing_SS_iHP_Even(end+1)=Timing.SS.iHP_Even(i);
end
Timing_SSCR_iHP_Even=[];
for i=1:length(Timing.SSCR.iHP_Even)
        Timing_SSCR_iHP_Even(end+1)=Timing.SSCR.iHP_Even(i);
end
Timing_FLCR_iHP_Even=[];
for i=1:length(Timing.FLCR.iHP_Even)
        Timing_FLCR_iHP_Even(end+1)=Timing.FLCR.iHP_Even(i);
end
Timing_SSFL_iHP_Even=[];
for i=1:length(Timing.SSFL.iHP_Even)
        Timing_SSFL_iHP_Even(end+1)=Timing.SSFL.iHP_Even(i);
end

Timing_SS_dHP_Odd=[];
for i=1:length(Timing.SS.dHP_Odd)
        Timing_SS_dHP_Odd(end+1)=Timing.SS.dHP_Odd(i);
end
Timing_SSCR_dHP_Odd=[];
for i=1:length(Timing.SSCR.dHP_Odd)
        Timing_SSCR_dHP_Odd(end+1)=Timing.SSCR.dHP_Odd(i);
end
Timing_FLCR_dHP_Odd=[];
for i=1:length(Timing.FLCR.dHP_Odd)
        Timing_FLCR_dHP_Odd(end+1)=Timing.FLCR.dHP_Odd(i);
end
Timing_SSFL_dHP_Odd=[];
for i=1:length(Timing.SSFL.dHP_Odd)
        Timing_SSFL_dHP_Odd(end+1)=Timing.SSFL.dHP_Odd(i);
end


Timing_SS_dHP_Even=[];
for i=1:length(Timing.SS.dHP_Even)
        Timing_SS_dHP_Even(end+1)=Timing.SS.dHP_Even(i);
end
Timing_SSCR_dHP_Even=[];
for i=1:length(Timing.SSCR.dHP_Even)
        Timing_SSCR_dHP_Even(end+1)=Timing.SSCR.dHP_Even(i);
end
Timing_FLCR_dHP_Even=[];
for i=1:length(Timing.FLCR.dHP_Even)
        Timing_FLCR_dHP_Even(end+1)=Timing.FLCR.dHP_Even(i);
end
Timing_SSFL_dHP_Even=[];
for i=1:length(Timing.SSFL.dHP_Even)
        Timing_SSFL_dHP_Even(end+1)=Timing.SSFL.dHP_Even(i);
end

temp=30;
iHP_Value=[Timing_SSCR_iHP_Odd(Timing_SSCR_iHP_Odd<=temp) Timing_SSCR_iHP_Even(Timing_SSCR_iHP_Even<=temp)...
    Timing_FLCR_iHP_Odd(Timing_FLCR_iHP_Odd<=temp) Timing_FLCR_iHP_Even(Timing_FLCR_iHP_Even<=temp)];
iHP_Same=[Timing_SS_iHP_Odd(Timing_SS_iHP_Odd<=temp) Timing_SS_iHP_Even(Timing_SS_iHP_Even<=temp) ...
    Timing_SSFL_iHP_Odd(Timing_SSFL_iHP_Odd<=temp) Timing_SSFL_iHP_Even(Timing_SSFL_iHP_Even<=temp)];
iHP_Same1=[Timing_SSFL_iHP_Odd(Timing_SSFL_iHP_Odd<=temp) Timing_SSFL_iHP_Even(Timing_SSFL_iHP_Even<=temp)];
iHP_Same2=[Timing_SS_iHP_Odd(Timing_SS_iHP_Odd<=temp) Timing_SS_iHP_Even(Timing_SS_iHP_Even<=temp)];
dHP_Value=[Timing_SSCR_dHP_Odd(Timing_SSCR_dHP_Odd<=temp) Timing_SSCR_dHP_Even(Timing_SSCR_dHP_Even<=temp)...
    Timing_FLCR_dHP_Odd(Timing_FLCR_dHP_Odd<=temp) Timing_FLCR_dHP_Even(Timing_FLCR_dHP_Even<=temp)];
dHP_Same=[Timing_SS_dHP_Odd(Timing_SS_dHP_Odd<=temp) Timing_SS_dHP_Even(Timing_SS_dHP_Even<=temp)... 
    Timing_SSFL_dHP_Odd(Timing_SSFL_dHP_Odd<=temp) Timing_SSFL_dHP_Even(Timing_SSFL_dHP_Even<=temp)];
dHP_Value(6)=[]; % remove minus value;

% % Statistical testing
[h,p, STAT]=chi2cont([11 28; 2 20; 1 20]);
[h,p, STAT]=chi2cont([11 28; 2 20]);
[h,p, STAT]=chi2cont([11 28; 1 20;]);

figure; hold on;
cdfplot(iHP_Value);
cdfplot(iHP_Same);
cdfplot(dHP_Value);
cdfplot(dHP_Same);

