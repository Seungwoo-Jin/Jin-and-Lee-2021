clear all
load('Figure6.mat');
%% Figure 6C
% Blocks 1 vs 2 
% % SS vs CR
Corr_dHP_B12=ClusterInfo.Outbound_dHP_SpaCorr_B12((PlaceField_dHP_B1 & PlaceField_dHP_B3 & ChoiceFieldRatio_dHP_B13) | (PlaceField_dHP_B2 & PlaceField_dHP_B4 & ChoiceFieldRatio_dHP_B24) & Sunflower_dHP);
Corr_iHP_B12=ClusterInfo.Outbound_iHP_SpaCorr_B12((PlaceField_iHP_B1 & PlaceField_iHP_B3 & ChoiceFieldRatio_iHP_B13) | (PlaceField_iHP_B2 & PlaceField_iHP_B4 & ChoiceFieldRatio_iHP_B24) & Sunflower_iHP);
fig=figure; hold on;
fig.Position=[0 0 500 500];
cdfplot(Corr_dHP_B12);
cdfplot(Corr_iHP_B12);   
xlim([-0.6 1]);
[p,~,stat]=ranksum(Corr_dHP_B12, Corr_iHP_B12);

% % 4/4 SS vs 1/4 SS
Corr_dHP_B12_qauntity=ClusterInfo.Outbound_dHP_SpaCorr_B12((PlaceField_dHP_B1 & PlaceField_dHP_B3 & ChoiceFieldRatio_dHP_B13) | (PlaceField_dHP_B2 & PlaceField_dHP_B4 & ChoiceFieldRatio_dHP_B24) & Quantity_dHP);
Corr_iHP_B12_qauntity=ClusterInfo.Outbound_iHP_SpaCorr_B12((PlaceField_iHP_B1 & PlaceField_iHP_B3 & ChoiceFieldRatio_iHP_B13) | (PlaceField_iHP_B2 & PlaceField_iHP_B4 & ChoiceFieldRatio_iHP_B24) & Quantity_iHP);
fig=figure; hold on; 
fig.Position=[0 0 500 500];
cdfplot(Corr_dHP_B12_qauntity);
cdfplot(Corr_iHP_B12_qauntity);   
xlim([-0.6 1]);
[p,~,stat]=ranksum(Corr_dHP_B12_qauntity, Corr_iHP_B12_qauntity);

%% Figure 6D
% Blocks 1 vs 3 
% % SS vs CR
Corr_dHP_B13=ClusterInfo.Outbound_dHP_SpaCorr_B13((PlaceField_dHP_B1 | PlaceField_dHP_B3) & Sunflower_dHP);
Corr_iHP_B13=ClusterInfo.Outbound_iHP_SpaCorr_B13((PlaceField_iHP_B1 | PlaceField_iHP_B3) & Sunflower_iHP);
fig=figure; hold on; 
fig.Position=[0 0 500 500];
cdfplot(Corr_dHP_B13);
cdfplot(Corr_iHP_B13);
xlim([-0.6 1])
% line([0.69 0.69], [0 1])
[p,~,stat]=ranksum(Corr_dHP_B13, Corr_iHP_B13);

% % 4/4 SS vs 1/4 SS
Corr_dHP_B13_qauntity=ClusterInfo.Outbound_dHP_SpaCorr_B13(PlaceField_dHP_B1 | PlaceField_dHP_B3 & Quantity_dHP);
Corr_iHP_B13_qauntity=ClusterInfo.Outbound_iHP_SpaCorr_B13(PlaceField_iHP_B1 | PlaceField_iHP_B3 & Quantity_iHP);
fig=figure; hold on; 
fig.Position=[0 0 500 500];
cdfplot(Corr_dHP_B13_qauntity);
cdfplot(Corr_iHP_B13_qauntity);   
% line([0.69 0.69], [0 1])
[p,~,stat]=ranksum(Corr_dHP_B13_qauntity, Corr_iHP_B13_qauntity);

%% Figure 6E and 6F
PeakRate=1;
% Dorsal, B1_Post
j=1; k=1;
for session=1:4
    Session.dHP=find(Indexing.dHP(session,:));
    for i=1:length(Session.dHP)
        iHP_B3_distance_High = PopulationMaximumBin.dHP_B1_Post(session,Session.dHP(i));
        ratio = FieldCoverageRatio.dHP(session,Session.dHP(i));
        [value] = max([iHP_B3_distance_High]);
        if value > PeakRate && ratio < 0.25
                    PopMatrix.dHP_B1_Post(j,:)=transpose(squeeze(PopulationLinearizedFiringRate.dHP_B1_Post(session,Session.dHP(i),:))/PopulationMaximumBin.dHP_B1_Post(session,Session.dHP(i)));
                    PopMatrix.MaximumBin_dHP_B1_Post(j,:)=MaximumBin.dHP_B1_Post(session,Session.dHP(i),:);
                    PopMatrix.dHP_B1_PostName{j,1}=CLSTname.dHP{session,Session.dHP(i)}; j=j+1;
        end    
    end
end

Temp=0;
for i=1:size(PopMatrix.dHP_B1_Post,1)
    temp=find(PopMatrix.dHP_B1_Post(i,:)==1);
    if ~isempty(temp)
        Temp(i)=temp(1);
    else
        Temp(i)=0;
    end
end
[Sorted.dHP_B1_Post,SortedIndexing.dHP_B1_Post]=sort(Temp);
PopMatrix.Sorted_dHP_B1_Post=PopMatrix.dHP_B1_Post(SortedIndexing.dHP_B1_Post,:);
PopMatrix.Sorted_dHP_B1_Post_Name=PopMatrix.dHP_B1_PostName(SortedIndexing.dHP_B1_Post,1);
PopMatrix.Sorted_dHP_B1_Post=PopMatrix.Sorted_dHP_B1_Post(4:end,:);
% figure, Dorsal
figure;
imagesc(PopMatrix.Sorted_dHP_B1_Post)
colormap('jet')
g=gca; g.CLim=[0 1];g.YDir='normal';

% Intermediate, B1_Post
j=1; k=1;
% clear PopMatrix Session
for session=1:4
    Session.iHP=find(Indexing.iHP(session,:));
    for i=1:length(Session.iHP)
        iHP_B3_distance_High = PopulationMaximumBin.iHP_B1_Post(session,Session.iHP(i));
        ratio = FieldCoverageRatio.iHP(session,Session.iHP(i));
        [value] = max([iHP_B3_distance_High]);
        if (Depth.iHP(session,Session.iHP(i)) >= 2 && Depth.iHP(session,Session.iHP(i)) < 8) && value > PeakRate && ratio < 0.25
            PopMatrix.iHP_B1_Post(j,:)=transpose(squeeze(PopulationLinearizedFiringRate.iHP_B1_Post(session,Session.iHP(i),:))/PopulationMaximumBin.iHP_B1_Post(session,Session.iHP(i)));
            PopMatrix.MaximumBin_iHP_B1_Post(j,:)=MaximumBin.iHP_B1_Post(session,Session.iHP(i),:);
            PopMatrix.iHP_B1_PostName{j,1}=CLSTname.iHP{session,Session.iHP(i)}; j=j+1;
        end
        
    end
end
Temp=0;
for i=1:size(PopMatrix.iHP_B1_Post,1)
    temp=find(PopMatrix.iHP_B1_Post(i,:)==1);
    if ~isempty(temp)
        Temp(i)=temp(1);
    else
        Temp(i)=0;
    end
end
[Sorted.iHP_B1_Post,SortedIndexing.iHP_B1_Post]=sort(Temp);
PopMatrix.Sorted_iHP_B1_Post=PopMatrix.iHP_B1_Post(SortedIndexing.iHP_B1_Post,:);
PopMatrix.Sorted_iHP_B1_Post_Name=PopMatrix.iHP_B1_PostName(SortedIndexing.iHP_B1_Post,1);
PopMatrix.Sorted_iHP_B1_Post=PopMatrix.Sorted_iHP_B1_Post(4:end,:);
% figure, Dorsal
figure;
imagesc(PopMatrix.Sorted_iHP_B1_Post)
colormap('jet')
g=gca; g.CLim=[0 1];g.YDir='normal';

% Dorsal, B3_Post
j=1; k=1;
for session=1:4
    Session.dHP=find(Indexing.dHP(session,:));
    for i=1:length(Session.dHP)
        iHP_B3_distance_High = PopulationMaximumBin.dHP_B3_Post(session,Session.dHP(i));
        ratio = FieldCoverageRatio.dHP(session,Session.dHP(i));
        [value] = max([iHP_B3_distance_High]);
        if value > PeakRate && ratio < 0.25         
                    PopMatrix.dHP_B3_Post(j,:)=transpose(squeeze(PopulationLinearizedFiringRate.dHP_B3_Post(session,Session.dHP(i),:))/PopulationMaximumBin.dHP_B3_Post(session,Session.dHP(i)));
                    PopMatrix.MaximumBin_dHP_B3_Post(j,:)=MaximumBin.dHP_B3_Post(session,Session.dHP(i),:);
                    PopMatrix.dHP_B3_PostName{j,1}=CLSTname.dHP{session,Session.dHP(i)}; j=j+1;
        end
        
    end
end

Temp=0;
for i=1:size(PopMatrix.dHP_B3_Post,1)
    temp=find(PopMatrix.dHP_B3_Post(i,:)==1);
    if ~isempty(temp)
        Temp(i)=temp(1);
    else
        Temp(i)=0;
    end
end
[Sorted.dHP_B3_Post,SortedIndexing.dHP_B3_Post]=sort(Temp);
PopMatrix.Sorted_dHP_B3_Post=PopMatrix.dHP_B3_Post(SortedIndexing.dHP_B3_Post,:);
PopMatrix.Sorted_dHP_B3_Post_Name=PopMatrix.dHP_B3_PostName(SortedIndexing.dHP_B3_Post,1);
PopMatrix.Sorted_dHP_B3_Post=PopMatrix.Sorted_dHP_B3_Post(5:end,:);
% figure
figure;
imagesc(GetSwap(PopMatrix.Sorted_dHP_B3_Post))
colormap('jet')
g=gca; g.CLim=[0 1];

% Intermediate, B3_Post
j=1; k=1;
% clear PopMatrix Session
for session=1:4
    Session.iHP=find(Indexing.iHP(session,:));
    for i=1:length(Session.iHP)
        iHP_B3_distance_High = PopulationMaximumBin.iHP_B3_Post(session,Session.iHP(i));
        ratio = FieldCoverageRatio.iHP(session,Session.iHP(i));
        [value] = max([iHP_B3_distance_High]);
        if (Depth.iHP(session,Session.iHP(i)) >= 2 && Depth.iHP(session,Session.iHP(i)) < 8) && value > PeakRate && ratio < 0.25
            PopMatrix.iHP_B3_Post(j,:)=transpose(squeeze(PopulationLinearizedFiringRate.iHP_B3_Post(session,Session.iHP(i),:))/PopulationMaximumBin.iHP_B3_Post(session,Session.iHP(i)));
            PopMatrix.MaximumBin_iHP_B3_Post(j,:)=MaximumBin.iHP_B3_Post(session,Session.iHP(i),:);
            PopMatrix.iHP_B3_PostName{j,1}=CLSTname.iHP{session,Session.iHP(i)}; j=j+1;
        end
        
    end
end
Temp=0;
for i=1:size(PopMatrix.iHP_B3_Post,1)
    temp=find(PopMatrix.iHP_B3_Post(i,:)==1);
    if ~isempty(temp)
        Temp(i)=temp(1);
    else
        Temp(i)=0;
    end
end
[Sorted.iHP_B3_Post,SortedIndexing.iHP_B3_Post]=sort(Temp);
PopMatrix.Sorted_iHP_B3_Post=PopMatrix.iHP_B3_Post(SortedIndexing.iHP_B3_Post,:);
PopMatrix.Sorted_iHP_B3_Post_Name=PopMatrix.iHP_B3_PostName(SortedIndexing.iHP_B3_Post,1);
PopMatrix.Sorted_iHP_B3_Post=PopMatrix.Sorted_iHP_B3_Post(6:end,:);
% figure, 
figure;
imagesc(GetSwap(PopMatrix.Sorted_iHP_B3_Post))
colormap('jet')
g=gca; g.CLim=[0 1];

%% Figure 6G
dHP_b1=[2 2 3 3 3 3 3 4 4 4 5 5 5 5 5 5 6 6 6 7 7 8 8 10 10 11 11 11 11 12 12 14 16 16 16 17 17 18 20 20 21 22 23 23 23 25 26 28 30 30 30 31 33 34 34 35 36 36 37 38 38 40 41 42 43 45 45 45 45 46 46 46 47 47 47 48 49 49 50 50 51 51 52 52 52 53 53 54 55 55 55 56 56 ]
iHP_b1=[1 2 2 3 3 3 3 3 3 3 4 4 4 4 4 4 4 4 4 4 4 4 4 5 5 5 5 6 6 6 6 7 7 7 7 8 8 8 8 10 11 11 11 11 11 11 11 12 12 15 15 15 16 17 17 18 18 21 23 23 24 26 33 33 33 34 36 37 38 38 38 39 40 40 40 41 41 42 43 43 44 45 46 46 47 47 47 48 49 49 49 49 49 49 49 50 50 51 51 51 52 52 52 52 52 53 53 53 53 53 53 54 54 54 55 55 56 56 56];
dHP_b3=[1 1 2 2 2 2 3 3 3 3 3 3 3 4 4 5 6 6 6 6 7 7 7 8 8 8 8 9 9 9 10 10 12 12 13 13 13 13 14 14 15 15 16 16 17 17 17 17  18 19 20 20 23 26 33 34 34 35 35 36 37 37 38 39 40 41 42 42 42 42 43 43 44 44 45 45 45 45 46 46 47 49 50 50 50 50 50 51 51 52 53 53 53 53 53 53 53 54 55 55 55 55 56 56];
iHP_b3=[2 2 2 3 3 3 3 3 3 3 3 3 3 3 3 3 3 4 4 4 4 4 4 4 4 4 4 4 4 5 5 5 5 6 6 6 7 7 7 7 7 8 8 9 10 10 11 11 11 11 11 12 12 12 12 13 13 13 13 13 14 14 15 15 16 22 22 27 30 31 31 32 32 33 35 35 35 36 36 36 37 38 38 39 39 40 41 41 41 42 42 43 44 44 44 44 44 45 46 46 47 47 47 47 47 47 47 47 47 50 50 50 50 51 51 51 52 52 52 52 52 52 53 53 53 53 53 55 55 55 55 56];
dHP_b3_rev=flip(57-dHP_b3)
iHP_b3_rev=flip(57-iHP_b3)

% % Histogram
dHP_B1=sum(PopMatrix.Sorted_dHP_B1_Post==1)/sum(sum(PopMatrix.Sorted_dHP_B1_Post==1))
dHP_B3=flip(sum(PopMatrix.Sorted_dHP_B3_Post==1)/sum(sum(PopMatrix.Sorted_dHP_B3_Post==1)))
iHP_B1=sum(PopMatrix.Sorted_iHP_B1_Post==1)/sum(sum(PopMatrix.Sorted_iHP_B1_Post==1))
iHP_B3=flip(sum(PopMatrix.Sorted_iHP_B3_Post==1)/sum(sum(PopMatrix.Sorted_iHP_B3_Post==1)))

% %
PopMatrix.Sorted_dHP_B1_Post = [PopMatrix.Sorted_dHP_B1_Post(:,1:25) PopMatrix.Sorted_dHP_B1_Post(:,32:end)]; % 1:47 / 53:end
PopMatrix.Sorted_iHP_B1_Post = [PopMatrix.Sorted_iHP_B1_Post(:,1:25) PopMatrix.Sorted_iHP_B1_Post(:,32:end)]; % 1:62
dHP_B1_high = PopMatrix.Sorted_dHP_B1_Post(1:46,1:25)
dHP_B1_low = PopMatrix.Sorted_dHP_B1_Post(53:end,26:50)
iHP_B1_high = PopMatrix.Sorted_iHP_B1_Post(1:61,1:25)
iHP_B1_low = PopMatrix.Sorted_iHP_B1_Post(63:end,26:50)

PopMatrix.Sorted_dHP_B3_Post = [PopMatrix.Sorted_dHP_B3_Post(:,1:25) PopMatrix.Sorted_dHP_B3_Post(:,32:end)]; % 1:47 / 53:end
PopMatrix.Sorted_iHP_B3_Post = [PopMatrix.Sorted_iHP_B3_Post(:,1:25) PopMatrix.Sorted_iHP_B3_Post(:,32:end)]; % 1:62
dHP_B3_high = PopMatrix.Sorted_dHP_B3_Post(1:53,1:25)
dHP_B3_low = PopMatrix.Sorted_dHP_B3_Post(55:end,26:50)
iHP_B3_high = PopMatrix.Sorted_iHP_B3_Post(1:67,1:25)
iHP_B3_low = PopMatrix.Sorted_iHP_B3_Post(69:end,26:50)



j=1;
for i=1:2:56
    dHP_B1_2(j)=dHP_B1(i)+dHP_B1(i+1); j=j+1;
end
j=1;
for i=1:2:56
    dHP_B3_2(j)=dHP_B3(i)+dHP_B3(i+1); j=j+1;
end
j=1;
for i=1:2:56
    iHP_B1_2(j)=iHP_B1(i)+iHP_B1(i+1); j=j+1;
end
j=1;
for i=1:2:56
    iHP_B3_2(j)=iHP_B3(i)+iHP_B3(i+1); j=j+1;
end
% dHP figure;
figure; hold on;
b1=bar(dHP_B1); b1.FaceColor='r'; b1.FaceAlpha = 0.3; b1.EdgeColor=[1 1 1]; b1.EdgeAlpha=0;
b2=bar(dHP_B3); b2.FaceColor='b'; b2.FaceAlpha = 0.3; b2.EdgeColor=[1 1 1]; b2.EdgeAlpha=0;
ylim([0 0.12]); g=gca; g.YTick=0:0.04:0.12;

% iHP figure;
figure; hold on;
b1=bar(iHP_B1); b1.FaceColor='r'; b1.FaceAlpha = 0.3; b1.EdgeColor=[1 1 1]; b1.EdgeAlpha=0;
b2=bar(iHP_B3); b2.FaceColor='b'; b2.FaceAlpha = 0.3; b2.EdgeColor=[1 1 1]; b2.EdgeAlpha=0;
ylim([0 0.12]); g=gca; g.YTick=0:0.04:0.12;

% Statistical testing
[h,p,stat]=kstest2(dHP_b3_rev, dHP_b1)
[h,p,stat]=kstest2(iHP_b3_rev, iHP_b1)

%% Figure 6H
zone=4;
for i=1:size(dHP_B1_high,1)
    for j=1:1:size(dHP_B1_high,2)
        if dHP_B1_high(i,j)==1
            dHP_B1_high_index(i)=j;
        end
    end
end
for i=1:size(dHP_B1_low,1)
    for j=1:1:size(dHP_B1_low,2)
        if dHP_B1_low(i,j)==1
            dHP_B1_low_index(i)=j;
        end
    end
end
prop.dHP_B1_high(zone)=length(find(dHP_B1_high_index<=zone))/length(dHP_B1_high_index);
prop.dHP_B1_low(zone)=length(find(dHP_B1_low_index>25-zone))/length(dHP_B1_low_index);

for i=1:size(dHP_B3_high,1)
    for j=1:1:size(dHP_B3_high,2)
        if dHP_B3_high(i,j)==1
            dHP_B3_high_index(i)=j;
        end
    end
end
for i=1:size(dHP_B3_low,1)
    for j=1:1:size(dHP_B3_low,2)
        if dHP_B3_low(i,j)==1
            dHP_B3_low_index(i)=j;
        end
    end
end
prop.dHP_B3_high(zone)=length(find(dHP_B3_high_index<=zone))/length(dHP_B3_high_index);
prop.dHP_B3_low(zone)=length(find(dHP_B3_low_index>25-zone))/length(dHP_B3_low_index);

for i=1:size(iHP_B1_high,1)
    for j=1:1:size(iHP_B1_high,2)
        if iHP_B1_high(i,j)==1
            iHP_B1_high_index(i)=j;
        end
    end
end
for i=1:size(iHP_B1_low,1)
    for j=1:1:size(iHP_B1_low,2)
        if iHP_B1_low(i,j)==1
            iHP_B1_low_index(i)=j;
        end
    end
end
prop.iHP_B1_high(zone)=length(find(iHP_B1_high_index<=zone))/length(iHP_B1_high_index);
prop.iHP_B1_low(zone)=length(find(iHP_B1_low_index>25-zone))/length(iHP_B1_low_index);

for i=1:size(iHP_B3_high,1)
    for j=1:1:size(iHP_B3_high,2)
        if iHP_B3_high(i,j)==1
            iHP_B3_high_index(i)=j;
        end
    end
end
for i=1:size(iHP_B3_low,1)
    for j=1:1:size(iHP_B3_low,2)
        if iHP_B3_low(i,j)==1
            iHP_B3_low_index(i)=j;
        end
    end
end
prop.iHP_B3_high(zone)=length(find(iHP_B3_high_index<=zone))/length(iHP_B3_high_index);
prop.iHP_B3_low(zone)=length(find(iHP_B3_low_index>25-zone))/length(iHP_B3_low_index);

% figure
zone=4;
figure; hold on;
plot(1:2, [prop.dHP_B1_low(zone) prop.dHP_B1_high(zone)],'ro-');
plot(1:2, [prop.iHP_B1_low(zone) prop.iHP_B1_high(zone)],'bo-');
plot(3:4, [prop.dHP_B3_low(zone) prop.dHP_B3_high(zone)],'ro-');
plot(3:4, [prop.iHP_B3_low(zone) prop.iHP_B3_high(zone)],'bo-');
ylim([0 0.5])
xlim([0.5 4.5])


%% Figure 6I
% % Field width
THRE=0.5;
dHP_B3_high_field=dHP_B3_high>THRE;
m=0;
for i=1:size(dHP_B3_high,1)
    for j=size(dHP_B3_high,2):-1:1
        if dHP_B3_high_field(i,j)==1
            m=m+1;
        end
    end
    dHP_B3_high_size(i)=m;
    m=0;
end
mean(dHP_B3_high_size)

dHP_B3_low_field=dHP_B3_low>THRE;
m=0;
for i=1:size(dHP_B3_low,1)
    for j=size(dHP_B3_low,2):-1:1
        if dHP_B3_low_field(i,j)==1
            m=m+1;
        end
    end
    dHP_B3_low_size(i)=m;
    m=0;
end
mean(dHP_B3_low_size)

iHP_B3_high_field=iHP_B3_high>THRE;
m=0;
for i=1:size(iHP_B3_high,1)
    for j=size(iHP_B3_high,2):-1:1
        if iHP_B3_high_field(i,j)==1
            m=m+1;
        end
    end
    iHP_B3_high_size(i)=m;
    m=0;
end
mean(iHP_B3_high_size)
[p1,p]=ranksum((iHP_B3_high_size), (dHP_B3_high_size))

iHP_B3_low_field=iHP_B3_low>THRE;
m=0;
for i=1:size(iHP_B3_low,1)
    for j=size(iHP_B3_low,2):-1:1
        if iHP_B3_low_field(i,j)==1
            m=m+1;
        end
    end
    iHP_B3_low_size(i)=m;
    m=0;
end
mean(iHP_B3_low_size)

% figure
figure; hold on;
Jin_MeanSTE_Line(6,dHP_B3_high_size)
Jin_MeanSTE_Line(7,dHP_B3_low_size)
Jin_MeanSTE_Line(8,iHP_B3_high_size)
Jin_MeanSTE_Line(9,iHP_B3_low_size)

% statistical testing
[h,p, ~, T]=ttest2(dHP_B3_high_size, dHP_B3_low_size)
[h,p, ~, T]=ttest2(iHP_B3_high_size, iHP_B3_low_size)
