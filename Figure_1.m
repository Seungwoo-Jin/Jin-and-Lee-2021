%% Figure 1
load('Total Unit Information.mat');

%% Firugre 1D
% % ****** Flag of finding # of cells for specific condition ****** % %
MeanFR=0.25;
iHP = DepthFromCortex_iHP < 5.5;
vHP = DepthFromCortex_iHP >= 5.5;

main_dHP_exp = strcmp(SessionType_dHP,'SS') | strcmp(SessionType_dHP,'SSCH1') | strcmp(SessionType_dHP,'SSCH2') | strcmp(SessionType_dHP,'FRCH1') |...
    strcmp(SessionType_dHP,'FRCH2') | strcmp(SessionType_dHP,'SSFR1') | strcmp(SessionType_dHP,'SSFR2') | strcmp(SessionType_dHP,'T-SSCH1') |...
    strcmp(SessionType_dHP,'T-SSCH2') | strcmp(SessionType_dHP,'T-Quantity1') | strcmp(SessionType_dHP,'T-Quantity2');
main_iHP_exp = strcmp(SessionType_iHP,'SS') | strcmp(SessionType_iHP,'SSCH1') | strcmp(SessionType_iHP,'SSCH2') | strcmp(SessionType_iHP,'FRCH1') |...
    strcmp(SessionType_iHP,'FRCH2') | strcmp(SessionType_iHP,'SSFR1') | strcmp(SessionType_iHP,'SSFR2') | strcmp(SessionType_iHP,'T-SSCH1') |...
    strcmp(SessionType_iHP,'T-SSCH2') | strcmp(SessionType_iHP,'T-Quantity1') | strcmp(SessionType_iHP,'T-Quantity2');
%
mask_dHP_LowIsolationQuality=(Assessment_dHP < 2);
mask_dHP_HighIsolationQuality = ~mask_dHP_LowIsolationQuality;
mask_dHP_LowStability=(NumberOfSpike_dHP(:,1)==0 | NumberOfSpike_dHP(:,4)==0) & mask_dHP_HighIsolationQuality;
mask_dHP_HighStability = ~mask_dHP_LowStability;
mask_dHP_GoodCluster=mask_dHP_HighStability & mask_dHP_HighIsolationQuality;
mask_dHP_Interneuron = strcmp(Celltype_dHP,'Interneruon') & mask_dHP_HighStability & mask_dHP_HighIsolationQuality;
mask_dHP_Pyramidal = strcmp(Celltype_dHP,'Pyramidal') & mask_dHP_HighStability & mask_dHP_HighIsolationQuality;
mask_dHP_NonResponsive=(AvgFr_dHP(:,1) < MeanFR & AvgFr_dHP(:,2) < MeanFR & mask_dHP_HighIsolationQuality & mask_dHP_HighStability & mask_dHP_Pyramidal);
mask_dHP_Responsive_Both=((AvgFr_dHP(:,1) >= MeanFR & AvgFr_dHP(:,2) >= MeanFR) & mask_dHP_HighIsolationQuality & mask_dHP_HighStability & mask_dHP_Pyramidal);
mask_dHP_Responsive_OpenField=((AvgFr_dHP(:,1) >= MeanFR) & mask_dHP_HighIsolationQuality & mask_dHP_HighStability & mask_dHP_Pyramidal);
mask_dHP_Responsive_RadialMaze=((AvgFr_dHP(:,2) >= MeanFR) & mask_dHP_HighIsolationQuality & mask_dHP_HighStability & mask_dHP_Pyramidal);
LowScoreCLST.dHP=(Assessment_dHP(main_dHP_exp & mask_dHP_LowIsolationQuality));
LowStabilityCLST.dHP=(Assessment_dHP(main_dHP_exp & mask_dHP_LowStability));
AnalyzableCLST.dHP_INT=(Assessment_dHP(main_dHP_exp & mask_dHP_Interneuron));
AnalyzableCLST.dHP_PYR=(Assessment_dHP(main_dHP_exp & mask_dHP_Pyramidal));
AnalyzableCLST.dHP_PYR_NonResp=(Assessment_dHP(main_dHP_exp & mask_dHP_NonResponsive));
AnalyzableCLST.dHP_PYR_Resp_Both=(Assessment_dHP(main_dHP_exp & mask_dHP_Responsive_Both));
AnalyzableCLST.dHP_PYR_Resp_OpenField=(Assessment_dHP(main_dHP_exp & mask_dHP_Responsive_OpenField));
AnalyzableCLST.dHP_PYR_Resp_RadialMaze=(Assessment_dHP(main_dHP_exp & mask_dHP_Responsive_RadialMaze));

%
mask_iHP_LowIsolationQuality=(Assessment_iHP < 2);
mask_iHP_HighIsolationQuality = ~mask_iHP_LowIsolationQuality;
mask_iHP_LowStability=(NumberOfSpike_iHP(:,1)==0 | NumberOfSpike_iHP(:,4)==0) & mask_iHP_HighIsolationQuality;
mask_iHP_HighStability = ~mask_iHP_LowStability;
mask_iHP_GoodCluster=mask_iHP_HighStability & mask_iHP_HighIsolationQuality;
mask_iHP_Interneuron = strcmp(Celltype_iHP,'Interneruon') & mask_iHP_HighStability & mask_iHP_HighIsolationQuality;
mask_iHP_Pyramidal = strcmp(Celltype_iHP,'Pyramidal') & mask_iHP_HighStability & mask_iHP_HighIsolationQuality;
mask_iHP_NonResponsive=(AvgFr_iHP(:,1) < MeanFR & AvgFr_iHP(:,2) < MeanFR & mask_iHP_HighIsolationQuality & mask_iHP_HighStability & mask_iHP_Pyramidal);
mask_iHP_Responsive_Both=((AvgFr_iHP(:,1) >= MeanFR & AvgFr_iHP(:,2) >= MeanFR) & mask_iHP_HighIsolationQuality & mask_iHP_HighStability & mask_iHP_Pyramidal);
mask_iHP_Responsive_OpenField=((AvgFr_iHP(:,1) >= MeanFR) & mask_iHP_HighIsolationQuality & mask_iHP_HighStability & mask_iHP_Pyramidal);
mask_iHP_Responsive_RadialMaze=((AvgFr_iHP(:,2) >= MeanFR) & mask_iHP_HighIsolationQuality & mask_iHP_HighStability & mask_iHP_Pyramidal);
LowScoreCLST.iHP=(Assessment_iHP(iHP' & main_iHP_exp & mask_iHP_LowIsolationQuality));
LowStabilityCLST.iHP=(Assessment_iHP(iHP' & main_iHP_exp & mask_iHP_LowStability));
AnalyzableCLST.iHP_INT=(Assessment_iHP(iHP' & main_iHP_exp & mask_iHP_Interneuron));
AnalyzableCLST.iHP_PYR=(Assessment_iHP(iHP' & main_iHP_exp & mask_iHP_Pyramidal));
AnalyzableCLST.iHP_PYR_NonResp=(Assessment_iHP(iHP' & main_iHP_exp & mask_iHP_NonResponsive));
AnalyzableCLST.iHP_PYR_Resp_Both=(Assessment_iHP(iHP' & main_iHP_exp & mask_iHP_Responsive_Both));
AnalyzableCLST.iHP_PYR_Resp_OpenField=(Assessment_iHP(iHP' & main_iHP_exp & mask_iHP_Responsive_OpenField));
AnalyzableCLST.iHP_PYR_Resp_RadialMaze=(Assessment_iHP(iHP' & main_iHP_exp & mask_iHP_Responsive_RadialMaze));
%
AnalyzableCLST.vHP_INT=(Assessment_iHP(vHP' & main_iHP_exp & mask_iHP_Interneuron));
AnalyzableCLST.vHP_PYR=(Assessment_iHP(vHP' & main_iHP_exp & mask_iHP_Pyramidal));
AnalyzableCLST.vHP_PYR_NonResp=(Assessment_iHP(vHP' & main_iHP_exp & mask_iHP_NonResponsive));
AnalyzableCLST.vHP_PYR_Resp_Both=(Assessment_iHP(vHP' & main_iHP_exp & mask_iHP_Responsive_Both));
AnalyzableCLST.vHP_PYR_Resp_OpenField=(Assessment_iHP(vHP' & main_iHP_exp & mask_iHP_Responsive_OpenField));
AnalyzableCLST.vHP_PYR_Resp_RadialMaze=(Assessment_iHP(vHP' & main_iHP_exp & mask_iHP_Responsive_RadialMaze));

% % ****** Calculate the number of cells in Figure 1D ****** % %
celltype.dHP_Total=length(Assessment_dHP);
celltype.dHP_Both=length(AnalyzableCLST.dHP_PYR_Resp_Both);
celltype.dHP_OpenField=length(AnalyzableCLST.dHP_PYR_Resp_OpenField)-celltype.dHP_Both;
celltype.dHP_RadialMaze=length(AnalyzableCLST.dHP_PYR_Resp_RadialMaze)-celltype.dHP_Both;
celltype.dHP_NonResp=length(AnalyzableCLST.dHP_PYR_NonResp);

celltype.iHP_Total=length(iHP' & Assessment_iHP);
celltype.iHP_Both=length(AnalyzableCLST.iHP_PYR_Resp_Both);
celltype.iHP_OpenField=length(AnalyzableCLST.iHP_PYR_Resp_OpenField)-celltype.iHP_Both;
celltype.iHP_RadialMaze=length(AnalyzableCLST.iHP_PYR_Resp_RadialMaze)-celltype.iHP_Both;
celltype.iHP_NonResp=length(AnalyzableCLST.iHP_PYR_NonResp);

celltype.vHP_Total=length(vHP' & Assessment_iHP);
celltype.vHP_Both=length(AnalyzableCLST.vHP_PYR_Resp_Both);
celltype.vHP_OpenField=length(AnalyzableCLST.vHP_PYR_Resp_OpenField)-celltype.vHP_Both;
celltype.vHP_RadialMaze=length(AnalyzableCLST.vHP_PYR_Resp_RadialMaze)-celltype.vHP_Both;
celltype.vHP_NonResp=length(AnalyzableCLST.vHP_PYR_NonResp);

x=[celltype.dHP_Both celltype.dHP_OpenField celltype.dHP_RadialMaze celltype.dHP_NonResp];
y=[celltype.iHP_Both celltype.iHP_OpenField celltype.iHP_RadialMaze celltype.iHP_NonResp];
z=[celltype.vHP_Both celltype.vHP_OpenField celltype.vHP_RadialMaze celltype.vHP_NonResp];

% % ****** Plotting the pie chart ****** % %
sum(x)
fig=figure;
pie(x)
SaveRoot=['E:\Ongoing Project\Project - Value-based RW Navigation (dHP-vHP)\Analysis Data\BasicProperties'];
FileName=['PYR ratio_dHP'];
SaveFigure(gcf,SaveRoot, FileName);

sum(y)
fig=figure;
pie(y)
SaveRoot=['E:\Ongoing Project\Project - Value-based RW Navigation (dHP-vHP)\Analysis Data\BasicProperties'];
FileName=['PYR ratio_iHP'];
SaveFigure(gcf,SaveRoot, FileName);

sum(z)
fig=figure;
pie(z)
SaveRoot=['E:\Ongoing Project\Project - Value-based RW Navigation (dHP-vHP)\Analysis Data\BasicProperties'];
FileName=['PYR ratio_vHP'];
SaveFigure(gcf,SaveRoot, FileName);

% % ****** Statistical testing ****** % %
x=[celltype.dHP_OpenField celltype.dHP_Total-celltype.dHP_OpenField];
y=[celltype.dHP_RadialMaze celltype.dHP_Total-celltype.dHP_RadialMaze];
[~,p,stat]=chi2cont([x;y]);

x=[celltype.iHP_OpenField celltype.iHP_Total-celltype.iHP_OpenField];
y=[celltype.iHP_RadialMaze celltype.iHP_Total-celltype.iHP_RadialMaze];
[~,p,stat]=chi2cont([x;y]);

x=[celltype.vHP_OpenField celltype.vHP_Total-celltype.vHP_OpenField];
y=[celltype.vHP_RadialMaze celltype.vHP_Total-celltype.vHP_RadialMaze];
[~,p,stat]=chi2cont([x;y]);


%% Figure 1E, Mean firing rate
clear all
load('Analyzable Unit Information.mat');
main_dHP_exp = strcmp(SessionType_dHP,'SS') | strcmp(SessionType_dHP,'SSCH1') | strcmp(SessionType_dHP,'SSCH2') | strcmp(SessionType_dHP,'FRCH1') |...
    strcmp(SessionType_dHP,'FRCH2') | strcmp(SessionType_dHP,'SSFR1') | strcmp(SessionType_dHP,'SSFR2') | strcmp(SessionType_dHP,'T-SSCH1') |...
    strcmp(SessionType_dHP,'T-SSCH2') | strcmp(SessionType_dHP,'T-Quantity1') | strcmp(SessionType_dHP,'T-Quantity2');
main_iHP_exp = strcmp(SessionType_iHP,'SS') | strcmp(SessionType_iHP,'SSCH1') | strcmp(SessionType_iHP,'SSCH2') | strcmp(SessionType_iHP,'FRCH1') |...
    strcmp(SessionType_iHP,'FRCH2') | strcmp(SessionType_iHP,'SSFR1') | strcmp(SessionType_iHP,'SSFR2') | strcmp(SessionType_iHP,'T-SSCH1') |...
    strcmp(SessionType_iHP,'T-SSCH2') | strcmp(SessionType_iHP,'T-Quantity1') | strcmp(SessionType_iHP,'T-Quantity2');
iHP = DepthFromCortex_iHP < 5.5;
vHP = DepthFromCortex_iHP >= 5.5;

mask_dHP_LowIsolationQuality=(Assessment_dHP < 2);
mask_dHP_HighIsolationQuality = ~mask_dHP_LowIsolationQuality;
mask_dHP_LowStability=(NumberOfSpike_dHP(:,1)==0 | NumberOfSpike_dHP(:,4)==0) & mask_dHP_HighIsolationQuality;
mask_dHP_HighStability = ~mask_dHP_LowStability;
mask_dHP_GoodCluster=mask_dHP_HighStability & mask_dHP_HighIsolationQuality;

%
mask_iHP_LowIsolationQuality=(Assessment_iHP < 2);
mask_iHP_HighIsolationQuality = ~mask_iHP_LowIsolationQuality;
mask_iHP_LowStability=(NumberOfSpike_iHP(:,1)==0 | NumberOfSpike_iHP(:,4)==0) & mask_iHP_HighIsolationQuality;
mask_iHP_HighStability = ~mask_iHP_LowStability;
mask_iHP_GoodCluster=mask_iHP_HighStability & mask_iHP_HighIsolationQuality;

clear PopulationAvgFr
a=1; b=1;
for cl=1:length(Celltype_dHP)
    if isequal(Celltype_dHP{cl},'Pyramidal') && mask_dHP_GoodCluster(cl)==1 && main_dHP_exp(cl)==1    
        PopulationAvgFr.Pre_dHP_PYR(a)=PreSleepRate_dHP(cl);   
        PopulationAvgFr.Main_dHP_PYR(a)=AvgFr_dHP(cl,2);  a=a+1;
    elseif isequal(Celltype_dHP{cl},'Interneruon') && mask_dHP_GoodCluster(cl)==1 && main_dHP_exp(cl)==1     
        PopulationAvgFr.Pre_dHP_INT(b)=PreSleepRate_dHP(cl);
        PopulationAvgFr.Main_dHP_INT(b)=AvgFr_dHP(cl,2);  b=b+1;
    end
end

PopulationAvgFr_Rat.Pre_dHP_PYR{1}=[];
PopulationAvgFr_Rat.Pre_dHP_PYR{2}=[];
PopulationAvgFr_Rat.Pre_dHP_PYR{3}=[];
PopulationAvgFr_Rat.Pre_dHP_PYR{4}=[];
PopulationAvgFr_Rat.Pre_dHP_PYR{5}=[];
PopulationAvgFr_Rat.Pre_dHP_PYR{6}=[];
PopulationAvgFr_Rat.Main_dHP_PYR{1}=[];
PopulationAvgFr_Rat.Main_dHP_PYR{2}=[];
PopulationAvgFr_Rat.Main_dHP_PYR{3}=[];
PopulationAvgFr_Rat.Main_dHP_PYR{4}=[];
PopulationAvgFr_Rat.Main_dHP_PYR{5}=[];
PopulationAvgFr_Rat.Main_dHP_PYR{6}=[];

for cl=1:length(Celltype_dHP)
    [Rat, Type, Day, TetrodeNumber, ClusterNumber, Session, Sessiontype, Index1] = GetSessionInfo(Clstname_dHP{cl});
    Rat=str2num(Rat);
    if isequal(Celltype_dHP{cl},'Pyramidal') && mask_dHP_GoodCluster(cl)==1 && main_dHP_exp(cl)==1
        switch Rat
            case 448
                PopulationAvgFr_Rat.Pre_dHP_PYR{1}(end+1)=PreSleepRate_dHP(cl);   
                PopulationAvgFr_Rat.Main_dHP_PYR{1}(end+1)=AvgFr_dHP(cl,2); 
            case 459
                PopulationAvgFr_Rat.Pre_dHP_PYR{2}(end+1)=PreSleepRate_dHP(cl);   
                PopulationAvgFr_Rat.Main_dHP_PYR{2}(end+1)=AvgFr_dHP(cl,2); 
            case 463
                PopulationAvgFr_Rat.Pre_dHP_PYR{3}(end+1)=PreSleepRate_dHP(cl);   
                PopulationAvgFr_Rat.Main_dHP_PYR{3}(end+1)=AvgFr_dHP(cl,2); 
            case 473
                PopulationAvgFr_Rat.Pre_dHP_PYR{4}(end+1)=PreSleepRate_dHP(cl);   
                PopulationAvgFr_Rat.Main_dHP_PYR{4}(end+1)=AvgFr_dHP(cl,2); 
            case 488
                PopulationAvgFr_Rat.Pre_dHP_PYR{5}(end+1)=PreSleepRate_dHP(cl);   
                PopulationAvgFr_Rat.Main_dHP_PYR{5}(end+1)=AvgFr_dHP(cl,2); 
            case 509
                PopulationAvgFr_Rat.Pre_dHP_PYR{6}(end+1)=PreSleepRate_dHP(cl);   
                PopulationAvgFr_Rat.Main_dHP_PYR{6}(end+1)=AvgFr_dHP(cl,2); 
        end
    end
end

% iHP
a=1; b=1;
for cl=1:length(Celltype_iHP)
    if iHP(cl) == 1
        if isequal(Celltype_iHP{cl},'Pyramidal') && mask_iHP_GoodCluster(cl)==1 && main_iHP_exp(cl)==1         
            PopulationAvgFr.Pre_iHP_PYR(a)=PreSleepRate_iHP(cl);
            PopulationAvgFr.Main_iHP_PYR(a)=AvgFr_iHP(cl,2);
            PopulationDepth.iHP_PYR(a)=DepthFromCortex_iHP(cl); a=a+1;
        elseif isequal(Celltype_iHP{cl},'Interneruon') && mask_iHP_GoodCluster(cl)==1 && main_iHP_exp(cl)==1    
            PopulationAvgFr.Pre_iHP_INT(b)=PreSleepRate_iHP(cl);
            PopulationAvgFr.Main_iHP_INT(b)=AvgFr_iHP(cl,2);
            PopulationDepth.iHP_INT(b)=DepthFromCortex_iHP(cl); b=b+1;
        end
    end
end

PopulationAvgFr_Rat.Pre_iHP_PYR{1}=[];
PopulationAvgFr_Rat.Pre_iHP_PYR{2}=[];
PopulationAvgFr_Rat.Pre_iHP_PYR{3}=[];
PopulationAvgFr_Rat.Pre_iHP_PYR{4}=[];
PopulationAvgFr_Rat.Pre_iHP_PYR{5}=[];
PopulationAvgFr_Rat.Pre_iHP_PYR{6}=[];
PopulationAvgFr_Rat.Main_iHP_PYR{1}=[];
PopulationAvgFr_Rat.Main_iHP_PYR{2}=[];
PopulationAvgFr_Rat.Main_iHP_PYR{3}=[];
PopulationAvgFr_Rat.Main_iHP_PYR{4}=[];
PopulationAvgFr_Rat.Main_iHP_PYR{5}=[];
PopulationAvgFr_Rat.Main_iHP_PYR{6}=[];

for cl=1:length(Celltype_iHP)
    [Rat, Type, Day, TetrodeNumber, ClusterNumber, Session, Sessiontype, Index1] = GetSessionInfo(Clstname_iHP{cl});
    Rat=str2num(Rat);
    if isequal(Celltype_iHP{cl},'Pyramidal') && mask_iHP_GoodCluster(cl)==1 && main_iHP_exp(cl)==1 && iHP(cl) == 1
        switch Rat
            case 448
                PopulationAvgFr_Rat.Pre_iHP_PYR{1}(end+1)=PreSleepRate_iHP(cl);   
                PopulationAvgFr_Rat.Main_iHP_PYR{1}(end+1)=AvgFr_iHP(cl,2); 
            case 459
                PopulationAvgFr_Rat.Pre_iHP_PYR{2}(end+1)=PreSleepRate_iHP(cl);   
                PopulationAvgFr_Rat.Main_iHP_PYR{2}(end+1)=AvgFr_iHP(cl,2); 
            case 463
                PopulationAvgFr_Rat.Pre_iHP_PYR{3}(end+1)=PreSleepRate_iHP(cl);   
                PopulationAvgFr_Rat.Main_iHP_PYR{3}(end+1)=AvgFr_iHP(cl,2); 
            case 473
                PopulationAvgFr_Rat.Pre_iHP_PYR{4}(end+1)=PreSleepRate_iHP(cl);   
                PopulationAvgFr_Rat.Main_iHP_PYR{4}(end+1)=AvgFr_iHP(cl,2); 
            case 488
                PopulationAvgFr_Rat.Pre_iHP_PYR{5}(end+1)=PreSleepRate_iHP(cl);   
                PopulationAvgFr_Rat.Main_iHP_PYR{5}(end+1)=AvgFr_iHP(cl,2); 
            case 509
                PopulationAvgFr_Rat.Pre_iHP_PYR{6}(end+1)=PreSleepRate_iHP(cl);   
                PopulationAvgFr_Rat.Main_iHP_PYR{6}(end+1)=AvgFr_iHP(cl,2); 
        end
    end
end

% vHP
a=1; b=1;
for cl=1:length(Celltype_iHP)
    if vHP(cl) == 1
        if isequal(Celltype_iHP{cl},'Pyramidal') && mask_iHP_GoodCluster(cl)==1 && main_iHP_exp(cl)==1        
            PopulationAvgFr.Pre_vHP_PYR(a)=PreSleepRate_iHP(cl);
            PopulationAvgFr.Main_vHP_PYR(a)=AvgFr_iHP(cl,2);a=a+1;
        elseif isequal(Celltype_iHP{cl},'Interneruon') && mask_iHP_GoodCluster(cl)==1 && main_iHP_exp(cl)==1    
            PopulationAvgFr.Pre_iHP_INT(b)=PreSleepRate_iHP(cl);
            PopulationAvgFr.Main_vHP_INT(b)=AvgFr_iHP(cl,2);b=b+1;
        end
    end
end

PopulationAvgFr_Rat.Pre_vHP_PYR{1}=[];
PopulationAvgFr_Rat.Pre_vHP_PYR{2}=[];
PopulationAvgFr_Rat.Pre_vHP_PYR{3}=[];
PopulationAvgFr_Rat.Pre_vHP_PYR{4}=[];
PopulationAvgFr_Rat.Pre_vHP_PYR{5}=[];
PopulationAvgFr_Rat.Pre_vHP_PYR{6}=[];
PopulationAvgFr_Rat.Main_vHP_PYR{1}=[];
PopulationAvgFr_Rat.Main_vHP_PYR{2}=[];
PopulationAvgFr_Rat.Main_vHP_PYR{3}=[];
PopulationAvgFr_Rat.Main_vHP_PYR{4}=[];
PopulationAvgFr_Rat.Main_vHP_PYR{5}=[];
PopulationAvgFr_Rat.Main_vHP_PYR{6}=[];

for cl=1:length(Celltype_iHP)
    [Rat, Type, Day, TetrodeNumber, ClusterNumber, Session, Sessiontype, Index1] = GetSessionInfo(Clstname_iHP{cl});
    Rat=str2num(Rat);
    if isequal(Celltype_iHP{cl},'Pyramidal') && mask_iHP_GoodCluster(cl)==1 && main_iHP_exp(cl)==1 && vHP(cl) == 1
        switch Rat
            case 448
                PopulationAvgFr_Rat.Pre_vHP_PYR{1}(end+1)=PreSleepRate_iHP(cl);   
                PopulationAvgFr_Rat.Main_vHP_PYR{1}(end+1)=AvgFr_iHP(cl,2); 
            case 459
                PopulationAvgFr_Rat.Pre_vHP_PYR{2}(end+1)=PreSleepRate_iHP(cl);   
                PopulationAvgFr_Rat.Main_vHP_PYR{2}(end+1)=AvgFr_iHP(cl,2); 
            case 463
                PopulationAvgFr_Rat.Pre_vHP_PYR{3}(end+1)=PreSleepRate_iHP(cl);   
                PopulationAvgFr_Rat.Main_vHP_PYR{3}(end+1)=AvgFr_iHP(cl,2); 
            case 473
                PopulationAvgFr_Rat.Pre_vHP_PYR{4}(end+1)=PreSleepRate_iHP(cl);   
                PopulationAvgFr_Rat.Main_vHP_PYR{4}(end+1)=AvgFr_iHP(cl,2); 
            case 488
                PopulationAvgFr_Rat.Pre_vHP_PYR{5}(end+1)=PreSleepRate_iHP(cl);   
                PopulationAvgFr_Rat.Main_vHP_PYR{5}(end+1)=AvgFr_iHP(cl,2); 
            case 509
                PopulationAvgFr_Rat.Pre_vHP_PYR{6}(end+1)=PreSleepRate_iHP(cl);   
                PopulationAvgFr_Rat.Main_vHP_PYR{6}(end+1)=AvgFr_iHP(cl,2); 
        end
    end
end


% % ****** Plotting the mean +/- s.t.d grpah****** % %
fig=figure; hold on; 
fig.Position=[0 0 1000 500];
Color.color=2; Color.alpha=1;
Jin_MeanSTE_Line(1,PopulationAvgFr.Pre_dHP_PYR,Color);
for i=1:6
    plot(1, mean(PopulationAvgFr_Rat.Pre_dHP_PYR{i}),'r.')
end
Color.color=1;
Jin_MeanSTE_Line(1,PopulationAvgFr.Pre_iHP_PYR,Color)
for i=1:6
    plot(1, mean(PopulationAvgFr_Rat.Pre_iHP_PYR{i}),'b.')
end
Color.color=3;
Jin_MeanSTE_Line(1,PopulationAvgFr.Pre_vHP_PYR,Color)
for i=1:6
    plot(1, mean(PopulationAvgFr_Rat.Pre_vHP_PYR{i}),'g.')
end
Color.color=2; Color.alpha=1;
Jin_MeanSTE_Line(2,PopulationAvgFr.Main_dHP_PYR,Color)
for i=1:6
    plot(2, mean(PopulationAvgFr_Rat.Main_dHP_PYR{i}),'r.')
end
Color.color=1;
Jin_MeanSTE_Line(2,PopulationAvgFr.Main_iHP_PYR,Color)
for i=1:6
    plot(2, mean(PopulationAvgFr_Rat.Main_iHP_PYR{i}),'b.')
end
Color.color=3;
Jin_MeanSTE_Line(2,PopulationAvgFr.Main_vHP_PYR,Color)
for i=1:6
    plot(2, mean(PopulationAvgFr_Rat.Main_vHP_PYR{i}),'g.')
end
g=gca; g.YLim=[0.4 2]; g.YTick=0:0.4:2;

% % Statistical testing
% % Two way mixed ANOVA
dHP_Pre=[PopulationAvgFr.Pre_dHP_PYR]';
dHP_Main=[PopulationAvgFr.Main_dHP_PYR]';
iHP_Pre=[PopulationAvgFr.Pre_iHP_PYR]';
iHP_Main=[PopulationAvgFr.Main_iHP_PYR]';
vHP_Pre=[PopulationAvgFr.Pre_vHP_PYR]';
vHP_Main=[PopulationAvgFr.Main_vHP_PYR]';

Y = [dHP_Pre; dHP_Main; iHP_Pre; iHP_Main; vHP_Pre; vHP_Main];
BS = [GetGroupingVar(dHP_Pre,1); GetGroupingVar(dHP_Main,1); GetGroupingVar(iHP_Pre,2); GetGroupingVar(iHP_Main,2); GetGroupingVar(vHP_Pre,3); GetGroupingVar(vHP_Main,3)];
WS = [GetGroupingVar(dHP_Pre,1); GetGroupingVar(dHP_Main,2); GetGroupingVar(iHP_Pre,1); GetGroupingVar(iHP_Main,2); GetGroupingVar(vHP_Pre,1); GetGroupingVar(vHP_Main,2)];
S = [GetGroupingVar(dHP_Pre); GetGroupingVar(dHP_Main); GetGroupingVar(iHP_Pre)+length(dHP_Pre); GetGroupingVar(iHP_Main)+length(dHP_Pre); GetGroupingVar(vHP_Pre)+length(dHP_Pre)+length(iHP_Pre); GetGroupingVar(vHP_Main)+length(dHP_Pre)+length(iHP_Pre)];
X = [Y BS WS S];    
[SSQs, DFs, MSQs, Fs, Ps] = Stat_ANOVA2_Mixed(X);


%% Figure 1F, Theta-modulation index
clear all
load('Analyzable Unit Information.mat');
main_dHP_exp = strcmp(SessionType_dHP,'SS') | strcmp(SessionType_dHP,'SSCH1') | strcmp(SessionType_dHP,'SSCH2') | strcmp(SessionType_dHP,'FRCH1') |...
    strcmp(SessionType_dHP,'FRCH2') | strcmp(SessionType_dHP,'SSFR1') | strcmp(SessionType_dHP,'SSFR2') | strcmp(SessionType_dHP,'T-SSCH1') |...
    strcmp(SessionType_dHP,'T-SSCH2') | strcmp(SessionType_dHP,'T-Quantity1') | strcmp(SessionType_dHP,'T-Quantity2');
main_iHP_exp = strcmp(SessionType_iHP,'SS') | strcmp(SessionType_iHP,'SSCH1') | strcmp(SessionType_iHP,'SSCH2') | strcmp(SessionType_iHP,'FRCH1') |...
    strcmp(SessionType_iHP,'FRCH2') | strcmp(SessionType_iHP,'SSFR1') | strcmp(SessionType_iHP,'SSFR2') | strcmp(SessionType_iHP,'T-SSCH1') |...
    strcmp(SessionType_iHP,'T-SSCH2') | strcmp(SessionType_iHP,'T-Quantity1') | strcmp(SessionType_iHP,'T-Quantity2');
iHP = DepthFromCortex_iHP < 5.5;
vHP = DepthFromCortex_iHP >= 5.5;

mask_dHP_LowIsolationQuality=(Assessment_dHP < 2);
mask_dHP_HighIsolationQuality = ~mask_dHP_LowIsolationQuality;
mask_dHP_LowStability=(NumberOfSpike_dHP(:,1)==0 | NumberOfSpike_dHP(:,4)==0) & mask_dHP_HighIsolationQuality;
mask_dHP_HighStability = ~mask_dHP_LowStability;
mask_dHP_GoodCluster=mask_dHP_HighStability & mask_dHP_HighIsolationQuality;

%
mask_iHP_LowIsolationQuality=(Assessment_iHP < 2);
mask_iHP_HighIsolationQuality = ~mask_iHP_LowIsolationQuality;
mask_iHP_LowStability=(NumberOfSpike_iHP(:,1)==0 | NumberOfSpike_iHP(:,4)==0) & mask_iHP_HighIsolationQuality;
mask_iHP_HighStability = ~mask_iHP_LowStability;
mask_iHP_GoodCluster=mask_iHP_HighStability & mask_iHP_HighIsolationQuality;

a=1; b=1;
for cl=1:length(Celltype_dHP)
    if sum(Populationcorrelogram.dHP(cl,:)) > 100 && main_dHP_exp(cl)==1
        if isequal(Celltype_dHP{cl},'Pyramidal')     
            PopulationCorrelogram.dHP_PYR(a,:)=PopulationCorrelogram.dHP(cl,:)./max(PopulationCorrelogram.dHP(cl,62:65));        
            PopulationTMI.dHP_PYR(a)=PopulationTMI.dHP(cl);        
            a=a+1;
        elseif isequal(Celltype_dHP{cl},'Interneruon')    
            PopulationCorrelogram.dHP_INT(b,:)=PopulationCorrelogram.dHP(cl,:)./max(PopulationCorrelogram.dHP(cl,62:65));        
            PopulationTMI.dHP_INT(b)=PopulationTMI.dHP(cl);        
            b=b+1;
        end
    end
end
   
a=1; b=1;
for cl=1:length(Celltype_iHP)
    if sum(Populationcorrelogram.iHP(cl,:)) > 100 && DepthFromCortex_iHP(cl) < 5.5 && main_iHP_exp(cl)==1
        if isequal(Celltype_iHP{cl},'Pyramidal')        
            PopulationCorrelogram.iHP_PYR(a,:)=PopulationCorrelogram.iHP(cl,:)./max(PopulationCorrelogram.iHP(cl,62:65));        
            PopulationTMI.iHP_PYR(a)=PopulationTMI.iHP(cl);        
            PopulationDepthIndex.iHP_PYR(a)=PopulationDepthIndex.iHP(cl);        
            a=a+1;
        elseif isequal(Celltype_iHP{cl},'Interneruon')    
            PopulationCorrelogram.iHP_INT(b,:)=PopulationCorrelogram.iHP(cl,:)./max(PopulationCorrelogram.iHP(cl,62:65));          
            PopulationTMI.iHP_INT(b)=PopulationTMI.iHP(cl);        
            PopulationDepthIndex.iHP_INT(b)=PopulationDepthIndex.iHP(cl);        
            b=b+1;
        end
    end
end

a=1; b=1;
for cl=1:length(Celltype_iHP)
    if sum(Populationcorrelogram.iHP(cl,:)) > 100 && DepthFromCortex_iHP(cl) >= 5.5 && main_iHP_exp(cl)==1
        if isequal(Celltype_iHP{cl},'Pyramidal')        
            PopulationCorrelogram.vHP_PYR(a,:)=PopulationCorrelogram.iHP(cl,:)./max(PopulationCorrelogram.iHP(cl,62:65));        
            PopulationTMI.vHP_PYR(a)=PopulationTMI.iHP(cl);        
            PopulationDepthIndex.vHP_PYR(a)=PopulationDepthIndex.iHP(cl);        
            a=a+1;
        elseif isequal(Celltype_iHP{cl},'Interneruon')    
            PopulationCorrelogram.vHP_INT(b,:)=PopulationCorrelogram.iHP(cl,:)./max(PopulationCorrelogram.iHP(cl,62:65));          
            PopulationTMI.vHP_INT(b)=PopulationTMI.iHP(cl);        
            PopulationDepthIndex.vHP_INT(b)=PopulationDepthIndex.iHP(cl);        
            b=b+1;
        end
    end
end
PopulationBasicFr_Rat.TMI_dHP_PYR{1}=[];
PopulationBasicFr_Rat.TMI_dHP_PYR{2}=[];
PopulationBasicFr_Rat.TMI_dHP_PYR{3}=[];
PopulationBasicFr_Rat.TMI_dHP_PYR{4}=[];
PopulationBasicFr_Rat.TMI_dHP_PYR{5}=[];
PopulationBasicFr_Rat.TMI_dHP_PYR{6}=[];
for cl=1:length(Celltype_dHP)
    [Rat, Type, Day, TetrodeNumber, ClusterNumber, Session, Sessiontype, Index1] = GetSessionInfo(Clstname_dHP{cl});
    Rat=str2num(Rat);
    if isequal(Celltype_dHP{cl},'Pyramidal') && mask_dHP_GoodCluster(cl)==1 && main_dHP_exp(cl)==1 && sum(Populationcorrelogram.dHP(cl,:)) > 100 
        switch Rat
            case 448
                PopulationBasicFr_Rat.TMI_dHP_PYR{1}(end+1)=PopulationTMI.dHP(cl);  
            case 459
                PopulationBasicFr_Rat.TMI_dHP_PYR{2}(end+1)=PopulationTMI.dHP(cl);  
            case 463
                PopulationBasicFr_Rat.TMI_dHP_PYR{3}(end+1)=PopulationTMI.dHP(cl);  
            case 473
                PopulationBasicFr_Rat.TMI_dHP_PYR{4}(end+1)=PopulationTMI.dHP(cl);  
            case 488
%                 PopulationBasicFr_Rat.TMI_dHP_PYR{5}(end+1)=TMI_dHP(cl);  
            case 509
                PopulationBasicFr_Rat.TMI_dHP_PYR{6}(end+1)=PopulationTMI.dHP(cl);  
        end
    end
end

PopulationBasicFr_Rat.TMI_iHP_PYR{1}=[];
PopulationBasicFr_Rat.TMI_iHP_PYR{2}=[];
PopulationBasicFr_Rat.TMI_iHP_PYR{3}=[];
PopulationBasicFr_Rat.TMI_iHP_PYR{4}=[];
PopulationBasicFr_Rat.TMI_iHP_PYR{5}=[];
PopulationBasicFr_Rat.TMI_iHP_PYR{6}=[];
for cl=1:length(Celltype_iHP)
    [Rat, Type, Day, TetrodeNumber, ClusterNumber, Session, Sessiontype, Index1] = GetSessionInfo(Clstname_iHP{cl});
    Rat=str2num(Rat);
    if isequal(Celltype_iHP{cl},'Pyramidal') && mask_iHP_GoodCluster(cl)==1 && main_iHP_exp(cl)==1 && sum(Populationcorrelogram.iHP(cl,:)) > 100 && iHP(cl) == 1
        switch Rat
            case 448
                PopulationBasicFr_Rat.TMI_iHP_PYR{1}(end+1)=PopulationTMI.iHP(cl);  
            case 459
                PopulationBasicFr_Rat.TMI_iHP_PYR{2}(end+1)=PopulationTMI.iHP(cl);  
            case 463
                PopulationBasicFr_Rat.TMI_iHP_PYR{3}(end+1)=PopulationTMI.iHP(cl);  
            case 473
                PopulationBasicFr_Rat.TMI_iHP_PYR{4}(end+1)=PopulationTMI.iHP(cl);  
            case 488
%                 PopulationBasicFr_Rat.TMI_iHP_PYR{5}(end+1)=PopulationTMI.iHP(cl);  
            case 509
                PopulationBasicFr_Rat.TMI_iHP_PYR{6}(end+1)=PopulationTMI.iHP(cl);  
        end
    end
end

PopulationBasicFr_Rat.TMI_vHP_PYR{1}=[];
PopulationBasicFr_Rat.TMI_vHP_PYR{2}=[];
PopulationBasicFr_Rat.TMI_vHP_PYR{3}=[];
PopulationBasicFr_Rat.TMI_vHP_PYR{4}=[];
PopulationBasicFr_Rat.TMI_vHP_PYR{5}=[];
PopulationBasicFr_Rat.TMI_vHP_PYR{6}=[];


for cl=1:length(Celltype_iHP)
    [Rat, Type, Day, TetrodeNumber, ClusterNumber, Session, Sessiontype, Index1] = GetSessionInfo(Clstname_iHP{cl});
    Rat=str2num(Rat);
    if isequal(Celltype_iHP{cl},'Pyramidal') && mask_iHP_GoodCluster(cl)==1 && main_iHP_exp(cl)==1 && sum(Populationcorrelogram.iHP(cl,:)) > 100 && vHP(cl) == 1
        switch Rat
            case 448
                PopulationBasicFr_Rat.TMI_vHP_PYR{1}(end+1)=PopulationTMI.iHP(cl);  
            case 459
                PopulationBasicFr_Rat.TMI_vHP_PYR{2}(end+1)=PopulationTMI.iHP(cl);  
            case 463
                PopulationBasicFr_Rat.TMI_vHP_PYR{3}(end+1)=PopulationTMI.iHP(cl);  
            case 473
                PopulationBasicFr_Rat.TMI_vHP_PYR{4}(end+1)=PopulationTMI.iHP(cl);  
            case 488
                PopulationBasicFr_Rat.TMI_vHP_PYR{5}(end+1)=PopulationTMI.iHP(cl);  
            case 509
                PopulationBasicFr_Rat.TMI_vHP_PYR{6}(end+1)=PopulationTMI.iHP(cl);  
        end
    end
end

% % Plotting
fig=figure; hold on; 
fig.Position=[0 0 1000 500];
Color.color=2; Color.alpha=1;
Jin_MeanSTE_Line(1,PopulationTMI.dHP_PYR,Color)
for i=1:6
    plot(1, mean(PopulationBasicFr_Rat.TMI_dHP_PYR{i}),'r.')
end
Color.color=1;
Jin_MeanSTE_Line(2,PopulationTMI.iHP_PYR,Color)
for i=1:6
    plot(2, mean(PopulationBasicFr_Rat.TMI_iHP_PYR{i}),'b.')
end
Color.color=3;
Jin_MeanSTE_Line(3,PopulationTMI.vHP_PYR,Color)
for i=1:6
    plot(3, mean(PopulationBasicFr_Rat.TMI_vHP_PYR{i}),'g.')
end

% % Statistical testing
dHP_PYR=[PopulationTMI.dHP_PYR]';
iHP_PYR=[PopulationTMI.iHP_PYR]';
vHP_PYR=[PopulationTMI.vHP_PYR]';
% %
Y = [dHP_PYR; iHP_PYR; vHP_PYR];
GROUP = [GetGroupingVar(dHP_PYR,1); GetGroupingVar(iHP_PYR,12); GetGroupingVar(vHP_PYR,3)];
[Pvalue, result, gnames] = Stat_ANOVA1(Y,GROUP);

%% Figure 1G, Bursting index
clear all
load('Analyzable Unit Information.mat');
main_dHP_exp = strcmp(SessionType_dHP,'SS') | strcmp(SessionType_dHP,'SSCH1') | strcmp(SessionType_dHP,'SSCH2') | strcmp(SessionType_dHP,'FRCH1') |...
    strcmp(SessionType_dHP,'FRCH2') | strcmp(SessionType_dHP,'SSFR1') | strcmp(SessionType_dHP,'SSFR2') | strcmp(SessionType_dHP,'T-SSCH1') |...
    strcmp(SessionType_dHP,'T-SSCH2') | strcmp(SessionType_dHP,'T-Quantity1') | strcmp(SessionType_dHP,'T-Quantity2');
main_iHP_exp = strcmp(SessionType_iHP,'SS') | strcmp(SessionType_iHP,'SSCH1') | strcmp(SessionType_iHP,'SSCH2') | strcmp(SessionType_iHP,'FRCH1') |...
    strcmp(SessionType_iHP,'FRCH2') | strcmp(SessionType_iHP,'SSFR1') | strcmp(SessionType_iHP,'SSFR2') | strcmp(SessionType_iHP,'T-SSCH1') |...
    strcmp(SessionType_iHP,'T-SSCH2') | strcmp(SessionType_iHP,'T-Quantity1') | strcmp(SessionType_iHP,'T-Quantity2');
iHP = DepthFromCortex_iHP < 5.5;
vHP = DepthFromCortex_iHP >= 5.5;

mask_dHP_LowIsolationQuality=(Assessment_dHP < 2);
mask_dHP_HighIsolationQuality = ~mask_dHP_LowIsolationQuality;
mask_dHP_LowStability=(NumberOfSpike_dHP(:,1)==0 | NumberOfSpike_dHP(:,4)==0) & mask_dHP_HighIsolationQuality;
mask_dHP_HighStability = ~mask_dHP_LowStability;
mask_dHP_GoodCluster=mask_dHP_HighStability & mask_dHP_HighIsolationQuality;

%
mask_iHP_LowIsolationQuality=(Assessment_iHP < 2);
mask_iHP_HighIsolationQuality = ~mask_iHP_LowIsolationQuality;
mask_iHP_LowStability=(NumberOfSpike_iHP(:,1)==0 | NumberOfSpike_iHP(:,4)==0) & mask_iHP_HighIsolationQuality;
mask_iHP_HighStability = ~mask_iHP_LowStability;
mask_iHP_GoodCluster=mask_iHP_HighStability & mask_iHP_HighIsolationQuality;


a=1; b=1;
for cl=1:length(Celltype_dHP)
    if sum(Populationcorrelogram.dHP(cl,:)) > 100 
        if isequal(Celltype_dHP{cl},'Pyramidal') && mask_dHP_GoodCluster(cl)==1 && main_dHP_exp(cl)==1
            PopulationBasicFr.BurstingIndex_dHP_PYR(a)=BurstingIndex_dHP(cl,2);        
            PopulationBasicFr.SpikeWidth_dHP_PYR(a)=SpikeWidth_dHP(cl); a=a+1;

        elseif isequal(Celltype_dHP{cl},'Interneruon') && mask_iHP_GoodCluster(cl)==1 && main_iHP_exp(cl)==1
            PopulationBasicFr.BurstingIndex_dHP_INT(b)=BurstingIndex_dHP(cl,2);
            PopulationBasicFr.SpikeWidth_dHP_INT(b)=SpikeWidth_dHP(cl); b=b+1;

        end
    end
end
   
a=1; b=1;
for cl=1:length(Celltype_iHP)
    if sum(Populationcorrelogram.iHP(cl,:)) > 100 
        if isequal(Celltype_iHP{cl},'Pyramidal') && mask_iHP_GoodCluster(cl)==1 && main_iHP_exp(cl)==1 && iHP(cl) == 1
            PopulationBasicFr.BurstingIndex_iHP_PYR(a)=BurstingIndex_iHP(cl,2);
            PopulationBasicFr.SpikeWidth_iHP_PYR(a)=SpikeWidth_iHP(cl);
            PopulationDepth.iHP_PYR(a)=DepthFromCortex_iHP(cl); a=a+1;
        elseif isequal(Celltype_iHP{cl},'Interneruon') && mask_iHP_GoodCluster(cl)==1 && main_iHP_exp(cl)==1 && iHP(cl) == 1    
            PopulationBasicFr.BurstingIndex_iHP_INT(b)=BurstingIndex_iHP(cl,2);
            PopulationBasicFr.SpikeWidth_iHP_INT(b)=SpikeWidth_iHP(cl);
            PopulationDepth.iHP_INT(b)=DepthFromCortex_iHP(cl); b=b+1;
        end
    end
end
       
a=1; b=1;
for cl=1:length(Celltype_iHP)
    if sum(Populationcorrelogram.iHP(cl,:)) > 100 
        if isequal(Celltype_iHP{cl},'Pyramidal') && mask_iHP_GoodCluster(cl)==1 && main_iHP_exp(cl)==1 && vHP(cl) == 1        
            PopulationBasicFr.BurstingIndex_vHP_PYR(a)=BurstingIndex_iHP(cl,2);
            PopulationBasicFr.SpikeWidth_vHP_PYR(a)=SpikeWidth_iHP(cl);
            PopulationDepth.vHP_PYR(a)=DepthFromCortex_iHP(cl); a=a+1;
        elseif isequal(Celltype_iHP{cl},'Interneruon') && mask_iHP_GoodCluster(cl)==1 && main_iHP_exp(cl)==1 && vHP(cl) == 1    
            PopulationBasicFr.BurstingIndex_vHP_INT(b)=BurstingIndex_iHP(cl,2);
            PopulationBasicFr.SpikeWidth_vHP_INT(b)=SpikeWidth_iHP(cl);
            PopulationDepth.vHP_INT(b)=DepthFromCortex_iHP(cl); b=b+1;
        end
    end
end

PopulationBasicFr_Rat.BurstingIndex_dHP_PYR{1}=[];
PopulationBasicFr_Rat.BurstingIndex_dHP_PYR{2}=[];
PopulationBasicFr_Rat.BurstingIndex_dHP_PYR{3}=[];
PopulationBasicFr_Rat.BurstingIndex_dHP_PYR{4}=[];
PopulationBasicFr_Rat.BurstingIndex_dHP_PYR{5}=[];
PopulationBasicFr_Rat.BurstingIndex_dHP_PYR{6}=[];
for cl=1:length(Celltype_dHP)
    [Rat, Type, Day, TetrodeNumber, ClusterNumber, Session, Sessiontype, Index1] = GetSessionInfo(Clstname_dHP{cl});
    Rat=str2num(Rat);
    if isequal(Celltype_dHP{cl},'Pyramidal') && mask_dHP_GoodCluster(cl)==1 && main_dHP_exp(cl)==1 && sum(Populationcorrelogram.dHP(cl,:)) > 100 
        switch Rat
            case 448
                PopulationBasicFr_Rat.BurstingIndex_dHP_PYR{1}(end+1)=BurstingIndex_dHP(cl,2);  
            case 459
                PopulationBasicFr_Rat.BurstingIndex_dHP_PYR{2}(end+1)=BurstingIndex_dHP(cl,2);  
            case 463
                PopulationBasicFr_Rat.BurstingIndex_dHP_PYR{3}(end+1)=BurstingIndex_dHP(cl,2);  
            case 473
                PopulationBasicFr_Rat.BurstingIndex_dHP_PYR{4}(end+1)=BurstingIndex_dHP(cl,2);  
            case 488
%                 PopulationBasicFr_Rat.BurstingIndex_dHP_PYR{5}(end+1)=BurstingIndex_dHP(cl,2);  
            case 509
                PopulationBasicFr_Rat.BurstingIndex_dHP_PYR{6}(end+1)=BurstingIndex_dHP(cl,2);  
        end
    end
end

PopulationBasicFr_Rat.BurstingIndex_iHP_PYR{1}=[];
PopulationBasicFr_Rat.BurstingIndex_iHP_PYR{2}=[];
PopulationBasicFr_Rat.BurstingIndex_iHP_PYR{3}=[];
PopulationBasicFr_Rat.BurstingIndex_iHP_PYR{4}=[];
PopulationBasicFr_Rat.BurstingIndex_iHP_PYR{5}=[];
PopulationBasicFr_Rat.BurstingIndex_iHP_PYR{6}=[];
for cl=1:length(Celltype_iHP)
    [Rat, Type, Day, TetrodeNumber, ClusterNumber, Session, Sessiontype, Index1] = GetSessionInfo(Clstname_iHP{cl});
    Rat=str2num(Rat);
    if isequal(Celltype_iHP{cl},'Pyramidal') && mask_iHP_GoodCluster(cl)==1 && main_iHP_exp(cl)==1 && sum(Populationcorrelogram.iHP(cl,:)) > 100 && iHP(cl) == 1
        switch Rat
            case 448
                PopulationBasicFr_Rat.BurstingIndex_iHP_PYR{1}(end+1)=BurstingIndex_iHP(cl,2);  
            case 459
                PopulationBasicFr_Rat.BurstingIndex_iHP_PYR{2}(end+1)=BurstingIndex_iHP(cl,2);  
            case 463
                PopulationBasicFr_Rat.BurstingIndex_iHP_PYR{3}(end+1)=BurstingIndex_iHP(cl,2);  
            case 473
                PopulationBasicFr_Rat.BurstingIndex_iHP_PYR{4}(end+1)=BurstingIndex_iHP(cl,2);  
            case 488
%                 PopulationBasicFr_Rat.BurstingIndex_iHP_PYR{5}(end+1)=BurstingIndex_iHP(cl,2);  
            case 509
                PopulationBasicFr_Rat.BurstingIndex_iHP_PYR{6}(end+1)=BurstingIndex_iHP(cl,2);  
        end
    end
end

PopulationBasicFr_Rat.BurstingIndex_vHP_PYR{1}=[];
PopulationBasicFr_Rat.BurstingIndex_vHP_PYR{2}=[];
PopulationBasicFr_Rat.BurstingIndex_vHP_PYR{3}=[];
PopulationBasicFr_Rat.BurstingIndex_vHP_PYR{4}=[];
PopulationBasicFr_Rat.BurstingIndex_vHP_PYR{5}=[];
PopulationBasicFr_Rat.BurstingIndex_vHP_PYR{6}=[];


for cl=1:length(Celltype_iHP)
    [Rat, Type, Day, TetrodeNumber, ClusterNumber, Session, Sessiontype, Index1] = GetSessionInfo(Clstname_iHP{cl});
    Rat=str2num(Rat);
    if isequal(Celltype_iHP{cl},'Pyramidal') && mask_iHP_GoodCluster(cl)==1 && main_iHP_exp(cl)==1 && sum(Populationcorrelogram.iHP(cl,:)) > 100 && vHP(cl) == 1
        switch Rat
            case 448
                PopulationBasicFr_Rat.BurstingIndex_vHP_PYR{1}(end+1)=BurstingIndex_iHP(cl,2);  
            case 459
                PopulationBasicFr_Rat.BurstingIndex_vHP_PYR{2}(end+1)=BurstingIndex_iHP(cl,2);  
            case 463
                PopulationBasicFr_Rat.BurstingIndex_vHP_PYR{3}(end+1)=BurstingIndex_iHP(cl,2);  
            case 473
                PopulationBasicFr_Rat.BurstingIndex_vHP_PYR{4}(end+1)=BurstingIndex_iHP(cl,2);  
            case 488
                PopulationBasicFr_Rat.BurstingIndex_vHP_PYR{5}(end+1)=BurstingIndex_iHP(cl,2);  
            case 509
                PopulationBasicFr_Rat.BurstingIndex_vHP_PYR{6}(end+1)=BurstingIndex_iHP(cl,2);  
        end
    end
end


fig=figure; hold on; 
fig.Position=[0 0 1000 500];
Color.color=2; Color.alpha=1;
Jin_MeanSTE_Line(1,PopulationBasicFr.BurstingIndex_dHP_PYR,Color)
for i=1:6
    plot(1, mean(PopulationBasicFr_Rat.BurstingIndex_dHP_PYR{i}),'r.')
end
Color.color=1;
Jin_MeanSTE_Line(2,PopulationBasicFr.BurstingIndex_iHP_PYR,Color)
for i=1:6
%     mean(PopulationBasicFr_Rat.BurstingIndex_iHP_PYR{i})
    plot(2, mean(PopulationBasicFr_Rat.BurstingIndex_iHP_PYR{i}),'b.')
end
Color.color=3;
Jin_MeanSTE_Line(3,PopulationBasicFr.BurstingIndex_vHP_PYR,Color)
for i=1:6
%     mean(PopulationBasicFr_Rat.BurstingIndex_vHP_PYR{i})
    plot(3, mean(PopulationBasicFr_Rat.BurstingIndex_vHP_PYR{i}),'g.')
end

% % Statistical testing
dHP_PYR=[PopulationBasicFr.BurstingIndex_dHP_PYR]';
iHP_PYR=[PopulationBasicFr.BurstingIndex_iHP_PYR]';
vHP_PYR=[PopulationBasicFr.BurstingIndex_vHP_PYR]';

Y = [dHP_PYR; iHP_PYR; vHP_PYR];
GROUP = [GetGroupingVar(dHP_PYR,1); GetGroupingVar(iHP_PYR,12); GetGroupingVar(vHP_PYR,3)];
[Pvalue, result, ~] = Stat_ANOVA1(Y,GROUP);

%% Figure 1H, Spatial information
clear all
FR_Thre=0.25; 
pvalue=0.01;
Color=mapcolor(100,0);
REGION='Total';
SI_dHP_Thre=0.25;
SI_iHP_Thre=0.25;
load(['E:\Ongoing Project\Project - Value-based RW Navigation (dHP-vHP)\Analysis Data\OpenField_JPEG_SpatialAnalysis\FR_Thre_' num2str(FR_Thre) '_Pvalue_' num2str(pvalue) '\ClusterInfo_Openfield_' REGION '.mat'])

Active_dHP=ClusterInfo.Total_dHP_AvgFiringRate >= FR_Thre;
Active_iHP=ClusterInfo.Total_iHP_AvgFiringRate >= FR_Thre;
Information_dHP = ClusterInfo.Total_dHP_SpatialInfo >= SI_dHP_Thre;
Information_iHP = ClusterInfo.Total_iHP_SpatialInfo >= SI_iHP_Thre;
SpatiallyModulated_dHP = ClusterInfo.Total_dHP_SpatialInfo_pvalue < pvalue;
SpatiallyModulated_iHP = ClusterInfo.Total_iHP_SpatialInfo_pvalue < pvalue;
PlaceCell_dHP=Active_dHP&Information_dHP&SpatiallyModulated_dHP;
PlaceCell_iHP=Active_iHP&Information_iHP&SpatiallyModulated_iHP;
iHP = (ClusterInfo.Total_iHP_DistFromCortex < 5.5);
vHP = (ClusterInfo.Total_iHP_DistFromCortex >= 5.5);

% Flag, Rat
r448_dHP = logical(zeros(1,length(ClusterInfo.Total_dHP_Name)));
r448_iHP = logical(zeros(1,length(ClusterInfo.Total_iHP_Name)));
r459_dHP = logical(zeros(1,length(ClusterInfo.Total_dHP_Name)));
r459_iHP = logical(zeros(1,length(ClusterInfo.Total_iHP_Name)));
r463_dHP = logical(zeros(1,length(ClusterInfo.Total_dHP_Name)));
r463_iHP = logical(zeros(1,length(ClusterInfo.Total_iHP_Name)));
r473_dHP = logical(zeros(1,length(ClusterInfo.Total_dHP_Name)));
r473_iHP = logical(zeros(1,length(ClusterInfo.Total_iHP_Name)));
r488_dHP = logical(zeros(1,length(ClusterInfo.Total_dHP_Name)));
r488_iHP = logical(zeros(1,length(ClusterInfo.Total_iHP_Name)));
r509_dHP = logical(zeros(1,length(ClusterInfo.Total_dHP_Name)));
r509_iHP = logical(zeros(1,length(ClusterInfo.Total_iHP_Name)));

for i=1:1
    for j=1:length(ClusterInfo.Total_iHP_Name)
        name = ClusterInfo.Total_iHP_Name{1,j};
        if ~isempty(name)
            if isequal(name(13:15),'448')
                r448_iHP(i,j) = logical(1);
            end
            if isequal(name(13:15),'459')
                r459_iHP(i,j) = logical(1);
            end
            if isequal(name(13:15),'463')
                r463_iHP(i,j) = logical(1);
            end
            if isequal(name(13:15),'473')
                r473_iHP(i,j) = logical(1);
            end
            if isequal(name(13:15),'488')
                r488_iHP(i,j) = logical(1);
            end
            if isequal(name(13:15),'509')
                r509_iHP(i,j) = logical(1);
            end
        end
    end
end
for i=1:1
    for j=1:length(ClusterInfo.Total_dHP_Name)
        name = ClusterInfo.Total_dHP_Name{1,j};
        if ~isempty(name)
            if isequal(name(13:15),'448')
                r448_dHP(i,j) = logical(1);
            end
            if isequal(name(13:15),'459')
                r459_dHP(i,j) = logical(1);
            end
            if isequal(name(13:15),'463')
                r463_dHP(i,j) = logical(1);
            end
            if isequal(name(13:15),'473')
                r473_dHP(i,j) = logical(1);
            end
            if isequal(name(13:15),'488')
                r488_dHP(i,j) = logical(1);
            end
            if isequal(name(13:15),'509')
                r509_dHP(i,j) = logical(1);
            end
        end
    end
end

SpatialInfo.dHP=ClusterInfo.Total_dHP_SpatialInfo(Active_dHP);
SpatialInfo.dHP_Rat{1}=ClusterInfo.Total_dHP_SpatialInfo(Active_dHP & r448_dHP);
SpatialInfo.dHP_Rat{2}=ClusterInfo.Total_dHP_SpatialInfo(Active_dHP & r459_dHP);
SpatialInfo.dHP_Rat{3}=ClusterInfo.Total_dHP_SpatialInfo(Active_dHP & r463_dHP);
SpatialInfo.dHP_Rat{4}=ClusterInfo.Total_dHP_SpatialInfo(Active_dHP & r473_dHP);
SpatialInfo.dHP_Rat{5}=ClusterInfo.Total_dHP_SpatialInfo(Active_dHP & r488_dHP);
SpatialInfo.dHP_Rat{6}=ClusterInfo.Total_dHP_SpatialInfo(Active_dHP & r509_dHP);

SpatialInfo.iHP=ClusterInfo.Total_iHP_SpatialInfo(Active_iHP & iHP);
SpatialInfo.iHP_Rat{1}=ClusterInfo.Total_iHP_SpatialInfo(Active_iHP & r448_iHP & iHP);
SpatialInfo.iHP_Rat{2}=ClusterInfo.Total_iHP_SpatialInfo(Active_iHP & r459_iHP & iHP);
SpatialInfo.iHP_Rat{3}=ClusterInfo.Total_iHP_SpatialInfo(Active_iHP & r463_iHP & iHP);
SpatialInfo.iHP_Rat{4}=ClusterInfo.Total_iHP_SpatialInfo(Active_iHP & r473_iHP & iHP);
SpatialInfo.iHP_Rat{5}=ClusterInfo.Total_iHP_SpatialInfo(Active_iHP & r488_iHP & iHP);
SpatialInfo.iHP_Rat{6}=ClusterInfo.Total_iHP_SpatialInfo(Active_iHP & r509_iHP & iHP);

SpatialInfo.vHP=ClusterInfo.Total_iHP_SpatialInfo(Active_iHP & vHP);
SpatialInfo.vHP_Rat{1}=ClusterInfo.Total_iHP_SpatialInfo(Active_iHP & r448_iHP & vHP);
SpatialInfo.vHP_Rat{2}=ClusterInfo.Total_iHP_SpatialInfo(Active_iHP & r459_iHP & vHP);
SpatialInfo.vHP_Rat{3}=ClusterInfo.Total_iHP_SpatialInfo(Active_iHP & r463_iHP & vHP);
SpatialInfo.vHP_Rat{4}=ClusterInfo.Total_iHP_SpatialInfo(Active_iHP & r473_iHP & vHP);
SpatialInfo.vHP_Rat{5}=ClusterInfo.Total_iHP_SpatialInfo(Active_iHP & r488_iHP & vHP);
SpatialInfo.vHP_Rat{6}=ClusterInfo.Total_iHP_SpatialInfo(Active_iHP & r509_iHP & vHP);


fig=figure; hold on; 
fig.Position=[0 0 1000 500];
clear Color;
Color.color=2; Color.alpha=1;
Jin_MeanSTE_Line(1,SpatialInfo.dHP,Color);
for i=1:6
    mean(SpatialInfo.dHP_Rat{i})
%     plot(1, mean(SpatialInfo.dHP_Rat{i}),'r.')
end
Color.color=1;
Jin_MeanSTE_Line(2,SpatialInfo.iHP,Color)
for i=1:6
%     plot(2, mean(SpatialInfo.iHP_Rat{i}),'b.')
end
Color.color=3;
Jin_MeanSTE_Line(3,SpatialInfo.vHP,Color)
for i=1:6
%     plot(3, mean(SpatialInfo.vHP_Rat{i}),'g.')
end

% Statistical testing
y.data0 = SpatialInfo.dHP;
y.data1 = SpatialInfo.iHP;
y.data2 = SpatialInfo.vHP;
Y = [y.data0'; y.data1'; y.data2'];
GROUP = [GetGroupingVar(y.data0,'dHP'); GetGroupingVar(y.data1,'iHP'); GetGroupingVar(y.data2,'vHP')];
[Pvalue, result, ~] = Stat_ANOVA1(Y,GROUP);
% % Multiple comparision between groups
[~,p]=ttest2(y.data0, y.data1);
[~,p]=ttest2(y.data0, y.data2);
[~,p]=ttest2(y.data2, y.data1);

%% Figure 1I, Place cell ratio
Numb.PlaceCell_dHP=length(find(Active_dHP & SpatiallyModulated_dHP & (Information_dHP)));
Numb.Total_dHP=length((Active_dHP));
PlaceCellRatio.dHP= Numb.PlaceCell_dHP / Numb.Total_dHP;
Numb.PlaceCell_dHP_448=length(find(Active_dHP & SpatiallyModulated_dHP & Information_dHP & r448_dHP));
Numb.Total_dHP_448=length(find(r448_dHP));
PlaceCellRatio.dHP_448= Numb.PlaceCell_dHP_448 / Numb.Total_dHP_448;
Numb.PlaceCell_dHP_459=length(find(Active_dHP & SpatiallyModulated_dHP & Information_dHP & r459_dHP));
Numb.Total_dHP_459=length(find(r459_dHP));
PlaceCellRatio.dHP_459= Numb.PlaceCell_dHP_459 / Numb.Total_dHP_459;
Numb.PlaceCell_dHP_463=length(find(Active_dHP & SpatiallyModulated_dHP & Information_dHP & r463_dHP));
Numb.Total_dHP_463=length(find(r463_dHP));
PlaceCellRatio.dHP_463= Numb.PlaceCell_dHP_463 / Numb.Total_dHP_463;
Numb.PlaceCell_dHP_473=length(find(Active_dHP & SpatiallyModulated_dHP & Information_dHP & r473_dHP));
Numb.Total_dHP_473=length(find(r473_dHP));
PlaceCellRatio.dHP_473= Numb.PlaceCell_dHP_473 / Numb.Total_dHP_473;
Numb.PlaceCell_dHP_488=length(find(Active_dHP & SpatiallyModulated_dHP & Information_dHP & r488_dHP));
Numb.Total_dHP_488=length(find(r488_dHP));
PlaceCellRatio.dHP_488= Numb.PlaceCell_dHP_488 / Numb.Total_dHP_488;
Numb.PlaceCell_dHP_509=length(find(Active_dHP & SpatiallyModulated_dHP & Information_dHP & r509_dHP));
Numb.Total_dHP_509=length(find(r509_dHP));
PlaceCellRatio.dHP_509= Numb.PlaceCell_dHP_509 / Numb.Total_dHP_509;

Numb.PlaceCell_iHP=length(find(Active_iHP & SpatiallyModulated_iHP & iHP & (Information_iHP)));
Numb.Total_iHP=length(find(iHP));
PlaceCellRatio.iHP= Numb.PlaceCell_iHP / Numb.Total_iHP;
Numb.PlaceCell_iHP_448=length(find(Active_iHP & SpatiallyModulated_iHP & Information_iHP & iHP & r448_iHP));
Numb.Total_iHP_448=length(find(r448_iHP& iHP));
PlaceCellRatio.iHP_448= Numb.PlaceCell_iHP_448 / Numb.Total_iHP_448;
Numb.PlaceCell_iHP_459=length(find(Active_iHP & SpatiallyModulated_iHP & Information_iHP & iHP & r459_iHP));
Numb.Total_iHP_459=length(find(r459_iHP& iHP));
PlaceCellRatio.iHP_459= Numb.PlaceCell_iHP_459 / Numb.Total_iHP_459;
Numb.PlaceCell_iHP_463=length(find(Active_iHP & SpatiallyModulated_iHP & Information_iHP & iHP & r463_iHP));
Numb.Total_iHP_463=length(find(r463_iHP& iHP));
PlaceCellRatio.iHP_463= Numb.PlaceCell_iHP_463 / Numb.Total_iHP_463;
Numb.PlaceCell_iHP_473=length(find(Active_iHP & SpatiallyModulated_iHP & Information_iHP & iHP & r473_iHP));
Numb.Total_iHP_473=length(find(r473_iHP& iHP));
PlaceCellRatio.iHP_473= Numb.PlaceCell_iHP_473 / Numb.Total_iHP_473;
Numb.PlaceCell_iHP_488=length(find(Active_iHP & SpatiallyModulated_iHP & Information_iHP & iHP & r488_iHP));
Numb.Total_iHP_488=length(find(r488_iHP& iHP));
PlaceCellRatio.iHP_488= Numb.PlaceCell_iHP_488 / Numb.Total_iHP_488;
Numb.PlaceCell_iHP_509=length(find(Active_iHP & SpatiallyModulated_iHP & Information_iHP & iHP & r509_iHP));
Numb.Total_iHP_509=length(find(r509_iHP& iHP));
PlaceCellRatio.iHP_509= Numb.PlaceCell_iHP_509 / Numb.Total_iHP_509;

Numb.PlaceCell_vHP=length(find(Active_iHP & SpatiallyModulated_iHP & vHP & (Information_iHP)));
Numb.Total_vHP=length(find(vHP));
PlaceCellRatio.vHP= Numb.PlaceCell_vHP / Numb.Total_vHP;
Numb.PlaceCell_vHP_448=length(find(Active_iHP & SpatiallyModulated_iHP & Information_iHP & vHP & r448_iHP));
Numb.Total_vHP_448=length(find(r448_iHP& vHP));
PlaceCellRatio.vHP_448= Numb.PlaceCell_vHP_448 / Numb.Total_vHP_448;
Numb.PlaceCell_vHP_459=length(find(Active_iHP & SpatiallyModulated_iHP & Information_iHP & vHP & r459_iHP));
Numb.Total_vHP_459=length(find(r459_iHP& vHP));
PlaceCellRatio.vHP_459= Numb.PlaceCell_vHP_459 / Numb.Total_vHP_459;
Numb.PlaceCell_vHP_463=length(find(Active_iHP & SpatiallyModulated_iHP & Information_iHP & vHP & r463_iHP));
Numb.Total_vHP_463=length(find(r463_iHP& vHP));
PlaceCellRatio.vHP_463= Numb.PlaceCell_vHP_463 / Numb.Total_vHP_463;
Numb.PlaceCell_vHP_473=length(find(Active_iHP & SpatiallyModulated_iHP & Information_iHP & vHP & r473_iHP));
Numb.Total_vHP_473=length(find(r473_iHP& vHP));
PlaceCellRatio.vHP_473= Numb.PlaceCell_vHP_473 / Numb.Total_vHP_473;
Numb.PlaceCell_vHP_488=length(find(Active_iHP & SpatiallyModulated_iHP & Information_iHP & vHP & r488_iHP));
Numb.Total_vHP_488=length(find(r488_iHP& vHP));
PlaceCellRatio.vHP_488= Numb.PlaceCell_vHP_488 / Numb.Total_vHP_488;
Numb.PlaceCell_vHP_509=length(find(Active_iHP & SpatiallyModulated_iHP & Information_iHP & vHP & r509_iHP));
Numb.Total_vHP_509=length(find(r509_iHP& vHP));
PlaceCellRatio.vHP_509= Numb.PlaceCell_vHP_509 / Numb.Total_vHP_509;

fig=figure;
hold on;
plot(1,PlaceCellRatio.dHP,'r.');
plot(1,PlaceCellRatio.dHP_448,'ro');
plot(1,PlaceCellRatio.dHP_459,'ro');
plot(1,PlaceCellRatio.dHP_463,'ro');
plot(1,PlaceCellRatio.dHP_473,'ro');
plot(1,PlaceCellRatio.dHP_509,'ro');

plot(2,PlaceCellRatio.iHP,'b.');
plot(2,PlaceCellRatio.iHP_448,'bo');
plot(2,PlaceCellRatio.iHP_459,'bo');
plot(2,PlaceCellRatio.iHP_463,'bo');
plot(2,PlaceCellRatio.iHP_473,'bo');
plot(2,PlaceCellRatio.iHP_509,'bo');

plot(3,PlaceCellRatio.vHP,'g.');
plot(3,PlaceCellRatio.vHP_448,'go');
plot(3,PlaceCellRatio.vHP_459,'go');
plot(3,PlaceCellRatio.vHP_463,'go');
plot(3,PlaceCellRatio.vHP_488,'go');
plot(3,PlaceCellRatio.vHP_509,'go');
xlim([0.5 3.5])

% % Statistical testing
[~,p,stat]=chi2cont([Numb.PlaceCell_dHP  Numb.Total_dHP; Numb.PlaceCell_iHP Numb.Total_iHP; Numb.PlaceCell_vHP Numb.Total_vHP]);
