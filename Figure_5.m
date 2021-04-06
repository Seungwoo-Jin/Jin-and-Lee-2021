load('Figure5.mat')
%% Figure 5D
LearningTrial.B1_SS = LearningTrial.B1(:,1:2);
LearningTrial.B2_SS = LearningTrial.B2(:,1:2);
LearningTrial.B3_SS = LearningTrial.B3(:,1:2);
LearningTrial.B4_SS = LearningTrial.B4(:,1:2);
LearningTrial.B1_QQ = LearningTrial.B1(:,3:4);
LearningTrial.B2_QQ = LearningTrial.B2(:,3:4);
LearningTrial.B3_QQ = LearningTrial.B3(:,3:4);
LearningTrial.B4_QQ = LearningTrial.B4(:,3:4);

% SS
y1=reshape(LearningTrial.B1_SS,1,12);
y2=reshape(LearningTrial.B2_SS,1,12);
y3=reshape(LearningTrial.B3_SS,1,12);

y1=GetZeroToNaN(y1);
y2=GetZeroToNaN(y2);
y3=GetZeroToNaN(y3);
y1(3)=NaN;y2(3)=NaN;y3(3)=NaN;
figure; hold on;
clear Color
Color.color=2; Color.alpha=1;
Jin_MeanSTE_Line(1,y1,Color);
Jin_MeanSTE_Line(3,y2,Color);
Jin_MeanSTE_Line(5,y3,Color);

% QQ
y1=reshape(LearningTrial.B1_QQ,1,12);
y2=reshape(LearningTrial.B2_QQ,1,12);
y3=reshape(LearningTrial.B3_QQ,1,12);
y1(1)=NaN;y2(1)=NaN;y3(1)=NaN;
y1=GetZeroToNaN(y1);
y2=GetZeroToNaN(y2);
y3=GetZeroToNaN(y3);

% figure; 
hold on;
Color.color=1; Color.alpha=1;
Jin_MeanSTE_Line(1,y1,Color);
Jin_MeanSTE_Line(3,y2,Color);
Jin_MeanSTE_Line(5,y3,Color);

% % Statistical testing
[B1_QQ.data, B1_QQ.index]=GetNaNToNull(LearningTrial.B1_QQ(:));
[B2_QQ.data, B2_QQ.index]=GetNaNToNull(LearningTrial.B2_QQ(:));
[B3_QQ.data, B3_QQ.index]=GetNaNToNull(LearningTrial.B3_QQ(:));
[B1_SS.data, B1_SS.index]=GetNaNToNull(LearningTrial.B1_SS(:));
[B2_SS.data, B2_SS.index]=GetNaNToNull(LearningTrial.B2_SS(:));
[B3_SS.data, B3_SS.index]=GetNaNToNull(LearningTrial.B3_SS(:));

[h,p,~,stat]=ttest2(B1_QQ.data,B1_SS.data)
[h,p,~,stat]=ttest2(B2_QQ.data,B2_SS.data)
[h,p,~,stat]=ttest2(B3_QQ.data,B3_SS.data)

%% Figure 5E
SSCH=[1 2 4 5 8 9 14 17 18 21 22];
Quantity=[3 6 7 10 11 12 13 15 16 19 20];

Latency.B1_SSCH=Latency.B1(SSCH);
Latency.B1_Quantity=Latency.B1(Quantity);
Latency.B2_SSCH=Latency.B2(SSCH);
Latency.B2_Quantity=Latency.B2(Quantity);
Latency.B3_SSCH=Latency.B3(SSCH);
Latency.B3_Quantity=Latency.B3(Quantity);
Latency.B4_SSCH=Latency.B4(SSCH);
Latency.B4_Quantity=Latency.B4(Quantity);

figure; hold on;
Color.color=2; Color.alpha=1;
Jin_MeanSTE_Line(1,Latency.B1_SSCH,Color);
Jin_MeanSTE_Line(3,Latency.B2_SSCH,Color);
Jin_MeanSTE_Line(5,Latency.B3_SSCH,Color);

% figure; hold on;
Color.color=1; Color.alpha=1;
Jin_MeanSTE_Line(1,Latency.B1_Quantity,Color);
Jin_MeanSTE_Line(3,Latency.B2_Quantity,Color);
Jin_MeanSTE_Line(5,Latency.B3_Quantity,Color);
ylim([0 3]);

[h,p,~,~]=ttest2(Latency.B1,Latency.B2)
[h,p,~,~]=ttest2(Latency.B1,Latency.B3)
[h,p,~,~]=ttest2(Latency.B1,Latency.B4)
[h,p,~,~]=ttest2(Latency.B2,Latency.B3)
[h,p,~,~]=ttest2(Latency.B2,Latency.B4)
[h,p,~,~]=ttest2(Latency.B3,Latency.B4)

