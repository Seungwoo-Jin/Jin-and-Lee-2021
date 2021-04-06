%% Figure 7B to 7G
clear all
load('Figure7.mat')
%
window=7;
alpha=1.75;
smooth=1;
FR_Thre=0.1;
variance=80;
mode = 2;
gaussFilt = gausswin(window,alpha);
clear gaussFilter
% gaussFilter = gaussFilter / sum(gaussFilter);
for i=1:(window+1)/2
    gaussFilter(:,i)= gaussFilt / sum(gaussFilt((window+1)/2+1-i:window));
end
colorMap = parula(256);

% LearningTrial.r463_B3_Day1_SS
B1=length(Prob_v2.B1_WinBugs);
B2=length(Prob_v2.B2_WinBugs);
B3=length(Prob_v2.B3_WinBugs);
B4=length(Prob_v2.B4_WinBugs);

for i=1:length(Prob_v2.B3_WinBugs)
    LearningLearningCurve.r463_Day1(i+B1+B2)=Prob_v2.B3_WinBugs(i,3);
end
for i=1:length(Prob_v2.B4_WinBugs)
    LearningLearningCurve.r463_Day1(i+B1+B2+B3)=Prob_v2.B4_WinBugs(i,3);
end

LearningTrial.r463_B1_Day1=TrialInformation_v2.LearningTrial_B1;
LearningTrial.r463_B2_Day1=TrialInformation_v2.LearningTrial_B2;
LearningTrial.r463_B3_Day1=TrialInformation_v2.LearningTrial_B3;
LearningTrial.r463_B4_Day1=TrialInformation_v2.LearningTrial_B4;
% LearningTrial.r463_B3_Day1=36;
clear Index
[~,Index.r463_Day1]=sort(TrialInformation_v2.B3_SSCH);
j=1; k=1;
for i=1:length(Index.r463_Day1)
    if sum(TrialInformation_v2.B3_SSCH(i) == TrialInformation_v2.B3_SS)
        LearningCurve.r463_B3_Day1_WinBugs_SS(j)=Prob_v2.B3_WinBugs(i,3);
        Index.r463_Day1_SS(j)=i; j=j+1;
    else
        LearningCurve.r463_B3_Day1_WinBugs_CR(k)=Prob_v2.B3_WinBugs(i,3);
        Index.r463_Day1_CR(k)=i; k=k+1;
    end
    if Index.r463_Day1(i) == LearningTrial.r463_B3_Day1
        LearningTrial.r463_B3_Day1_SS = j-1;
        LearningTrial.r463_B3_Day1_CR = k-1;
    end
end
% %%%%%%%%%%%%%%%%%%% All trial
[Tar.r463_Day1_dHP, Tar.r463_Day1_dHP_Name]=GetAvailablePCAUnit(PCA.r463_Day1_dHP_MeanFiringRate_B3(Index.r463_Day1,:),FR_Thre,PCA.r463_Day1_dHP_Name);
[Tar.r463_Day1_iHP, Tar.r463_Day1_iHP_Name]=GetAvailablePCAUnit(PCA.r463_Day1_iHP_MeanFiringRate_B3(Index.r463_Day1,:),FR_Thre,PCA.r463_Day1_iHP_Name);

j=1;
for i=1:size(Tar.r463_Day1_dHP,2)
    if ~sum(isnan(Tar.r463_Day1_dHP(:,i)))
        Target.r463_Day1_dHP(:,j)=Tar.r463_Day1_dHP(:,i);
        Target.r463_Day1_dHP_Name{j,1}=Tar.r463_Day1_dHP_Name{i}; j=j+1;
    end
end
j=1;
for i=1:size(Tar.r463_Day1_iHP,2)
    if ~sum(isnan(Tar.r463_Day1_iHP(:,i)))
        Target.r463_Day1_iHP(:,j)=Tar.r463_Day1_iHP(:,i);
        Target.r463_Day1_iHP_Name{j,1}=Tar.r463_Day1_iHP_Name{i}; j=j+1;
    end
end

Average.r463_Day1_dHP=mean(Tar.r463_Day1_dHP);
Average.r463_Day1_iHP=mean(Tar.r463_Day1_iHP);
Normalized.r463_Day1_dHP=zscore(Target.r463_Day1_dHP(:,:));
Normalized.r463_Day1_iHP=zscore(Target.r463_Day1_iHP(:,:));

% %%%%%%%%%%%%%%%%%%%%%% All trial
[w.r463_Day1_dHP, PC.r463_Day1_dHP,~,~,Variance.r463_Day1_dHP] = pca(zscore(Target.r463_Day1_dHP(:,:)));
[w.r463_Day1_iHP, PC.r463_Day1_iHP,~,~,Variance.r463_Day1_iHP] = pca(zscore(Target.r463_Day1_iHP(:,:)));

PC.r463_Day1_dHP_SS = PC.r463_Day1_dHP(Index.r463_Day1_SS,:);
PC.r463_Day1_dHP_CR = PC.r463_Day1_dHP(Index.r463_Day1_CR,:);
PC.r463_Day1_iHP_SS = PC.r463_Day1_iHP(Index.r463_Day1_SS,:);
PC.r463_Day1_iHP_CR = PC.r463_Day1_iHP(Index.r463_Day1_CR,:);

for i=1:length(Variance.r463_Day1_dHP)
    if sum(Variance.r463_Day1_dHP(1:i)) > variance
        Dimension.r463_Day1_dHP=i;
        break;
    end
end
for i=1:length(Variance.r463_Day1_iHP)
    if sum(Variance.r463_Day1_iHP(1:i)) > variance
        Dimension.r463_Day1_iHP=i;
        break;
    end
end

% figure
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
PC.r463_Day1_dHP_GaussFiltered = GetPC_GaussianFiltering(PC.r463_Day1_dHP, window, gaussFilter);
PC.r463_Day1_iHP_GaussFiltered = GetPC_GaussianFiltering(PC.r463_Day1_iHP, window, gaussFilter);
PC.r463_Day1_dHP_SS_GaussFiltered = GetPC_GaussianFiltering(PC.r463_Day1_dHP(Index.r463_Day1_SS,:), window, gaussFilter);
PC.r463_Day1_dHP_CR_GaussFiltered = GetPC_GaussianFiltering(PC.r463_Day1_dHP(Index.r463_Day1_CR,:), window, gaussFilter);
PC.r463_Day1_iHP_SS_GaussFiltered = GetPC_GaussianFiltering(PC.r463_Day1_iHP(Index.r463_Day1_SS,:), window, gaussFilter);
PC.r463_Day1_iHP_CR_GaussFiltered = GetPC_GaussianFiltering(PC.r463_Day1_iHP(Index.r463_Day1_CR,:), window, gaussFilter);

% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
LearnedState.r463_Day1_dHP_SS_GaussFiltered=mean(PC.r463_Day1_dHP_SS_GaussFiltered(LearningTrial.r463_B3_Day1_SS:length(Index.r463_Day1_SS),1:Dimension.r463_Day1_dHP),1);
LearnedState.r463_Day1_iHP_SS_GaussFiltered=mean(PC.r463_Day1_iHP_SS_GaussFiltered(LearningTrial.r463_B3_Day1_SS:length(Index.r463_Day1_SS),1:Dimension.r463_Day1_iHP),1);
for i=1:size(PC.r463_Day1_dHP_SS_GaussFiltered,1)
    x=PC.r463_Day1_dHP_SS_GaussFiltered(i,1:Dimension.r463_Day1_dHP);
    y=LearnedState.r463_Day1_dHP_SS_GaussFiltered;
    z=Variance.r463_Day1_dHP(1:Dimension.r463_Day1_dHP);
    EUdist.r463_Day1_dHP_SS_Weighted_GaussFiltered(i,:)=GetWeightedEuclideanDistance(x,y,z);
    EUdist.r463_Day1_dHP_SS_GaussFiltered(i,:)=pdist2(x,y);
end

for i=1:size(PC.r463_Day1_iHP_SS_GaussFiltered,1)
    x=PC.r463_Day1_iHP_SS_GaussFiltered(i,1:Dimension.r463_Day1_iHP);
    y=LearnedState.r463_Day1_iHP_SS_GaussFiltered;
    z=Variance.r463_Day1_iHP(1:Dimension.r463_Day1_iHP);
    EUdist.r463_Day1_iHP_SS_Weighted_GaussFiltered(i,:)=GetWeightedEuclideanDistance(x,y,z);
    EUdist.r463_Day1_iHP_SS_GaussFiltered(i,:)=pdist2(x,y);
end

LearnedState.r463_Day1_dHP_CR_GaussFiltered=mean(PC.r463_Day1_dHP_CR_GaussFiltered(LearningTrial.r463_B3_Day1_CR:length(Index.r463_Day1_CR),1:Dimension.r463_Day1_dHP),1);
LearnedState.r463_Day1_iHP_CR_GaussFiltered=mean(PC.r463_Day1_iHP_CR_GaussFiltered(LearningTrial.r463_B3_Day1_CR:length(Index.r463_Day1_CR),1:Dimension.r463_Day1_iHP),1);
for i=1:size(PC.r463_Day1_dHP_CR_GaussFiltered,1)
    x=PC.r463_Day1_dHP_CR_GaussFiltered(i,1:Dimension.r463_Day1_dHP);
    y=LearnedState.r463_Day1_dHP_CR_GaussFiltered;
    z=Variance.r463_Day1_dHP(1:Dimension.r463_Day1_dHP);
    EUdist.r463_Day1_dHP_CR_Weighted_GaussFiltered(i,:)=GetWeightedEuclideanDistance(x,y,z);
    EUdist.r463_Day1_dHP_CR_GaussFiltered(i,:)=pdist2(x,y);
end

for i=1:size(PC.r463_Day1_iHP_CR_GaussFiltered,1)
    x=PC.r463_Day1_iHP_CR_GaussFiltered(i,1:Dimension.r463_Day1_iHP);
    y=LearnedState.r463_Day1_iHP_CR_GaussFiltered;
    z=Variance.r463_Day1_iHP(1:Dimension.r463_Day1_iHP);
    EUdist.r463_Day1_iHP_CR_Weighted_GaussFiltered(i,:)=GetWeightedEuclideanDistance(x,y,z);
    EUdist.r463_Day1_iHP_CR_GaussFiltered(i,:)=pdist2(x,y);
end

% %%%%%%%%%%%%%%%%%%%%%
fig=figure; fig.Position=[0 0 2000 1000];
if Dimension.r463_Day1_dHP > 2
    sheetTitle = subplot('Position', [0.05 0.5 0.2 0.4]); hold on;
    p0=plot3(PC.r463_Day1_dHP_SS_GaussFiltered(:,1),PC.r463_Day1_dHP_SS_GaussFiltered(:,2),PC.r463_Day1_dHP_SS_GaussFiltered(:,3),'k--'); p0.LineWidth=0.5; p0.MarkerSize=5;
    scale=floor(256/size(PC.r463_Day1_dHP_SS_GaussFiltered,1));
    for i=1:size(PC.r463_Day1_dHP_SS_GaussFiltered,1)
        p3=plot3(PC.r463_Day1_dHP_SS_GaussFiltered(i,1),PC.r463_Day1_dHP_SS_GaussFiltered(i,2),PC.r463_Day1_dHP_SS_GaussFiltered(i,3),'.'); p3.MarkerSize=40;
        p3.Color=colorMap(256-scale*(i-1),:);
    end
    p1=plot3(LearnedState.r463_Day1_dHP_SS_GaussFiltered(1),LearnedState.r463_Day1_dHP_SS_GaussFiltered(2),LearnedState.r463_Day1_dHP_SS_GaussFiltered(3),'.'); p1.Color=[0.5 0.5 0.5]; p1.MarkerSize=50;
    grid on
    g=gca; g.FontSize=12;
    xlabel('PC1'); ylabel('PC2'); zlabel('PC3');
    title('r463-Day1, B3, dHP, SS');
    % CR
    sheetTitle = subplot('Position', [0.3 0.5 0.2 0.4]); hold on;
    p0=plot3(PC.r463_Day1_dHP_CR_GaussFiltered(:,1),PC.r463_Day1_dHP_CR_GaussFiltered(:,2),PC.r463_Day1_dHP_CR_GaussFiltered(:,3),'k--'); p0.LineWidth=0.5; p0.MarkerSize=5;
    scale=floor(256/size(PC.r463_Day1_dHP_CR_GaussFiltered,1));
    for i=1:size(PC.r463_Day1_dHP_CR_GaussFiltered,1)
        p3=plot3(PC.r463_Day1_dHP_CR_GaussFiltered(i,1),PC.r463_Day1_dHP_CR_GaussFiltered(i,2),PC.r463_Day1_dHP_CR_GaussFiltered(i,3),'.'); p3.MarkerSize=40;
        p3.Color=colorMap(256-scale*(i-1),:);
    end
    p1=plot3(LearnedState.r463_Day1_dHP_CR_GaussFiltered(1),LearnedState.r463_Day1_dHP_CR_GaussFiltered(2),LearnedState.r463_Day1_dHP_CR_GaussFiltered(3),'.'); p1.Color=[0.5 0.5 0.5]; p1.MarkerSize=50;
    grid on
    g=gca; g.FontSize=12;
    xlabel('PC1'); ylabel('PC2'); zlabel('PC3');
    title('r463-Day1, B3, dHP, CR');
end
% iHP, SS
sheetTitle = subplot('Position', [0.55 0.5 0.2 0.4]); hold on;
p0=plot3(PC.r463_Day1_iHP_SS_GaussFiltered(:,1),PC.r463_Day1_iHP_SS_GaussFiltered(:,2),PC.r463_Day1_iHP_SS_GaussFiltered(:,3),'k--'); p0.LineWidth=0.5; p0.MarkerSize=5;
scale=floor(256/size(PC.r463_Day1_iHP_SS_GaussFiltered,1));
for i=1:size(PC.r463_Day1_iHP_SS_GaussFiltered,1)
    p3=plot3(PC.r463_Day1_iHP_SS_GaussFiltered(i,1),PC.r463_Day1_iHP_SS_GaussFiltered(i,2),PC.r463_Day1_iHP_SS_GaussFiltered(i,3),'.'); p3.MarkerSize=40;
    p3.Color=colorMap(256-scale*(i-1),:);
end
p1=plot3(LearnedState.r463_Day1_iHP_SS_GaussFiltered(1),LearnedState.r463_Day1_iHP_SS_GaussFiltered(2),LearnedState.r463_Day1_iHP_SS_GaussFiltered(3),'.'); p1.Color=[0.5 0.5 0.5]; p1.MarkerSize=50;
grid on
g=gca; g.FontSize=12;
xlabel('PC1'); ylabel('PC2'); zlabel('PC3');
title('r463-Day1, B3, iHP, SS');
% CR
sheetTitle = subplot('Position', [0.8 0.5 0.2 0.4]); hold on;
p0=plot3(PC.r463_Day1_iHP_CR_GaussFiltered(:,1),PC.r463_Day1_iHP_CR_GaussFiltered(:,2),PC.r463_Day1_iHP_CR_GaussFiltered(:,3),'k--'); p0.LineWidth=0.5; p0.MarkerSize=5;
scale=floor(256/size(PC.r463_Day1_iHP_CR_GaussFiltered,1));
for i=1:size(PC.r463_Day1_iHP_CR_GaussFiltered,1)
    p3=plot3(PC.r463_Day1_iHP_CR_GaussFiltered(i,1),PC.r463_Day1_iHP_CR_GaussFiltered(i,2),PC.r463_Day1_iHP_CR_GaussFiltered(i,3),'.'); p3.MarkerSize=40;
    p3.Color=colorMap(256-scale*(i-1),:);
end
p1=plot3(LearnedState.r463_Day1_iHP_CR_GaussFiltered(1),LearnedState.r463_Day1_iHP_CR_GaussFiltered(2),LearnedState.r463_Day1_iHP_CR_GaussFiltered(3),'.'); p1.Color=[0.5 0.5 0.5]; p1.MarkerSize=50;
grid on
g=gca; g.FontSize=12;
xlabel('PC1'); ylabel('PC2'); zlabel('PC3');
title('r463-Day1, B3, iHP, CR');

% SS- distance
sheetTitle = subplot('Position', [0.1 0.1 0.3 0.3]); hold on;
if Dimension.r463_Day1_dHP > 2
    DHP=EUdist.r463_Day1_dHP_SS_Weighted_GaussFiltered;
    DHP=DHP/max(DHP);
    p1=plot(1:length(DHP),DHP(1:end),'r.-'); p1(1,1).MarkerSize=20; p1(1,1).LineWidth=1.5;
    xlim([1 length(DHP)]);
end
hold on;
VHP=EUdist.r463_Day1_iHP_SS_Weighted_GaussFiltered;
VHP=VHP/max(VHP);
p2=plot(1:length(VHP),VHP(1:end),'b.-'); p2(1,1).MarkerSize=20; p2(1,1).LineWidth=1.5;
ylabel('SS-chosen trial');
legend([p1,p2],'dHP','ivHP')
%
yyaxis right
p3=plot(LearningCurve.r463_B3_Day1_WinBugs_SS,'k-'); p3(1,1).MarkerSize=20; p3(1,1).LineWidth=1.5;
g=gca; g.YDir='rev';
g.FontSize=12;
%         g.YLim=[0.39 1]
l1=legend([p1 p2], 'Dorsal', 'Ventral'); l1.FontSize=10;
l1=line([LearningTrial.r463_B3_Day1_SS LearningTrial.r463_B3_Day1_SS], [g.YLim]); l1.LineWidth=1; l1.Color='k';
g.XLabel.String='Trial';
t1=text(6,g.YLim(1)+(g.YLim(2)-g.YLim(1))*0.15, ['Dorsal n = ' num2str(size(PC.r463_Day1_dHP,2)) ', (' num2str(variance) '% Var = ' num2str(Dimension.r463_Day1_dHP) ')']); t1.FontSize=12;
t1=text(6,g.YLim(1)+(g.YLim(2)-g.YLim(1))*0.05, ['Ventral n = ' num2str(size(PC.r463_Day1_iHP,2)) ', (' num2str(variance) '% Var = ' num2str(Dimension.r463_Day1_iHP) ')']); t1.FontSize=12;

% CR- distance
sheetTitle = subplot('Position', [0.55 0.1 0.3 0.3]); hold on;
if Dimension.r463_Day1_dHP > 2
    DHP=EUdist.r463_Day1_dHP_CR_Weighted_GaussFiltered;
    DHP=DHP/max(DHP);
    p1=plot(1:length(DHP),DHP(1:end),'r.-'); p1(1,1).MarkerSize=20; p1(1,1).LineWidth=1.5;
    xlim([1 length(DHP)]);
end
hold on;
VHP=EUdist.r463_Day1_iHP_CR_Weighted_GaussFiltered;
VHP=VHP/max(VHP);
p2=plot(1:length(VHP),VHP(1:end),'b.-'); p2(1,1).MarkerSize=20; p2(1,1).LineWidth=1.5;
ylabel('CR-chosen trial');
legend([p1,p2],'dHP','ivHP');
%
yyaxis right
p3=plot(LearningCurve.r463_B3_Day1_WinBugs_CR,'k-'); p3(1,1).MarkerSize=20; p3(1,1).LineWidth=1.5;
g=gca; g.YDir='rev';
g.FontSize=12;
%         g.YLim=[0.4 0.92]
l1=legend([p1 p2], 'Dorsal', 'Ventral'); l1.FontSize=10;
l1=line([LearningTrial.r463_B3_Day1_CR LearningTrial.r463_B3_Day1_CR], [g.YLim]); l1.LineWidth=1; l1.Color='k';
g.XLabel.String='Trial';
t1=text(6,g.YLim(1)+(g.YLim(2)-g.YLim(1))*0.15, ['Dorsal n = ' num2str(size(PC.r463_Day1_dHP,2)) ', (' num2str(variance) '% Var = ' num2str(Dimension.r463_Day1_dHP) ')']); t1.FontSize=12;
t1=text(6,g.YLim(1)+(g.YLim(2)-g.YLim(1))*0.05, ['Ventral n = ' num2str(size(PC.r463_Day1_iHP,2)) ', (' num2str(variance) '% Var = ' num2str(Dimension.r463_Day1_iHP) ')']); t1.FontSize=12;

%% Figure 7I
Trials = [LearningTrial.r448_B3_Day1_SS-1 LearningTrial.r448_B3_Day2_SS-1 LearningTrial.r448_B3_Day3_SS-1 LearningTrial.r448_B3_Day3_SS-1 ...
    LearningTrial.r459_B3_Day1_SS-1 LearningTrial.r459_B3_Day2_SS-1 LearningTrial.r459_B3_Day3_SS-1 LearningTrial.r459_B3_Day4_SS-1 ...
    LearningTrial.r463_B3_Day1_SS-1 LearningTrial.r463_B3_Day3_SS-1 LearningTrial.r463_B3_Day4_SS-1 LearningTrial.r463_B3_Day4_SS-1 ...
    LearningTrial.r473_B3_Day2_SS-1 LearningTrial.r473_B3_Day3_SS-1 LearningTrial.r473_B3_Day4_SS-1 ...
    LearningTrial.r509_B3_Day1_SS-1 LearningTrial.r509_B3_Day2_SS-1 LearningTrial.r509_B3_Day3_SS-1 LearningTrial.r509_B3_Day4_SS-1];
PreLearend_Scaling=1;    
for i=1:length(Trials)
    PreLearend_Scaling = lcm(PreLearend_Scaling, Trials(i));
end
PreLearned_DownScale=PreLearend_Scaling/14/23/2;
PreLearned_X=1/PreLearned_DownScale:1/PreLearned_DownScale:1;

Trials = [size(PC.r448_Day1_dHP_SS,1)-LearningTrial.r448_B3_Day1_SS size(PC.r448_Day2_dHP_SS,1)-LearningTrial.r448_B3_Day2_SS size(PC.r448_Day3_dHP_SS,1)-LearningTrial.r448_B3_Day3_SS ...
    size(PC.r459_Day1_dHP_SS,1)-LearningTrial.r459_B3_Day1_SS, size(PC.r459_Day2_dHP_SS,1)-LearningTrial.r459_B3_Day2_SS, size(PC.r459_Day3_dHP_SS,1)-LearningTrial.r459_B3_Day3_SS, size(PC.r459_Day4_dHP_SS,1)-3-LearningTrial.r459_B3_Day4_SS ...
    size(PC.r463_Day1_dHP_SS,1)-LearningTrial.r463_B3_Day1_SS, size(PC.r463_Day2_dHP_SS,1)-LearningTrial.r463_B3_Day2_SS, size(PC.r463_Day3_dHP_SS,1)-LearningTrial.r463_B3_Day3_SS, size(PC.r463_Day4_dHP_SS,1)-LearningTrial.r463_B3_Day4_SS ...
    size(PC.r473_Day2_dHP_SS,1)-LearningTrial.r473_B3_Day2_SS, size(PC.r473_Day3_dHP_SS,1)-LearningTrial.r473_B3_Day3_SS, size(PC.r473_Day4_dHP_SS,1)-LearningTrial.r473_B3_Day4_SS, ...
    size(PC.r509_Day1_dHP_SS,1)-LearningTrial.r509_B3_Day1_SS, size(PC.r509_Day2_dHP_SS,1)-LearningTrial.r509_B3_Day2_SS, size(PC.r509_Day3_dHP_SS,1)-LearningTrial.r509_B3_Day3_SS, size(PC.r509_Day4_dHP_SS,1)-LearningTrial.r509_B3_Day4_SS];
PostLearend_Scaling=1;    
for i=1:length(Trials)
    PostLearend_Scaling = lcm(PostLearend_Scaling, Trials(i));
end
PostLearned_DownScale=PostLearend_Scaling/17/13/15/19/2;
PostLearned_X=1:1/PostLearned_DownScale:2-1/PostLearned_DownScale;

TotalTrials = [size(PC.r448_Day1_dHP_SS,1), size(PC.r448_Day2_dHP_SS,1), size(PC.r448_Day3_dHP_SS,1)...
    size(PC.r459_Day1_dHP_SS,1), size(PC.r459_Day2_dHP_SS,1), size(PC.r459_Day3_dHP_SS,1), size(PC.r459_Day4_dHP_SS,1)-3 ...
    size(PC.r463_Day1_dHP_SS,1), size(PC.r463_Day2_dHP_SS,1), size(PC.r463_Day3_dHP_SS,1), size(PC.r463_Day4_dHP_SS,1) ...
    size(PC.r473_Day2_dHP_SS,1), size(PC.r473_Day3_dHP_SS,1), size(PC.r473_Day4_dHP_SS,1), ...
    size(PC.r509_Day1_dHP_SS,1), size(PC.r509_Day2_dHP_SS,1), size(PC.r509_Day3_dHP_SS,1), size(PC.r509_Day4_dHP_SS,1)];
TotalLearend_Scaling=1;    
for i=1:length(TotalTrials)
    TotalLearend_Scaling = lcm(TotalLearend_Scaling, TotalTrials(i));
end
TotalLearned_DownScale=TotalLearend_Scaling/28/29/26/5/9;
TotalLearned_X=1/TotalLearned_DownScale:1/TotalLearned_DownScale:1;

Normal_iHP = [1 2 3 5 6 8 11 12 13 14 15 16]; 
SSCH_iHP=[2 5 8 12 15 16];
Quantity_iHP=[3 6 11 13 14];
FewUnits_iHP=[7 17 18];
FailToLearn_iHP=[4 9 10];

Normal_dHP = [5 6 7 8 11]; 
SSCH_dHP=[5 8];
Quantity_dHP=[6 7 11];
FewUnits_dHP=[2 3 12 13 14 15 16 17 18];
FailToLearn_dHP=[4 9 10];
Performance = [2 3 5 6 7 8 11 12 13 14 15 16 17 18];

% % Line graph plot
fig=figure; hold on;
fig.Position=[0 0 1000 1000];
% iHP
for i=1:9:90
    Jin_MeanSTE_Line(PreLearned_X(i),PreleaernED.iHP(Normal_iHP,i));
end
plot(PreLearned_X,mean(PreleaernED.iHP(Normal_iHP,:)),'k');

for i=1:15:length(PostLearned_X)
    Jin_MeanSTE_Line(PostLearned_X(i),PostleaernED.iHP(Normal_iHP,i));
end
plot(PostLearned_X,mean(PostleaernED.iHP(Normal_iHP,:)),'k');

% dHP
Color.color=2; Color.alpha=0.4;
for i=1:9:90
    Jin_MeanSTE_Line(PreLearned_X(i),PreleaernED.dHP(Normal_dHP,i),Color);
end
plot(PreLearned_X,mean(PreleaernED.dHP(Normal_dHP,:)),'R');
for i=1:15:length(PostLearned_X)
    Jin_MeanSTE_Line(PostLearned_X(i),PostleaernED.dHP(Normal_dHP,i),Color);
end
plot(PostLearned_X,mean(PostleaernED.dHP(Normal_dHP,:)),'R');
g=gca; g.FontSize=18;
ylim([0.1 1]);   
xlim([0 2]);
g.YTick=g.YTick(1:end-1);
g.XTick=[0.5 1.5];
g.XTickLabel={'Pre-learn phase','Learned phase'};
l1=line([1 1], [0 1.1]); l1.LineWidth=1.5; l1.Color='k';
ylabel('Normalized Euclidean distance');

% statistical testing
m=1;
for i=1:10:90
    [~,p_ttest(m)]=ttest2(PreleaernED.iHP(Normal_iHP,i), PreleaernED.dHP(Normal_dHP,i));
    m=m+1;
end

%% Figure 7J
Trials_CR = [LearningTrial.r448_B3_Day1_CR-1 LearningTrial.r448_B3_Day2_CR-1 LearningTrial.r448_B3_Day3_CR-1 LearningTrial.r448_B3_Day3_CR-1 ...
    LearningTrial.r459_B3_Day1_CR-1 LearningTrial.r459_B3_Day2_CR-1 LearningTrial.r459_B3_Day3_CR-1 LearningTrial.r459_B3_Day4_CR-1 ...
    LearningTrial.r463_B3_Day1_CR-1 LearningTrial.r463_B3_Day3_CR-1 LearningTrial.r463_B3_Day4_CR-1 LearningTrial.r463_B3_Day4_CR-1 ...
    LearningTrial.r473_B3_Day2_CR-1 LearningTrial.r473_B3_Day3_CR-1 LearningTrial.r473_B3_Day4_CR-1 ...
    LearningTrial.r509_B3_Day1_CR-1 LearningTrial.r509_B3_Day2_CR-1 LearningTrial.r509_B3_Day3_CR-1 LearningTrial.r509_B3_Day4_CR-1];
PreLearend_Scaling_CR=1;    
for i=1:length(Trials_CR)
    PreLearend_Scaling_CR = lcm(PreLearend_Scaling_CR, Trials_CR(i));
end
PreLearned_DownScale_CR=PreLearend_Scaling_CR/19/14/15/4;
PreLearned_X_CR=1/PreLearned_DownScale_CR:1/PreLearned_DownScale_CR:1;

Trials_CR = [size(PC.r448_Day1_dHP_CR,1)-LearningTrial.r448_B3_Day1_CR+1 size(PC.r448_Day2_dHP_CR,1)-LearningTrial.r448_B3_Day2_CR+1 size(PC.r448_Day3_dHP_CR,1)-LearningTrial.r448_B3_Day3_CR+1 ...
    size(PC.r459_Day1_dHP_CR,1)-LearningTrial.r459_B3_Day1_CR+1, size(PC.r459_Day2_dHP_CR,1)-LearningTrial.r459_B3_Day2_CR+1, size(PC.r459_Day3_dHP_CR,1)-LearningTrial.r459_B3_Day3_CR+1, size(PC.r459_Day4_dHP_CR,1)-LearningTrial.r459_B3_Day4_CR+1 ...
    size(PC.r463_Day1_dHP_CR,1)-LearningTrial.r463_B3_Day1_CR+1, size(PC.r463_Day2_dHP_CR,1)-LearningTrial.r463_B3_Day2_CR+1, size(PC.r463_Day3_dHP_CR,1)-LearningTrial.r463_B3_Day3_CR+1, size(PC.r463_Day4_dHP_CR,1)-LearningTrial.r463_B3_Day4_CR+1 ...
    size(PC.r473_Day2_dHP_CR,1)-LearningTrial.r473_B3_Day2_CR+1, size(PC.r473_Day3_dHP_CR,1)-LearningTrial.r473_B3_Day3_CR+1, size(PC.r473_Day4_dHP_CR,1)-LearningTrial.r473_B3_Day4_CR+1, ...
    size(PC.r509_Day1_dHP_CR,1)-LearningTrial.r509_B3_Day1_CR+1, size(PC.r509_Day2_dHP_CR,1)-LearningTrial.r509_B3_Day2_CR+1, size(PC.r509_Day3_dHP_CR,1)-LearningTrial.r509_B3_Day3_CR+1, size(PC.r509_Day4_dHP_CR,1)-LearningTrial.r509_B3_Day4_CR+1];
PostLearend_Scaling_CR=1;    
Trials_CR(Trials_CR==0)=[];
for i=1:length(Trials_CR)
    PostLearend_Scaling_CR = lcm(PostLearend_Scaling_CR, Trials_CR(i));
end
PostLearned_DownScale_CR=PostLearend_Scaling_CR;
PostLearned_X_CR=1:1/PostLearned_DownScale_CR:2-1/PostLearned_DownScale_CR;

TotalTrials_CR = [size(PC.r448_Day1_dHP_CR,1), size(PC.r448_Day2_dHP_CR,1), size(PC.r448_Day3_dHP_CR,1)...
    size(PC.r459_Day1_dHP_CR,1), size(PC.r459_Day2_dHP_CR,1), size(PC.r459_Day3_dHP_CR,1), size(PC.r459_Day4_dHP_CR,1) ...
    size(PC.r463_Day1_dHP_CR,1), size(PC.r463_Day2_dHP_CR,1), size(PC.r463_Day3_dHP_CR,1), size(PC.r463_Day4_dHP_CR,1) ...
    size(PC.r473_Day2_dHP_CR,1), size(PC.r473_Day3_dHP_CR,1), size(PC.r473_Day4_dHP_CR,1), ...
    size(PC.r509_Day1_dHP_CR,1), size(PC.r509_Day2_dHP_CR,1), size(PC.r509_Day3_dHP_CR,1), size(PC.r509_Day4_dHP_CR,1)];
TotalLearend_Scaling_CR=1;    
for i=1:length(TotalTrials_CR)
    TotalLearend_Scaling_CR = lcm(TotalLearend_Scaling_CR, TotalTrials_CR(i));
end
TotalLearned_DownScale_CR=TotalLearend_Scaling_CR/24/19/17/31/6;
TotalLearned_X_CR=1/TotalLearned_DownScale_CR:1/TotalLearned_DownScale_CR:1;


Normal_iHP = [1 2 3 5 6 8 11 12 13 14 15 16]; 
SSCH_iHP=[2 5 8 12 15 16];
Quantity_iHP=[3 6 11 13 14];
FewUnits_iHP=[7 17 18];
FailToLearn_iHP=[4 9 10];

Normal_dHP = [5 6 7 8 11]; 
SSCH_dHP=[5 8];
Quantity_dHP=[6 7 11];
FewUnits_dHP=[2 3 12 13 14 15 16 17 18];
FailToLearn_dHP=[4 9 10];
Performance = [2 3 5 6 7 8 11 12 13 14 15 16 17 18];

% % Line graph version
% Normal session
fig=figure; hold on;
fig.Position=[0 0 1000 1000];
% iHP
for i=1:17:174
    Jin_MeanSTE_Line(PreLearned_X_CR(i),PreleaernED_CR.iHP(Normal_iHP,i));
end
plot(PreLearned_X_CR,mean(PreleaernED_CR.iHP(Normal_iHP,:)),'k');

for i=1:6:length(PostLearned_X_CR)
    Jin_MeanSTE_Line(PostLearned_X_CR(i),PostleaernED_CR.iHP(Normal_iHP,i));
end
plot(PostLearned_X_CR,mean(PostleaernED_CR.iHP(Normal_iHP,:)),'k');

% dHP
Color.color=2; Color.alpha=0.4;
for i=1:17:174
    Jin_MeanSTE_Line(PreLearned_X_CR(i),PreleaernED_CR.dHP(Normal_dHP,i),Color);
end
plot(PreLearned_X_CR,mean(PreleaernED_CR.dHP(Normal_dHP,:)),'R');
for i=1:6:length(PostLearned_X_CR)
    Jin_MeanSTE_Line(PostLearned_X_CR(i),PostleaernED_CR.dHP(Normal_dHP,i),Color);
end
plot(PostLearned_X_CR,mean(PostleaernED_CR.dHP(Normal_dHP,:)),'R');

[h,p]=ttest2(PreleaernED_CR.iHP(Normal_iHP,5), PreleaernED_CR.dHP(Normal_dHP,5))

g=gca; g.FontSize=18;
ylim([0 1]);   
xlim([0 2]);
g.YTick=g.YTick(1:end-1);
g.XTick=[0.5 1.5];
g.XTickLabel={'Pre-learn phase','Learned phase'};
l1=line([1 1], [0 1.1]); l1.LineWidth=1.5; l1.Color='k';
ylabel('Normalized Euclidean distance');
