%% Figure 2D-G
% % Example of rate map making 
clear all
load('Rat448-Main1-TT8-C2.mat')
load('Rat448-Main1-TT8-C2_p2.mat')
load('Rat448-Main1-PositionData.mat')
XsizeOfVideo = 720;
YsizeOfVideo = 480;
samplingRate = 30;
scaleForRateMap = 10;
binXForRateMap = XsizeOfVideo / scaleForRateMap;
binYForRateMap = YsizeOfVideo / scaleForRateMap;
Alt_Rate_Odd_X_Range=[12 45]; Alt_Rate_Odd_Y_Range=[21 48];
Alt_Rate_Even_X_Range=[14 48]; Alt_Rate_Even_Y_Range=[21 48];
Alt_Rate_X_Range=[12 48]; Alt_Rate_Y_Range=[21 48];

% % Rate map construction
% Total rate map
[Ratemap.occMat_Odd_Total, Ratemap.spkMat_Odd_Total, Ratemap.rawMat_Odd_Total, Ratemap.skaggsrateMat_Odd_Total] = abmFiringRateMap( ...
    [thisCLST.t(Spike.Odd_Total_Track), thisCLST.x(Spike.Odd_Total_Track), thisCLST.y(Spike.Odd_Total_Track)],...
    [Pos.t(Position.Odd_Total_Track), Pos.x(Position.Odd_Total_Track), Pos.y(Position.Odd_Total_Track)],...
    binYForRateMap, binXForRateMap, scaleForRateMap, samplingRate);

% B1 rate map
[Ratemap.occMat_Odd_B1, Ratemap.spkMat_Odd_B1, Ratemap.rawMat_Odd_B1, Ratemap.skaggsrateMat_Odd_B1] = abmFiringRateMap( ...
    [thisCLST.t(Spike.Odd_B1_Track), thisCLST.x(Spike.Odd_B1_Track), thisCLST.y(Spike.Odd_B1_Track)],...
    [Pos.t(Position.Odd_B1_Track), Pos.x(Position.Odd_B1_Track), Pos.y(Position.Odd_B1_Track)],...
    binYForRateMap, binXForRateMap, scaleForRateMap, samplingRate);

% B2 rate map
[Ratemap.occMat_Odd_B2, Ratemap.spkMat_Odd_B2, Ratemap.rawMat_Odd_B2, Ratemap.skaggsrateMat_Odd_B2] = abmFiringRateMap( ...
    [thisCLST.t(Spike.Odd_B2_Track), thisCLST.x(Spike.Odd_B2_Track), thisCLST.y(Spike.Odd_B2_Track)],...
    [Pos.t(Position.Odd_B2_Track), Pos.x(Position.Odd_B2_Track), Pos.y(Position.Odd_B2_Track)],...
    binYForRateMap, binXForRateMap, scaleForRateMap, samplingRate);

% % Contour of occupancy map
OVERALL=load('Rat448-Main1-TT8-C2_p2.mat', 'Ratemap');
outer = OVERALL.Ratemap.skaggsrateMat_Odd_Total >= 0;
Contour_Odd = bwconncomp(outer);
Contour_Odd.Label = labelmatrix(Contour_Odd);
FieldBoundary_Odd = (Contour_Odd.Label==1);

% % Rate map plotting        
figure; hold on;
i1=imagesc((Ratemap.skaggsrateMat_Odd_B1));
minmaxColor=get(gca,'CLim');
if minmaxColor(1) == -1 && minmaxColor(2) == 1; minmaxColor(2)=0.1; end
Cmax(1)=minmaxColor(2);
set(gca,'fontsize',10,'fontweight','bold')
set(gca, 'YDir', 'rev', 'XLim', Alt_Rate_Odd_X_Range, 'YLim', Alt_Rate_Odd_Y_Range, 'FontSize', 9);
colormap(jet);
thisAlphaZ_RF_1stHalf = Ratemap.skaggsrateMat_Odd_B1;
thisAlphaZ_RF_1stHalf(isnan(Ratemap.skaggsrateMat_Odd_B1)) = 0;
thisAlphaZ_RF_1stHalf(~isnan(Ratemap.skaggsrateMat_Odd_B1)) = 1;
alpha(thisAlphaZ_RF_1stHalf);axis off;
hold on;
[C,h]=contour(FieldBoundary_Odd,1);
h.LineColor='k'; h.LineWidth=0.1;

% % Spatial correlation between Block 1 and 2
SpaCorr.Odd_B12 = GetSpatialCorrelation(Ratemap.skaggsrateMat_Odd_B1, Ratemap.skaggsrateMat_Odd_B2);

% % Mean firing rate of block 1
FiringRate.Average_Odd_B1 = GetFiringRate(Ratemap.skaggsrateMat_Odd_B1);

% % Spatial information score
InformationScore.Odd=GetSpaInfo(Ratemap.occMat_Odd_Total, Ratemap.skaggsrateMat_Odd_Total);

% % Spatial informatio score's p-value
Pos.Flag_Position_pvalue = Position.Odd_Total;
thisCLST.Flag_Position_pvalue = Spike.Odd_Total;
SpaInfo = InformationScore.Odd;
InformationScore.pvalue_Odd = GetSpatialInfo_pvalue_ALT(thisCLST, Pos, SpaInfo);

% % Place field size
FieldSize_Odd = GetPlaceFieldSize(Ratemap.skaggsrateMat_Odd_Total);
FieldSize_PhysicalSize_Odd=sum(sum(~isnan(Ratemap.skaggsrateMat_Odd_Total)));
FieldSize_RelativeFieldSize_Odd=round(FieldSize_Odd/FieldSize_PhysicalSize_Odd*100,2);

