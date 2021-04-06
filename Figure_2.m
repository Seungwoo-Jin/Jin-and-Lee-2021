%% Figure 2B
% % Reward preference data of rat [448, 459, 463, 473, 488, 509]
SSCH = [80 85 90 90 95 80];
FRCH = [75 85 85 85 90 90];
SSFR = [35 35 50 50 55 65];

%
fig=figure; hold on;
fig.Position=[0 0 400 500];
% Width=0.3;
c.color=53; c.alpha=0.4;
Jin_MeanSTE_Line(1,SSCH)
for i=1:length(SSCH)
    plot(1,SSCH(i),'k.');
end
Jin_MeanSTE_Line(2,FRCH)
for i=1:length(FRCH)
    plot(2,FRCH(i),'k.');
end
Jin_MeanSTE_Line(3,SSFR)
for i=1:length(SSFR)
    plot(3,SSFR(i),'k.');
end
ylim([0 100])
g=gca;
g.YTick=0:20:100;

% % statistical testing
x1=1*ones(1,6);
x2=2*ones(1,6);
x3=3*ones(1,6);
y1=SSCH;
y2=FRCH;
y3=SSFR;
[p,anovatab,stats] = kruskalwallis([y1 y2 y3],[x1 x2 x3],'off');
multcompare(stats);

%% Figure 2C
clear all; close all;
load('TimeInformation.mat');

% % session number
SS=[1 8 15 22 29 36]; 
SSCH=[2 3 9 10 16 17 23 24 30 31 37 38];
FRCH=[4 5 11 12 18 19 25 26 32 33 39 40];
SSFR=[6 7 13 14 20 21 27 28 34 35 41 42];

BehaviorParam.SS.Time_B1_Approach=BehaviorParam.Time_B1_Approach(SS,:,:);
BehaviorParam.SS.Time_B2_Approach=BehaviorParam.Time_B2_Approach(SS,:,:);
BehaviorParam.SS.Time_B3_Approach=BehaviorParam.Time_B3_Approach(SS,:,:);
BehaviorParam.SS.Time_B4_Approach=BehaviorParam.Time_B4_Approach(SS,:,:);
BehaviorParam.SSCH.Time_B1_Approach=BehaviorParam.Time_B1_Approach(SSCH,:,:);
BehaviorParam.SSCH.Time_B2_Approach=BehaviorParam.Time_B2_Approach(SSCH,:,:);
BehaviorParam.FRCH.Time_B1_Approach=BehaviorParam.Time_B1_Approach(FRCH,:,:);
BehaviorParam.FRCH.Time_B2_Approach=BehaviorParam.Time_B2_Approach(FRCH,:,:);
BehaviorParam.SSFR.Time_B1_Approach=BehaviorParam.Time_B1_Approach(SSFR,:,:);
BehaviorParam.SSFR.Time_B2_Approach=BehaviorParam.Time_B2_Approach(SSFR,:,:);
BehaviorParam.SSCH.Time_B3_Approach=BehaviorParam.Time_B3_Approach(SSCH,:,:);
BehaviorParam.SSCH.Time_B4_Approach=BehaviorParam.Time_B4_Approach(SSCH,:,:);
BehaviorParam.FRCH.Time_B3_Approach=BehaviorParam.Time_B3_Approach(FRCH,:,:);
BehaviorParam.FRCH.Time_B4_Approach=BehaviorParam.Time_B4_Approach(FRCH,:,:);
BehaviorParam.SSFR.Time_B3_Approach=BehaviorParam.Time_B3_Approach(SSFR,:,:);
BehaviorParam.SSFR.Time_B4_Approach=BehaviorParam.Time_B4_Approach(SSFR,:,:);

BehaviorParam.SSCH.Time_B1_LeaveRewardZone=BehaviorParam.Time_B1_LeaveRewardZone(SSCH,:);
BehaviorParam.SSCH.Time_B2_LeaveRewardZone=BehaviorParam.Time_B2_LeaveRewardZone(SSCH,:);
BehaviorParam.FRCH.Time_B1_LeaveRewardZone=BehaviorParam.Time_B1_LeaveRewardZone(FRCH,:);
BehaviorParam.FRCH.Time_B2_LeaveRewardZone=BehaviorParam.Time_B2_LeaveRewardZone(FRCH,:);
BehaviorParam.SSFR.Time_B1_LeaveRewardZone=BehaviorParam.Time_B1_LeaveRewardZone(SSFR,:);
BehaviorParam.SSFR.Time_B2_LeaveRewardZone=BehaviorParam.Time_B2_LeaveRewardZone(SSFR,:);
BehaviorParam.SSCH.Time_B3_LeaveRewardZone=BehaviorParam.Time_B3_LeaveRewardZone(SSCH,:);
BehaviorParam.SSCH.Time_B4_LeaveRewardZone=BehaviorParam.Time_B4_LeaveRewardZone(SSCH,:);
BehaviorParam.FRCH.Time_B3_LeaveRewardZone=BehaviorParam.Time_B3_LeaveRewardZone(FRCH,:);
BehaviorParam.FRCH.Time_B4_LeaveRewardZone=BehaviorParam.Time_B4_LeaveRewardZone(FRCH,:);
BehaviorParam.SSFR.Time_B3_LeaveRewardZone=BehaviorParam.Time_B3_LeaveRewardZone(SSFR,:);
BehaviorParam.SSFR.Time_B4_LeaveRewardZone=BehaviorParam.Time_B4_LeaveRewardZone(SSFR,:);
track=21;

for Trial=1:2:30
    for i=1:size(BehaviorParam.SSCH.Time_B1_Approach,1)
        for j=1:size(BehaviorParam.SSCH.Time_B1_Approach,3)
            temp=(find(~isnan(BehaviorParam.SSCH.Time_B1_Approach(i,:,j))));
            Index_end=temp(end);
            Pre_latency_SSCH_B1(i,j,Trial)=(BehaviorParam.SSCH.Time_B1_Approach(i,Index_end-Trial,j));
            Post_latency_SSCH_B2(i,j,Trial)=(BehaviorParam.SSCH.Time_B2_Approach(i,Index_end+Trial,j));
        end
    end
end
for Trial=2:2:30
    for i=1:size(BehaviorParam.SSCH.Time_B1_Approach,1)
        for j=1:size(BehaviorParam.SSCH.Time_B1_Approach,3)
            temp=(find(~isnan(BehaviorParam.SSCH.Time_B1_Approach(i,:,j))));
            Index_end=temp(end);
            Pre_latency_SSCH_B1(i,j,Trial)=(BehaviorParam.SSCH.Time_B1_Approach(i,Index_end-Trial+2,j));
            Post_latency_SSCH_B2(i,j,Trial)=(BehaviorParam.SSCH.Time_B2_Approach(i,Index_end+Trial,j));
        end
    end
end
latency_SSCH_B12(:,track,5) = Pre_latency_SSCH_B1(:,track,1);
latency_SSCH_B12(:,track,4) = Pre_latency_SSCH_B1(:,track,2);
latency_SSCH_B12(:,track,3) = Pre_latency_SSCH_B1(:,track,3);
latency_SSCH_B12(:,track,2) = Pre_latency_SSCH_B1(:,track,4);
latency_SSCH_B12(:,track,1) = Pre_latency_SSCH_B1(:,track,5);
for i=1:30
    latency_SSCH_B12(:,track,i+5) = Post_latency_SSCH_B2(:,track,i);
end

for Trial=1:2:30
    for i=1:size(BehaviorParam.FRCH.Time_B1_Approach,1)
        for j=1:size(BehaviorParam.FRCH.Time_B1_Approach,3)
            temp=(find(~isnan(BehaviorParam.FRCH.Time_B1_Approach(i,:,j))));
            Index_end=temp(end);
            Pre_latency_FRCH_B1(i,j,Trial)=(BehaviorParam.FRCH.Time_B1_Approach(i,Index_end-Trial,j));
            Post_latency_FRCH_B2(i,j,Trial)=(BehaviorParam.FRCH.Time_B2_Approach(i,Index_end+Trial,j));
        end
    end
end
for Trial=2:2:30
    for i=1:size(BehaviorParam.FRCH.Time_B1_Approach,1)
        for j=1:size(BehaviorParam.FRCH.Time_B1_Approach,3)
            temp=(find(~isnan(BehaviorParam.FRCH.Time_B1_Approach(i,:,j))));
            Index_end=temp(end);
            Pre_latency_FRCH_B1(i,j,Trial)=(BehaviorParam.FRCH.Time_B1_Approach(i,Index_end-Trial+2,j));
            Post_latency_FRCH_B2(i,j,Trial)=(BehaviorParam.FRCH.Time_B2_Approach(i,Index_end+Trial,j));
        end
    end
end

latency_FRCH_B12(:,track,5) = Pre_latency_FRCH_B1(:,track,1);
latency_FRCH_B12(:,track,4) = Pre_latency_FRCH_B1(:,track,2);
latency_FRCH_B12(:,track,3) = Pre_latency_FRCH_B1(:,track,3);
latency_FRCH_B12(:,track,2) = Pre_latency_FRCH_B1(:,track,4);
latency_FRCH_B12(:,track,1) = Pre_latency_FRCH_B1(:,track,5);
for i=1:30
    latency_FRCH_B12(:,track,i+5) = Post_latency_FRCH_B2(:,track,i);
end

for Trial=1:2:30
    for i=1:size(BehaviorParam.SSFR.Time_B1_Approach,1)
        for j=1:size(BehaviorParam.SSFR.Time_B1_Approach,3)
            temp=(find(~isnan(BehaviorParam.SSFR.Time_B1_Approach(i,:,j))));
            Index_end=temp(end);
            Pre_latency_SSFR_B1(i,j,Trial)=(BehaviorParam.SSFR.Time_B1_Approach(i,Index_end-Trial,j));
            Post_latency_SSFR_B2(i,j,Trial)=(BehaviorParam.SSFR.Time_B2_Approach(i,Index_end+Trial,j));
        end
    end
end
for Trial=2:2:30
    for i=1:size(BehaviorParam.SSFR.Time_B1_Approach,1)
        for j=1:size(BehaviorParam.SSFR.Time_B1_Approach,3)
            temp=(find(~isnan(BehaviorParam.SSFR.Time_B1_Approach(i,:,j))));
            Index_end=temp(end);
            Pre_latency_SSFR_B1(i,j,Trial)=(BehaviorParam.SSFR.Time_B1_Approach(i,Index_end-Trial+2,j));
            Post_latency_SSFR_B2(i,j,Trial)=(BehaviorParam.SSFR.Time_B2_Approach(i,Index_end+Trial,j));
        end
    end
end

latency_SSFR_B12(:,track,5) = Pre_latency_SSFR_B1(:,track,1);
latency_SSFR_B12(:,track,4) = Pre_latency_SSFR_B1(:,track,2);
latency_SSFR_B12(:,track,3) = Pre_latency_SSFR_B1(:,track,3);
latency_SSFR_B12(:,track,2) = Pre_latency_SSFR_B1(:,track,4);
latency_SSFR_B12(:,track,1) = Pre_latency_SSFR_B1(:,track,5);
for i=1:30
    latency_SSFR_B12(:,track,i+5) = Post_latency_SSFR_B2(:,track,i);
end


% % Plotting
figure; hold on;
Jin_Errorbar(1,Latency.SSvsCR_pre)
Jin_Errorbar(2,Latency.SSvsCR_post)
Jin_Errorbar(3,Latency.FLvsCR_pre)
Jin_Errorbar(4,Latency.FLvsCR_post)
Jin_Errorbar(5,Latency.SSvsFL_pre)
Jin_Errorbar(6,Latency.SSvsFL_post)
g=gca; yaxis=g.YLim(2);

% % Statistical testing
[p_ssch, H, stats]=signrank(Latency.SSvsCR_pre,Latency.SSvsCR_post);
[p_frch, H, stat]=signrank(Latency.FLvsCR_pre,Latency.FLvsCR_post);
[p_ssfr, h, stat]=signrank(Latency.SSvsFL_pre,Latency.SSvsFL_post);
