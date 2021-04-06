load('Figure3.mat');
%% Figure 3A
thre=min(SpatialCorrelation.SS.dHP_B12_Odd_Maintain(find(SpatialCorrelation.SS.dHP_B12_Odd_Maintain)));
% B12
stable.dHP_SS=length(find(SpatialCorrelation.SS.dHP_B12_Odd_Maintain > thre));
stable.dHP_SSCR=length(find(SpatialCorrelation.SSCR.dHP_B12_Odd_Maintain > thre));
stable.dHP_FLCR=length(find(SpatialCorrelation.FLCR.dHP_B12_Odd_Maintain > thre));
stable.dHP_SSFL=length(find(SpatialCorrelation.SSFL.dHP_B12_Odd_Maintain > thre));

stable_RM.dHP_SS=length(find(SpatialCorrelation.SS.dHP_B12_Odd_Maintain > thre & InFieldRMI.SS.dHP_B12_Odd_Maintain > 0.25));
stable_RM.dHP_SSCR=length(find(SpatialCorrelation.SSCR.dHP_B12_Odd_Maintain > thre & InFieldRMI.SSCR.dHP_B12_Odd_Maintain > 0.25));
stable_RM.dHP_SSCR_Day1=length(find(SpatialCorrelation.SSCR.dHP_B12_Odd_Maintain_Day1 > thre & InFieldRMI.SSCR.dHP_B12_Odd_Maintain_Day1 > 0.25));
stable_RM.dHP_SSCR_Day2=length(find(SpatialCorrelation.SSCR.dHP_B12_Odd_Maintain_Day2 > thre & InFieldRMI.SSCR.dHP_B12_Odd_Maintain_Day2 > 0.25));
stable_RM.dHP_FLCR=length(find(SpatialCorrelation.FLCR.dHP_B12_Odd_Maintain > thre & InFieldRMI.FLCR.dHP_B12_Odd_Maintain > 0.25));
stable_RM.dHP_FLCR_Day1=length(find(SpatialCorrelation.FLCR.dHP_B12_Odd_Maintain_Day1 > thre & InFieldRMI.FLCR.dHP_B12_Odd_Maintain_Day1 > 0.25));
stable_RM.dHP_FLCR_Day2=length(find(SpatialCorrelation.FLCR.dHP_B12_Odd_Maintain_Day2 > thre & InFieldRMI.FLCR.dHP_B12_Odd_Maintain_Day2 > 0.25));
stable_RM.dHP_SSFL=length(find(SpatialCorrelation.SSFL.dHP_B12_Odd_Maintain > thre & InFieldRMI.SSFL.dHP_B12_Odd_Maintain > 0.25));
stable_RM.dHP_SSFL_Day1=length(find(SpatialCorrelation.SSFL.dHP_B12_Odd_Maintain_Day1 > thre & InFieldRMI.SSFL.dHP_B12_Odd_Maintain_Day1 > 0.25));
stable_RM.dHP_SSFL_Day2=length(find(SpatialCorrelation.SSFL.dHP_B12_Odd_Maintain_Day2 > thre & InFieldRMI.SSFL.dHP_B12_Odd_Maintain_Day2 > 0.25));
stable_nRM.dHP_SS=length(find(SpatialCorrelation.SS.dHP_B12_Odd_Maintain > thre & InFieldRMI.SS.dHP_B12_Odd_Maintain <= 0.25));
stable_nRM.dHP_SSCR=length(find(SpatialCorrelation.SSCR.dHP_B12_Odd_Maintain > thre & InFieldRMI.SSCR.dHP_B12_Odd_Maintain <= 0.25));
stable_nRM.dHP_SSCR_Day1=length(find(SpatialCorrelation.SSCR.dHP_B12_Odd_Maintain_Day1 > thre & InFieldRMI.SSCR.dHP_B12_Odd_Maintain_Day1 <= 0.25));
stable_nRM.dHP_SSCR_Day2=length(find(SpatialCorrelation.SSCR.dHP_B12_Odd_Maintain_Day2 > thre & InFieldRMI.SSCR.dHP_B12_Odd_Maintain_Day2 <= 0.25));
stable_nRM.dHP_FLCR=length(find(SpatialCorrelation.FLCR.dHP_B12_Odd_Maintain > thre & InFieldRMI.FLCR.dHP_B12_Odd_Maintain <= 0.25));
stable_nRM.dHP_FLCR_Day1=length(find(SpatialCorrelation.FLCR.dHP_B12_Odd_Maintain_Day1 > thre & InFieldRMI.FLCR.dHP_B12_Odd_Maintain_Day1 <= 0.25));
stable_nRM.dHP_FLCR_Day2=length(find(SpatialCorrelation.FLCR.dHP_B12_Odd_Maintain_Day2 > thre & InFieldRMI.FLCR.dHP_B12_Odd_Maintain_Day2 <= 0.25));
stable_nRM.dHP_SSFL=length(find(SpatialCorrelation.SSFL.dHP_B12_Odd_Maintain > thre & InFieldRMI.SSFL.dHP_B12_Odd_Maintain <= 0.25));
stable_nRM.dHP_SSFL_Day1=length(find(SpatialCorrelation.SSFL.dHP_B12_Odd_Maintain_Day1 > thre & InFieldRMI.SSFL.dHP_B12_Odd_Maintain_Day1 <= 0.25));
stable_nRM.dHP_SSFL_Day2=length(find(SpatialCorrelation.SSFL.dHP_B12_Odd_Maintain_Day2 > thre & InFieldRMI.SSFL.dHP_B12_Odd_Maintain_Day2 <= 0.25));

shift.dHP_SS=length(find(SpatialCorrelation.SS.dHP_B12_Odd_Maintain < thre));
shift.dHP_SSCR=length(find(SpatialCorrelation.SSCR.dHP_B12_Odd_Maintain < thre));
shift.dHP_SSCR_Day1=length(find(SpatialCorrelation.SSCR.dHP_B12_Odd_Maintain_Day1 < thre));
shift.dHP_SSCR_Day2=length(find(SpatialCorrelation.SSCR.dHP_B12_Odd_Maintain_Day2 < thre));
shift.dHP_FLCR=length(find(SpatialCorrelation.FLCR.dHP_B12_Odd_Maintain < thre));
shift.dHP_FLCR_Day1=length(find(SpatialCorrelation.FLCR.dHP_B12_Odd_Maintain_Day1 < thre));
shift.dHP_FLCR_Day2=length(find(SpatialCorrelation.FLCR.dHP_B12_Odd_Maintain_Day2 < thre));
shift.dHP_SSFL=length(find(SpatialCorrelation.SSFL.dHP_B12_Odd_Maintain < thre));
shift.dHP_SSFL_Day1=length(find(SpatialCorrelation.SSFL.dHP_B12_Odd_Maintain_Day1 < thre));
shift.dHP_SSFL_Day2=length(find(SpatialCorrelation.SSFL.dHP_B12_Odd_Maintain_Day2 < thre));

on.dHP_SS=length(ClusterInfo.dHP_SpatialCorrelation_Odd_B12(LeftToRight_PlaceField_B12_dHP_Appear & SS_dHP));
on.dHP_SSCR=length(ClusterInfo.dHP_SpatialCorrelation_Odd_B12(LeftToRight_PlaceField_B12_dHP_Appear & SSCR_dHP));
on.dHP_SSCR_Day1=length(ClusterInfo.dHP_SpatialCorrelation_Odd_B12(LeftToRight_PlaceField_B12_dHP_Appear & SSCR1_dHP));
on.dHP_SSCR_Day2=length(ClusterInfo.dHP_SpatialCorrelation_Odd_B12(LeftToRight_PlaceField_B12_dHP_Appear & SSCR2_dHP));
on.dHP_FLCR=length(ClusterInfo.dHP_SpatialCorrelation_Odd_B12(LeftToRight_PlaceField_B12_dHP_Appear & FLCR_dHP));
on.dHP_FLCR_Day1=length(ClusterInfo.dHP_SpatialCorrelation_Odd_B12(LeftToRight_PlaceField_B12_dHP_Appear & FLCR1_dHP));
on.dHP_FLCR_Day2=length(ClusterInfo.dHP_SpatialCorrelation_Odd_B12(LeftToRight_PlaceField_B12_dHP_Appear & FLCR2_dHP));
on.dHP_SSFL=length(ClusterInfo.dHP_SpatialCorrelation_Odd_B12(LeftToRight_PlaceField_B12_dHP_Appear & SSFL_dHP));
on.dHP_SSFL_Day1=length(ClusterInfo.dHP_SpatialCorrelation_Odd_B12(LeftToRight_PlaceField_B12_dHP_Appear & SSFL1_dHP));
on.dHP_SSFL_Day2=length(ClusterInfo.dHP_SpatialCorrelation_Odd_B12(LeftToRight_PlaceField_B12_dHP_Appear & SSFL2_dHP));

off.dHP_SS=length(ClusterInfo.dHP_SpatialCorrelation_Odd_B12(LeftToRight_PlaceField_B12_dHP_Disappear & SS_dHP));
off.dHP_SSCR=length(ClusterInfo.dHP_SpatialCorrelation_Odd_B12(LeftToRight_PlaceField_B12_dHP_Disappear & SSCR_dHP));
off.dHP_SSCR_Day1=length(ClusterInfo.dHP_SpatialCorrelation_Odd_B12(LeftToRight_PlaceField_B12_dHP_Disappear & SSCR1_dHP));
off.dHP_SSCR_Day2=length(ClusterInfo.dHP_SpatialCorrelation_Odd_B12(LeftToRight_PlaceField_B12_dHP_Disappear & SSCR2_dHP));
off.dHP_FLCR=length(ClusterInfo.dHP_SpatialCorrelation_Odd_B12(LeftToRight_PlaceField_B12_dHP_Disappear & FLCR_dHP));
off.dHP_FLCR_Day1=length(ClusterInfo.dHP_SpatialCorrelation_Odd_B12(LeftToRight_PlaceField_B12_dHP_Disappear & FLCR1_dHP));
off.dHP_FLCR_Day2=length(ClusterInfo.dHP_SpatialCorrelation_Odd_B12(LeftToRight_PlaceField_B12_dHP_Disappear & FLCR2_dHP));
off.dHP_SSFL=length(ClusterInfo.dHP_SpatialCorrelation_Odd_B12(LeftToRight_PlaceField_B12_dHP_Disappear & SSFL_dHP));
off.dHP_SSFL_Day1=length(ClusterInfo.dHP_SpatialCorrelation_Odd_B12(LeftToRight_PlaceField_B12_dHP_Disappear & SSFL1_dHP));
off.dHP_SSFL_Day2=length(ClusterInfo.dHP_SpatialCorrelation_Odd_B12(LeftToRight_PlaceField_B12_dHP_Disappear & SSFL2_dHP));

% % 
stable.iHP_SS=length(find(SpatialCorrelation.SS.iHP_B12_Odd_Maintain > thre));
stable.iHP_SSCR=length(find(SpatialCorrelation.SSCR.iHP_B12_Odd_Maintain > thre));
stable.iHP_FLCR=length(find(SpatialCorrelation.FLCR.iHP_B12_Odd_Maintain > thre));
stable.iHP_SSFL=length(find(SpatialCorrelation.SSFL.iHP_B12_Odd_Maintain > thre));

stable_RM.iHP_SS=length(find(SpatialCorrelation.SS.iHP_B12_Odd_Maintain > thre & InFieldRMI.SS.iHP_B12_Odd_Maintain > 0.25));
stable_RM.iHP_SSCR=length(find(SpatialCorrelation.SSCR.iHP_B12_Odd_Maintain > thre & InFieldRMI.SSCR.iHP_B12_Odd_Maintain > 0.25));
stable_RM.iHP_FLCR=length(find(SpatialCorrelation.FLCR.iHP_B12_Odd_Maintain > thre & InFieldRMI.FLCR.iHP_B12_Odd_Maintain > 0.25));
stable_RM.iHP_SSFL=length(find(SpatialCorrelation.SSFL.iHP_B12_Odd_Maintain > thre & InFieldRMI.SSFL.iHP_B12_Odd_Maintain > 0.25));
stable_nRM.iHP_SS=length(find(SpatialCorrelation.SS.iHP_B12_Odd_Maintain > thre & InFieldRMI.SS.iHP_B12_Odd_Maintain <= 0.25));
stable_nRM.iHP_SSCR=length(find(SpatialCorrelation.SSCR.iHP_B12_Odd_Maintain > thre & InFieldRMI.SSCR.iHP_B12_Odd_Maintain <= 0.25));
stable_nRM.iHP_FLCR=length(find(SpatialCorrelation.FLCR.iHP_B12_Odd_Maintain > thre & InFieldRMI.FLCR.iHP_B12_Odd_Maintain <= 0.25));
stable_nRM.iHP_SSFL=length(find(SpatialCorrelation.SSFL.iHP_B12_Odd_Maintain > thre & InFieldRMI.SSFL.iHP_B12_Odd_Maintain <= 0.25));

shift.iHP_SS=length(find(SpatialCorrelation.SS.iHP_B12_Odd_Maintain < thre));
shift.iHP_SSCR=length(find(SpatialCorrelation.SSCR.iHP_B12_Odd_Maintain < thre));
shift.iHP_SSCR_Day1=length(find(SpatialCorrelation.SSCR.iHP_B12_Odd_Maintain_Day1 < thre));
shift.iHP_SSCR_Day2=length(find(SpatialCorrelation.SSCR.iHP_B12_Odd_Maintain_Day2 < thre));
shift.iHP_FLCR=length(find(SpatialCorrelation.FLCR.iHP_B12_Odd_Maintain < thre));
shift.iHP_SSFL=length(find(SpatialCorrelation.SSFL.iHP_B12_Odd_Maintain < thre));

on.iHP_SS=length(ClusterInfo.ivHP_SpatialCorrelation_Odd_B12(LeftToRight_PlaceField_B12_iHP_Appear & SS_ivHP));
on.iHP_SSCR=length(ClusterInfo.ivHP_SpatialCorrelation_Odd_B12(LeftToRight_PlaceField_B12_iHP_Appear & SSCR_ivHP));
on.iHP_FLCR=length(ClusterInfo.ivHP_SpatialCorrelation_Odd_B12(LeftToRight_PlaceField_B12_iHP_Appear & FLCR_ivHP));
on.iHP_SSFL=length(ClusterInfo.ivHP_SpatialCorrelation_Odd_B12(LeftToRight_PlaceField_B12_iHP_Appear & SSFL_ivHP));

off.iHP_SS=length(ClusterInfo.ivHP_SpatialCorrelation_Odd_B12(LeftToRight_PlaceField_B12_iHP_Disappear & SS_ivHP));
off.iHP_SSCR=length(ClusterInfo.ivHP_SpatialCorrelation_Odd_B12(LeftToRight_PlaceField_B12_iHP_Disappear & SSCR_ivHP));
off.iHP_FLCR=length(ClusterInfo.ivHP_SpatialCorrelation_Odd_B12(LeftToRight_PlaceField_B12_iHP_Disappear & FLCR_ivHP));
off.iHP_SSFL=length(ClusterInfo.ivHP_SpatialCorrelation_Odd_B12(LeftToRight_PlaceField_B12_iHP_Disappear & SSFL_ivHP));

[stable_nRM.dHP_SS stable_RM.dHP_SS shift.dHP_SS+on.dHP_SS+off.dHP_SS];
[stable_nRM.dHP_SSFL stable_RM.dHP_SSFL shift.dHP_SSFL+on.dHP_SSFL+off.dHP_SSFL];
[stable_nRM.dHP_SSCR+stable_nRM.dHP_FLCR stable_RM.dHP_SSCR+stable_RM.dHP_FLCR shift.dHP_SSCR+on.dHP_SSCR+off.dHP_SSCR+shift.dHP_FLCR+on.dHP_FLCR+off.dHP_FLCR];

[stable_nRM.iHP_SS stable_RM.iHP_SS shift.iHP_SS+on.iHP_SS+off.iHP_SS];
[stable_nRM.iHP_SSFL stable_RM.iHP_SSFL shift.iHP_SSFL+on.iHP_SSFL+off.iHP_SSFL];
[stable_nRM.iHP_SSCR+stable_nRM.iHP_FLCR stable_RM.iHP_SSCR+stable_RM.iHP_FLCR shift.iHP_SSCR+on.iHP_SSCR+off.iHP_SSCR+shift.iHP_FLCR+on.iHP_FLCR+off.iHP_FLCR];

figure
pie([stable_nRM.dHP_SS stable_RM.dHP_SS shift.dHP_SS+on.dHP_SS+off.dHP_SS])
figure
pie([stable_nRM.dHP_SSFL stable_RM.dHP_SSFL shift.dHP_SSFL+on.dHP_SSFL+off.dHP_SSFL])
figure
pie([stable_nRM.dHP_SSCR+stable_nRM.dHP_FLCR stable_RM.dHP_SSCR+stable_RM.dHP_FLCR shift.dHP_SSCR+on.dHP_SSCR+off.dHP_SSCR+shift.dHP_FLCR+on.dHP_FLCR+off.dHP_FLCR])

% % Statistical testing
[h,p,STAT]=chi2cont([stable_nRM.iHP_SS stable_RM.iHP_SS shift.iHP_SS+on.iHP_SS+off.iHP_SS...
    ; stable_nRM.iHP_SSFL stable_RM.iHP_SSFL shift.iHP_SSFL+on.iHP_SSFL+off.iHP_SSFL...
    ; stable_nRM.iHP_SSCR+stable_nRM.iHP_FLCR stable_RM.iHP_SSCR+stable_RM.iHP_FLCR shift.iHP_SSCR+on.iHP_SSCR+off.iHP_SSCR+shift.iHP_FLCR+on.iHP_FLCR+off.iHP_FLCR]); %
[h,p,STAT]=chi2cont([stable_nRM.iHP_SS stable_RM.iHP_SS shift.iHP_SS+on.iHP_SS+off.iHP_SS...
    ; stable_nRM.iHP_SSFL stable_RM.iHP_SSFL shift.iHP_SSFL+on.iHP_SSFL+off.iHP_SSFL]); %
[h,p,STAT]=chi2cont([stable_nRM.iHP_SS stable_RM.iHP_SS shift.iHP_SS+on.iHP_SS+off.iHP_SS...
    ; stable_nRM.iHP_SSCR+stable_nRM.iHP_FLCR stable_RM.iHP_SSCR+stable_RM.iHP_FLCR shift.iHP_SSCR+on.iHP_SSCR+off.iHP_SSCR+shift.iHP_FLCR+on.iHP_FLCR+off.iHP_FLCR]); %
[h,p,STAT]=chi2cont([stable_nRM.iHP_SSFL stable_RM.iHP_SSFL shift.iHP_SSFL+on.iHP_SSFL+off.iHP_SSFL...
    ; stable_nRM.iHP_SSCR+stable_nRM.iHP_FLCR stable_RM.iHP_SSCR+stable_RM.iHP_FLCR shift.iHP_SSCR+on.iHP_SSCR+off.iHP_SSCR+shift.iHP_FLCR+on.iHP_FLCR+off.iHP_FLCR]); %

[h,p,STAT]=chi2cont([stable_nRM.dHP_SS stable_RM.dHP_SS shift.dHP_SS+on.dHP_SS+off.dHP_SS...
    ; stable_nRM.dHP_SSFL stable_RM.dHP_SSFL shift.dHP_SSFL+on.dHP_SSFL+off.dHP_SSFL...
    ; stable_nRM.dHP_SSCR+stable_nRM.dHP_FLCR stable_RM.dHP_SSCR+stable_RM.dHP_FLCR shift.dHP_SSCR+on.dHP_SSCR+off.dHP_SSCR+shift.dHP_FLCR+on.dHP_FLCR+off.dHP_FLCR]); %
[h,p,STAT]=chi2cont([stable_nRM.dHP_SS stable_RM.dHP_SS shift.dHP_SS+on.dHP_SS+off.dHP_SS...
    ; stable_nRM.dHP_SSFL stable_RM.dHP_SSFL shift.dHP_SSFL+on.dHP_SSFL+off.dHP_SSFL]); %
[h,p,STAT]=chi2cont([stable_nRM.dHP_SS stable_RM.dHP_SS shift.dHP_SS+on.dHP_SS+off.dHP_SS...
    ; stable_nRM.dHP_SSCR+stable_nRM.dHP_FLCR stable_RM.dHP_SSCR+stable_RM.dHP_FLCR shift.dHP_SSCR+on.dHP_SSCR+off.dHP_SSCR+shift.dHP_FLCR+on.dHP_FLCR+off.dHP_FLCR]); %
[h,p,STAT]=chi2cont([stable_nRM.dHP_SSFL stable_RM.dHP_SSFL shift.dHP_SSFL+on.dHP_SSFL+off.dHP_SSFL...
    ; stable_nRM.dHP_SSCR+stable_nRM.dHP_FLCR stable_RM.dHP_SSCR+stable_RM.dHP_FLCR shift.dHP_SSCR+on.dHP_SSCR+off.dHP_SSCR+shift.dHP_FLCR+on.dHP_FLCR+off.dHP_FLCR]); %

%% Figure 3B
SpatialCorrelation.SS.dHP_B12_Odd=ClusterInfo.dHP_SpatialCorrelation_Odd_B12(LeftToRight_PlaceField_B12_dHP & SS_dHP);
SpatialCorrelation.SSCR.dHP_B12_Odd=ClusterInfo.dHP_SpatialCorrelation_Odd_B12(LeftToRight_PlaceField_B12_dHP & SSCR_dHP);
SpatialCorrelation.SSCR.dHP_B12_Odd_Day1=ClusterInfo.dHP_SpatialCorrelation_Odd_B12(LeftToRight_PlaceField_B12_dHP & SSCR1_dHP);
SpatialCorrelation.SSCR.dHP_B12_Odd_Day2=ClusterInfo.dHP_SpatialCorrelation_Odd_B12(LeftToRight_PlaceField_B12_dHP & SSCR2_dHP);
SpatialCorrelation.FLCR.dHP_B12_Odd=ClusterInfo.dHP_SpatialCorrelation_Odd_B12(LeftToRight_PlaceField_B12_dHP & FLCR_dHP);
SpatialCorrelation.FLCR.dHP_B12_Odd_Day1=ClusterInfo.dHP_SpatialCorrelation_Odd_B12(LeftToRight_PlaceField_B12_dHP & FLCR1_dHP);
SpatialCorrelation.FLCR.dHP_B12_Odd_Day2=ClusterInfo.dHP_SpatialCorrelation_Odd_B12(LeftToRight_PlaceField_B12_dHP & FLCR2_dHP);
SpatialCorrelation.SSFL.dHP_B12_Odd=ClusterInfo.dHP_SpatialCorrelation_Odd_B12(LeftToRight_PlaceField_B12_dHP & SSFL_dHP);
SpatialCorrelation.SSFL.dHP_B12_Odd_Day1=ClusterInfo.dHP_SpatialCorrelation_Odd_B12(LeftToRight_PlaceField_B12_dHP & SSFL1_dHP);
SpatialCorrelation.SSFL.dHP_B12_Odd_Day2=ClusterInfo.dHP_SpatialCorrelation_Odd_B12(LeftToRight_PlaceField_B12_dHP & SSFL2_dHP);
SpatialCorrelation.SS.iHP_B12_Odd=ClusterInfo.ivHP_SpatialCorrelation_Odd_B12(LeftToRight_PlaceField_B12_iHP & SS_ivHP);
SpatialCorrelation.SSCR.iHP_B12_Odd=ClusterInfo.ivHP_SpatialCorrelation_Odd_B12(LeftToRight_PlaceField_B12_iHP & SSCR_ivHP);
SpatialCorrelation.SSCR.iHP_B12_Odd_Day1=ClusterInfo.ivHP_SpatialCorrelation_Odd_B12(LeftToRight_PlaceField_B12_iHP & SSCR1_ivHP);
SpatialCorrelation.SSCR.iHP_B12_Odd_Day2=ClusterInfo.ivHP_SpatialCorrelation_Odd_B12(LeftToRight_PlaceField_B12_iHP & SSCR2_ivHP);
SpatialCorrelation.FLCR.iHP_B12_Odd=ClusterInfo.ivHP_SpatialCorrelation_Odd_B12(LeftToRight_PlaceField_B12_iHP & FLCR_ivHP);
SpatialCorrelation.FLCR.iHP_B12_Odd_Day1=ClusterInfo.ivHP_SpatialCorrelation_Odd_B12(LeftToRight_PlaceField_B12_iHP & FLCR1_ivHP);
SpatialCorrelation.FLCR.iHP_B12_Odd_Day2=ClusterInfo.ivHP_SpatialCorrelation_Odd_B12(LeftToRight_PlaceField_B12_iHP & FLCR2_ivHP);
SpatialCorrelation.SSFL.iHP_B12_Odd=ClusterInfo.ivHP_SpatialCorrelation_Odd_B12(LeftToRight_PlaceField_B12_iHP & SSFL_ivHP);
SpatialCorrelation.SSFL.iHP_B12_Odd_Day1=ClusterInfo.ivHP_SpatialCorrelation_Odd_B12(LeftToRight_PlaceField_B12_iHP & SSFL1_ivHP);
SpatialCorrelation.SSFL.iHP_B12_Odd_Day2=ClusterInfo.ivHP_SpatialCorrelation_Odd_B12(LeftToRight_PlaceField_B12_iHP & SSFL2_ivHP);

% % dHP, Mixed, SSvsCR + FLvsCR
fig=figure; hold on;
fig.Position=[0 0 800 800];
g=gca; 
cdfplot(SpatialCorrelation.SS.dHP_B12_Odd)
cdfplot([SpatialCorrelation.SSCR.dHP_B12_Odd; SpatialCorrelation.FLCR.dHP_B12_Odd])
cdfplot(SpatialCorrelation.SSFL.dHP_B12_Odd)

% % Statistical testing
data1=SpatialCorrelation.SS.dHP_B12_Odd;
data2=[SpatialCorrelation.SSCR.dHP_B12_Odd; SpatialCorrelation.FLCR.dHP_B12_Odd];
data3=SpatialCorrelation.SSFL.dHP_B12_Odd;
Y = [data1; data2; data3];
Session = [GetGroupingVar(data1,1); GetGroupingVar(data2,2); GetGroupingVar(data3,3)];
[Pvalue.dHP_kruskal_main_Odd, result, stats] = kruskalwallis(Y,Session,'off');
Pvalue.dHP_kruaskal_multcompare_Odd=multcompare(stats,'display','off');

% % dHP, Separately, SSvsCR, FLvsCR
fig=figure; hold on;
fig.Position=[0 0 800 800];
g=gca; 
cdfplot(SpatialCorrelation.SS.dHP_B12_Odd)
cdfplot(SpatialCorrelation.SSCR.dHP_B12_Odd)
cdfplot(SpatialCorrelation.FLCR.dHP_B12_Odd)
cdfplot(SpatialCorrelation.SSFL.dHP_B12_Odd)

% % Statistical testing
data1=SpatialCorrelation.SS.dHP_B12_Odd;
data2=SpatialCorrelation.SSCR.dHP_B12_Odd; 
data3=SpatialCorrelation.FLCR.dHP_B12_Odd;
data4=SpatialCorrelation.SSFL.dHP_B12_Odd;
Y = [data1; data2; data3; data4];
Session = [GetGroupingVar(data1,1); GetGroupingVar(data2,2); GetGroupingVar(data3,3); GetGroupingVar(data4,4)];
[Pvalue.dHP_kruskal_main_Odd, result, stats] = kruskalwallis(Y,Session,'off');
Pvalue.dHP_kruaskal_multcompare_Odd=multcompare(stats,'display','off');

% % iHP, Mixed, SSvsCR + FLvsCR
fig=figure; hold on;
fig.Position=[0 0 800 800];
g=gca; 
cdfplot(SpatialCorrelation.SS.iHP_B12_Odd)
cdfplot([SpatialCorrelation.SSCR.iHP_B12_Odd; SpatialCorrelation.FLCR.iHP_B12_Odd])
cdfplot(SpatialCorrelation.SSFL.iHP_B12_Odd)

% % Statistical testing
data1=SpatialCorrelation.SS.iHP_B12_Odd;
data2=[SpatialCorrelation.SSCR.iHP_B12_Odd; SpatialCorrelation.FLCR.iHP_B12_Odd];
data3=SpatialCorrelation.SSFL.iHP_B12_Odd;
Y = [data1; data2; data3];
Session = [GetGroupingVar(data1,1); GetGroupingVar(data2,2); GetGroupingVar(data3,3)];
[Pvalue.iHP_kruskal_main_Odd, result, stats] = kruskalwallis(Y,Session,'off');
Pvalue.iHP_kruaskal_multcompare_Odd=multcompare(stats,'display','off');

% % iHP, Separately, SSvsCR, FLvsCR
fig=figure; hold on;
fig.Position=[0 0 800 800];
g=gca; 
cdfplot(SpatialCorrelation.SS.iHP_B12_Odd)
cdfplot(SpatialCorrelation.SSCR.iHP_B12_Odd)
cdfplot(SpatialCorrelation.FLCR.iHP_B12_Odd)
cdfplot(SpatialCorrelation.SSFL.iHP_B12_Odd)

% % Statistical testing
data1=SpatialCorrelation.SS.iHP_B12_Odd;
data2=SpatialCorrelation.SSCR.iHP_B12_Odd; 
data3=SpatialCorrelation.FLCR.iHP_B12_Odd;
data4=SpatialCorrelation.SSFL.iHP_B12_Odd;
Y = [data1; data2; data3; data4];
Session = [GetGroupingVar(data1,1); GetGroupingVar(data2,2); GetGroupingVar(data3,3); GetGroupingVar(data4,4)];
[Pvalue.iHP_kruskal_main_Odd, result, stats] = kruskalwallis(Y,Session,'off');
Pvalue.iHP_kruaskal_multcompare_Odd=multcompare(stats,'display','off');

%% Figure 3D-3E
% % Examples of population matrix (dHP, SS-SS)
fig=figure;
fig.Position=[0 0 1000 500];
subplot(1,3,1)
data1=[PopMatrix_SS.dHP_LeftToRight_B1_Maintain_Norm_sorted(:,1:end)];
imagesc(data1)
colormap('jet')
g=gca; g.CLim=[0 1];g.YDir='normal';
subplot(1,3,2)
data2=[PopMatrix_SS.dHP_LeftToRight_B2_Maintain_Norm_sorted(:,1:end)];
imagesc(data2)
colormap('jet')
g=gca; g.CLim=[0 1];g.YDir='normal';
subplot(1,3,3)
data3=[PopMatrix_SS.dHP_LeftToRight_B3_Maintain_Norm_sorted(:,1:end)];
imagesc(data3)
colormap('jet')
g=gca; g.CLim=[0 1];g.YDir='normal';

% % Correlation between population matrix
data1=PopMatrix_SS.dHP_LeftToRight_B1_Maintain_Norm_sorted;
data2=PopMatrix_SS.dHP_LeftToRight_B2_Maintain_Norm_sorted;
[Data1, Data2] = GetPopulationCorrelation(data1, data2);
correl=corrcoef(Data1,Data2);
PopCorr.SS_B12_dHP_LeftToRight = correl(1,2);
data1=PopMatrix_SSCR.dHP_LeftToRight_B1_Maintain_Norm_sorted;
data2=PopMatrix_SSCR.dHP_LeftToRight_B2_Maintain_Norm_sorted;
[Data1, Data2] = GetPopulationCorrelation(data1, data2);
correl=corrcoef(Data1,Data2);
PopCorr.SSCR_B12_dHP_LeftToRight = correl(1,2);
data1=PopMatrix_FLCR.dHP_LeftToRight_B1_Maintain_Norm_sorted;
data2=PopMatrix_FLCR.dHP_LeftToRight_B2_Maintain_Norm_sorted;
[Data1, Data2] = GetPopulationCorrelation(data1, data2);
correl=corrcoef(Data1,Data2);
PopCorr.FLCR_B12_dHP_LeftToRight = correl(1,2);
data1=PopMatrix_SSFL.dHP_LeftToRight_B1_Maintain_Norm_sorted;
data2=PopMatrix_SSFL.dHP_LeftToRight_B2_Maintain_Norm_sorted;
[Data1, Data2] = GetPopulationCorrelation(data1, data2);
correl=corrcoef(Data1,Data2);
PopCorr.SSFL_B12_dHP_LeftToRight = correl(1,2);
data1=PopMatrix_SS.iHP_LeftToRight_B1_Maintain_Norm_sorted;
data2=PopMatrix_SS.iHP_LeftToRight_B2_Maintain_Norm_sorted;
[Data1, Data2] = GetPopulationCorrelation(data1, data2);
correl=corrcoef(Data1,Data2);
PopCorr.SS_B12_iHP_LeftToRight = correl(1,2);
data1=PopMatrix_SSCR.iHP_LeftToRight_B1_Maintain_Norm_sorted;
data2=PopMatrix_SSCR.iHP_LeftToRight_B2_Maintain_Norm_sorted;
[Data1, Data2] = GetPopulationCorrelation(data1, data2);
correl=corrcoef(Data1,Data2);
PopCorr.SSCR_B12_iHP_LeftToRight = correl(1,2);
data1=PopMatrix_FLCR.iHP_LeftToRight_B1_Maintain_Norm_sorted;
data2=PopMatrix_FLCR.iHP_LeftToRight_B2_Maintain_Norm_sorted;
[Data1, Data2] = GetPopulationCorrelation(data1, data2);
correl=corrcoef(Data1,Data2);
PopCorr.FLCR_B12_iHP_LeftToRight = correl(1,2);
data1=PopMatrix_SSFL.iHP_LeftToRight_B1_Maintain_Norm_sorted;
data2=PopMatrix_SSFL.iHP_LeftToRight_B2_Maintain_Norm_sorted;
[Data1, Data2] = GetPopulationCorrelation(data1, data2);
correl=corrcoef(Data1,Data2);
PopCorr.SSFL_B12_iHP_LeftToRight = correl(1,2);

data1=PopMatrix_SS.dHP_RightToLeft_B1_Maintain_Norm_sorted;
data2=PopMatrix_SS.dHP_RightToLeft_B2_Maintain_Norm_sorted;
[Data1, Data2] = GetPopulationCorrelation(data1, data2);
correl=corrcoef(Data1,Data2);
PopCorr.SS_B12_dHP_RightToLeft = correl(1,2);
data1=PopMatrix_SSCR.dHP_RightToLeft_B1_Maintain_Norm_sorted;
data2=PopMatrix_SSCR.dHP_RightToLeft_B2_Maintain_Norm_sorted;
[Data1, Data2] = GetPopulationCorrelation(data1, data2);
correl=corrcoef(Data1,Data2);
PopCorr.SSCR_B12_dHP_RightToLeft = correl(1,2);
data1=PopMatrix_FLCR.dHP_RightToLeft_B1_Maintain_Norm_sorted;
data2=PopMatrix_FLCR.dHP_RightToLeft_B2_Maintain_Norm_sorted;
[Data1, Data2] = GetPopulationCorrelation(data1, data2);
correl=corrcoef(Data1,Data2);
PopCorr.FLCR_B12_dHP_RightToLeft = correl(1,2);
data1=PopMatrix_SSFL.dHP_RightToLeft_B1_Maintain_Norm_sorted;
data2=PopMatrix_SSFL.dHP_RightToLeft_B2_Maintain_Norm_sorted;
[Data1, Data2] = GetPopulationCorrelation(data1, data2);
correl=corrcoef(Data1,Data2);
PopCorr.SSFL_B12_dHP_RightToLeft = correl(1,2);
data1=PopMatrix_SS.iHP_RightToLeft_B1_Maintain_Norm_sorted;
data2=PopMatrix_SS.iHP_RightToLeft_B2_Maintain_Norm_sorted;
[Data1, Data2] = GetPopulationCorrelation(data1, data2);
correl=corrcoef(Data1,Data2);
PopCorr.SS_B12_iHP_RightToLeft = correl(1,2);
data1=PopMatrix_SSCR.iHP_RightToLeft_B1_Maintain_Norm_sorted;
data2=PopMatrix_SSCR.iHP_RightToLeft_B2_Maintain_Norm_sorted;
[Data1, Data2] = GetPopulationCorrelation(data1, data2);
correl=corrcoef(Data1,Data2);
PopCorr.SSCR_B12_iHP_RightToLeft = correl(1,2);
data1=PopMatrix_FLCR.iHP_RightToLeft_B1_Maintain_Norm_sorted;
data2=PopMatrix_FLCR.iHP_RightToLeft_B2_Maintain_Norm_sorted;
[Data1, Data2] = GetPopulationCorrelation(data1, data2);
correl=corrcoef(Data1,Data2);
PopCorr.FLCR_B12_iHP_RightToLeft = correl(1,2);
data1=PopMatrix_SSFL.iHP_RightToLeft_B1_Maintain_Norm_sorted;
data2=PopMatrix_SSFL.iHP_RightToLeft_B2_Maintain_Norm_sorted;
[Data1, Data2] = GetPopulationCorrelation(data1, data2);
correl=corrcoef(Data1,Data2);
PopCorr.SSFL_B12_iHP_RightToLeft = correl(1,2);

dHP_B12_LeftToRight=[PopCorr.SS_B12_dHP_LeftToRight-PopCorr.SS_B12_dHP_LeftToRight PopCorr.SSCR_B12_dHP_LeftToRight-PopCorr.SS_B12_dHP_LeftToRight ...
    PopCorr.FLCR_B12_dHP_LeftToRight-PopCorr.SS_B12_dHP_LeftToRight PopCorr.SSFL_B12_dHP_LeftToRight-PopCorr.SS_B12_dHP_LeftToRight];

iHP_B12_LeftToRight=[PopCorr.SS_B12_iHP_LeftToRight-PopCorr.SS_B12_iHP_LeftToRight PopCorr.SSCR_B12_iHP_LeftToRight-PopCorr.SS_B12_iHP_LeftToRight ...
    PopCorr.FLCR_B12_iHP_LeftToRight-PopCorr.SS_B12_iHP_LeftToRight PopCorr.SSFL_B12_iHP_LeftToRight-PopCorr.SS_B12_iHP_LeftToRight];

dHP_B12_RightToLeft=[PopCorr.SS_B12_dHP_RightToLeft-PopCorr.SS_B12_dHP_RightToLeft PopCorr.SSCR_B12_dHP_RightToLeft-PopCorr.SS_B12_dHP_RightToLeft ...
    PopCorr.FLCR_B12_dHP_RightToLeft-PopCorr.SS_B12_dHP_RightToLeft PopCorr.SSFL_B12_dHP_RightToLeft-PopCorr.SS_B12_dHP_RightToLeft];

iHP_B12_RightToLeft=[PopCorr.SS_B12_iHP_RightToLeft-PopCorr.SS_B12_iHP_RightToLeft PopCorr.SSCR_B12_iHP_RightToLeft-PopCorr.SS_B12_iHP_RightToLeft ...
    PopCorr.FLCR_B12_iHP_RightToLeft-PopCorr.SS_B12_iHP_RightToLeft PopCorr.SSFL_B12_iHP_RightToLeft-PopCorr.SS_B12_iHP_RightToLeft];

% % Figure 3E
figure; hold on;
plot(dHP_B12_LeftToRight,'r.-');
plot(iHP_B12_LeftToRight,'b.-');
plot(dHP_B12_RightToLeft,'r.:');
plot(iHP_B12_RightToLeft,'b.:');
ylim([-0.12 0]);

%% Figure 3E, Mean correlation of each session vs. Velocity
VelocityDiff_448_day2_SSCH=VelocityRatio.SSCH_B12(21,1);
VelocityDiff_448_day3_SSCH=VelocityRatio.SSCH_B12(21,2);
VelocityDiff_459_day2_SSCH=VelocityRatio.SSCH_B12(21,3);
VelocityDiff_459_day3_SSCH=VelocityRatio.SSCH_B12(21,4);
VelocityDiff_463_day2_SSCH=VelocityRatio.SSCH_B12(21,5);
VelocityDiff_463_day3_SSCH=VelocityRatio.SSCH_B12(21,6);
VelocityDiff_473_day2_SSCH=VelocityRatio.SSCH_B12(21,7);
VelocityDiff_473_day3_SSCH=VelocityRatio.SSCH_B12(21,8);
VelocityDiff_488_day2_SSCH=VelocityRatio.SSCH_B12(21,9);
VelocityDiff_488_day3_SSCH=VelocityRatio.SSCH_B12(21,10);
VelocityDiff_509_day2_SSCH=VelocityRatio.SSCH_B12(21,11);
VelocityDiff_509_day3_SSCH=VelocityRatio.SSCH_B12(21,12);
VelocityDiff_448_day2_FRCH=VelocityRatio.FRCH_B12(21,1);
VelocityDiff_448_day3_FRCH=VelocityRatio.FRCH_B12(21,2);
VelocityDiff_459_day2_FRCH=VelocityRatio.FRCH_B12(21,3);
VelocityDiff_459_day3_FRCH=VelocityRatio.FRCH_B12(21,4);
VelocityDiff_463_day2_FRCH=VelocityRatio.FRCH_B12(21,5);
VelocityDiff_463_day3_FRCH=VelocityRatio.FRCH_B12(21,6);
VelocityDiff_473_day2_FRCH=VelocityRatio.FRCH_B12(21,7);
VelocityDiff_473_day3_FRCH=VelocityRatio.FRCH_B12(21,8);
VelocityDiff_488_day2_FRCH=VelocityRatio.FRCH_B12(21,9);
VelocityDiff_488_day3_FRCH=VelocityRatio.FRCH_B12(21,10);
VelocityDiff_509_day2_FRCH=VelocityRatio.FRCH_B12(21,11);
VelocityDiff_509_day3_FRCH=VelocityRatio.FRCH_B12(21,12);
VelocityDiff_448_day2_SSFR=VelocityRatio.SSFR_B12(21,1);
VelocityDiff_448_day3_SSFR=VelocityRatio.SSFR_B12(21,2);
VelocityDiff_459_day2_SSFR=VelocityRatio.SSFR_B12(21,3);
VelocityDiff_459_day3_SSFR=VelocityRatio.SSFR_B12(21,4);
VelocityDiff_463_day2_SSFR=VelocityRatio.SSFR_B12(21,5);
VelocityDiff_463_day3_SSFR=VelocityRatio.SSFR_B12(21,6);
VelocityDiff_473_day2_SSFR=VelocityRatio.SSFR_B12(21,7);
VelocityDiff_473_day3_SSFR=VelocityRatio.SSFR_B12(21,8);
VelocityDiff_488_day2_SSFR=VelocityRatio.SSFR_B12(21,9);
VelocityDiff_488_day3_SSFR=VelocityRatio.SSFR_B12(21,10);
VelocityDiff_509_day2_SSFR=VelocityRatio.SSFR_B12(21,11);
VelocityDiff_509_day3_SSFR=VelocityRatio.SSFR_B12(21,12);

MeanCorr_iHP_448_day2_SSCH=Correlation.SSCH_iHP_B12_Maintain(1,1);
MeanCorr_iHP_448_day3_SSCH=Correlation.SSCH_iHP_B12_Maintain(2,1);
MeanCorr_iHP_459_day2_SSCH=Correlation.SSCH_iHP_B12_Maintain(3,1);
MeanCorr_iHP_459_day3_SSCH=Correlation.SSCH_iHP_B12_Maintain(4,1);
MeanCorr_iHP_463_day2_SSCH=Correlation.SSCH_iHP_B12_Maintain(5,1);
MeanCorr_iHP_463_day3_SSCH=Correlation.SSCH_iHP_B12_Maintain(6,1);
MeanCorr_iHP_473_day2_SSCH=Correlation.SSCH_iHP_B12_Maintain(7,1);
MeanCorr_iHP_473_day3_SSCH=Correlation.SSCH_iHP_B12_Maintain(8,1);
MeanCorr_iHP_488_day2_SSCH=Correlation.SSCH_iHP_B12_Maintain(9,1);
MeanCorr_iHP_488_day3_SSCH=Correlation.SSCH_iHP_B12_Maintain(10,1);
MeanCorr_iHP_509_day2_SSCH=Correlation.SSCH_iHP_B12_Maintain(11,1);
MeanCorr_iHP_509_day3_SSCH=Correlation.SSCH_iHP_B12_Maintain(12,1);
MeanCorr_iHP_448_day2_FRCH=Correlation.FRCH_iHP_B12_Maintain(1,1);
MeanCorr_iHP_448_day3_FRCH=Correlation.FRCH_iHP_B12_Maintain(2,1);
MeanCorr_iHP_459_day2_FRCH=Correlation.FRCH_iHP_B12_Maintain(3,1);
MeanCorr_iHP_459_day3_FRCH=Correlation.FRCH_iHP_B12_Maintain(4,1);
MeanCorr_iHP_463_day2_FRCH=Correlation.FRCH_iHP_B12_Maintain(5,1);
MeanCorr_iHP_463_day3_FRCH=Correlation.FRCH_iHP_B12_Maintain(6,1);
MeanCorr_iHP_473_day2_FRCH=Correlation.FRCH_iHP_B12_Maintain(7,1);
MeanCorr_iHP_473_day3_FRCH=Correlation.FRCH_iHP_B12_Maintain(8,1);
MeanCorr_iHP_488_day2_FRCH=Correlation.FRCH_iHP_B12_Maintain(9,1);
MeanCorr_iHP_488_day3_FRCH=Correlation.FRCH_iHP_B12_Maintain(10,1);
MeanCorr_iHP_509_day2_FRCH=Correlation.FRCH_iHP_B12_Maintain(11,1);
MeanCorr_iHP_509_day3_FRCH=Correlation.FRCH_iHP_B12_Maintain(12,1);
MeanCorr_iHP_448_day2_SSFR=Correlation.SSFR_iHP_B12_Maintain(1,1);
MeanCorr_iHP_448_day3_SSFR=Correlation.SSFR_iHP_B12_Maintain(2,1);
MeanCorr_iHP_459_day2_SSFR=Correlation.SSFR_iHP_B12_Maintain(3,1);
MeanCorr_iHP_459_day3_SSFR=Correlation.SSFR_iHP_B12_Maintain(4,1);
MeanCorr_iHP_463_day2_SSFR=Correlation.SSFR_iHP_B12_Maintain(5,1);
MeanCorr_iHP_463_day3_SSFR=Correlation.SSFR_iHP_B12_Maintain(6,1);
MeanCorr_iHP_473_day2_SSFR=Correlation.SSFR_iHP_B12_Maintain(7,1);
MeanCorr_iHP_473_day3_SSFR=Correlation.SSFR_iHP_B12_Maintain(8,1);
MeanCorr_iHP_488_day2_SSFR=Correlation.SSFR_iHP_B12_Maintain(9,1);
MeanCorr_iHP_488_day3_SSFR=Correlation.SSFR_iHP_B12_Maintain(10,1);
MeanCorr_iHP_509_day2_SSFR=Correlation.SSFR_iHP_B12_Maintain(11,1);
MeanCorr_iHP_509_day3_SSFR=Correlation.SSFR_iHP_B12_Maintain(12,1);

MeanCorr_dHP_448_day2_SSCH=Correlation.SSCH_dHP_B12_Maintain(1,1);
MeanCorr_dHP_448_day3_SSCH=Correlation.SSCH_dHP_B12_Maintain(2,1);
MeanCorr_dHP_459_day2_SSCH=Correlation.SSCH_dHP_B12_Maintain(3,1);
MeanCorr_dHP_459_day3_SSCH=Correlation.SSCH_dHP_B12_Maintain(4,1);
MeanCorr_dHP_463_day2_SSCH=Correlation.SSCH_dHP_B12_Maintain(5,1);
MeanCorr_dHP_463_day3_SSCH=Correlation.SSCH_dHP_B12_Maintain(6,1);
MeanCorr_dHP_473_day2_SSCH=Correlation.SSCH_dHP_B12_Maintain(7,1);
MeanCorr_dHP_473_day3_SSCH=Correlation.SSCH_dHP_B12_Maintain(8,1);
MeanCorr_dHP_488_day2_SSCH=Correlation.SSCH_dHP_B12_Maintain(9,1);
MeanCorr_dHP_488_day3_SSCH=Correlation.SSCH_dHP_B12_Maintain(10,1);
MeanCorr_dHP_509_day2_SSCH=Correlation.SSCH_dHP_B12_Maintain(11,1);
MeanCorr_dHP_509_day3_SSCH=Correlation.SSCH_dHP_B12_Maintain(12,1);
MeanCorr_dHP_448_day2_FRCH=Correlation.FRCH_dHP_B12_Maintain(1,1);
MeanCorr_dHP_448_day3_FRCH=Correlation.FRCH_dHP_B12_Maintain(2,1);
MeanCorr_dHP_459_day2_FRCH=Correlation.FRCH_dHP_B12_Maintain(3,1);
MeanCorr_dHP_459_day3_FRCH=Correlation.FRCH_dHP_B12_Maintain(4,1);
MeanCorr_dHP_463_day2_FRCH=Correlation.FRCH_dHP_B12_Maintain(5,1);
MeanCorr_dHP_463_day3_FRCH=Correlation.FRCH_dHP_B12_Maintain(6,1);
MeanCorr_dHP_473_day2_FRCH=Correlation.FRCH_dHP_B12_Maintain(7,1);
MeanCorr_dHP_473_day3_FRCH=Correlation.FRCH_dHP_B12_Maintain(8,1);
MeanCorr_dHP_488_day2_FRCH=Correlation.FRCH_dHP_B12_Maintain(9,1);
MeanCorr_dHP_488_day3_FRCH=Correlation.FRCH_dHP_B12_Maintain(10,1);
MeanCorr_dHP_509_day2_FRCH=Correlation.FRCH_dHP_B12_Maintain(11,1);
MeanCorr_dHP_509_day3_FRCH=Correlation.FRCH_dHP_B12_Maintain(12,1);
MeanCorr_dHP_448_day2_SSFR=Correlation.SSFR_dHP_B12_Maintain(1,1);
MeanCorr_dHP_448_day3_SSFR=Correlation.SSFR_dHP_B12_Maintain(2,1);
MeanCorr_dHP_459_day2_SSFR=Correlation.SSFR_dHP_B12_Maintain(3,1);
MeanCorr_dHP_459_day3_SSFR=Correlation.SSFR_dHP_B12_Maintain(4,1);
MeanCorr_dHP_463_day2_SSFR=Correlation.SSFR_dHP_B12_Maintain(5,1);
MeanCorr_dHP_463_day3_SSFR=Correlation.SSFR_dHP_B12_Maintain(6,1);
MeanCorr_dHP_473_day2_SSFR=Correlation.SSFR_dHP_B12_Maintain(7,1);
MeanCorr_dHP_473_day3_SSFR=Correlation.SSFR_dHP_B12_Maintain(8,1);
MeanCorr_dHP_488_day2_SSFR=Correlation.SSFR_dHP_B12_Maintain(9,1);
MeanCorr_dHP_488_day3_SSFR=Correlation.SSFR_dHP_B12_Maintain(10,1);
MeanCorr_dHP_509_day2_SSFR=Correlation.SSFR_dHP_B12_Maintain(11,1);
MeanCorr_dHP_509_day3_SSFR=Correlation.SSFR_dHP_B12_Maintain(12,1);

% iHP
dataX = [VelocityDiff_448_day2_SSCH VelocityDiff_448_day3_SSCH VelocityDiff_459_day2_SSCH VelocityDiff_459_day3_SSCH VelocityDiff_463_day2_SSCH VelocityDiff_463_day3_SSCH VelocityDiff_473_day2_SSCH VelocityDiff_473_day3_SSCH VelocityDiff_488_day2_SSCH VelocityDiff_488_day3_SSCH VelocityDiff_509_day2_SSCH VelocityDiff_509_day3_SSCH...
    VelocityDiff_448_day2_FRCH VelocityDiff_448_day3_FRCH VelocityDiff_459_day2_FRCH VelocityDiff_459_day3_FRCH VelocityDiff_463_day2_FRCH VelocityDiff_463_day3_FRCH VelocityDiff_473_day2_FRCH VelocityDiff_473_day3_FRCH VelocityDiff_488_day2_FRCH VelocityDiff_488_day3_FRCH VelocityDiff_509_day2_FRCH VelocityDiff_509_day3_FRCH...
    VelocityDiff_448_day2_SSFR VelocityDiff_448_day3_SSFR VelocityDiff_459_day2_SSFR VelocityDiff_459_day3_SSFR VelocityDiff_463_day2_SSFR VelocityDiff_463_day3_SSFR VelocityDiff_473_day2_SSFR VelocityDiff_473_day3_SSFR VelocityDiff_488_day2_SSFR VelocityDiff_488_day3_SSFR VelocityDiff_509_day2_SSFR VelocityDiff_509_day3_SSFR];

dataY = [MeanCorr_iHP_448_day2_SSCH MeanCorr_iHP_448_day3_SSCH MeanCorr_iHP_459_day2_SSCH MeanCorr_iHP_459_day3_SSCH MeanCorr_iHP_463_day2_SSCH MeanCorr_iHP_463_day3_SSCH MeanCorr_iHP_473_day2_SSCH MeanCorr_iHP_473_day3_SSCH MeanCorr_iHP_488_day2_SSCH MeanCorr_iHP_488_day3_SSCH MeanCorr_iHP_509_day2_SSCH MeanCorr_iHP_509_day3_SSCH...
    MeanCorr_iHP_448_day2_FRCH MeanCorr_iHP_448_day3_FRCH MeanCorr_iHP_459_day2_FRCH MeanCorr_iHP_459_day3_FRCH MeanCorr_iHP_463_day2_FRCH MeanCorr_iHP_463_day3_FRCH MeanCorr_iHP_473_day2_FRCH MeanCorr_iHP_473_day3_FRCH MeanCorr_iHP_488_day2_FRCH MeanCorr_iHP_488_day3_FRCH MeanCorr_iHP_509_day2_FRCH MeanCorr_iHP_509_day3_FRCH...
    MeanCorr_iHP_448_day2_SSFR MeanCorr_iHP_448_day3_SSFR MeanCorr_iHP_459_day2_SSFR MeanCorr_iHP_459_day3_SSFR MeanCorr_iHP_463_day2_SSFR MeanCorr_iHP_463_day3_SSFR MeanCorr_iHP_473_day2_SSFR MeanCorr_iHP_473_day3_SSFR MeanCorr_iHP_488_day2_SSFR MeanCorr_iHP_488_day3_SSFR MeanCorr_iHP_509_day2_SSFR MeanCorr_iHP_509_day3_SSFR];

% Robust regression
figure; g=gca; hold on;
plot(dataX,dataY,'.')
[Regression, f]=GetLinearRegression(dataX,dataY,g);
x=-0.2:0.01:0.7;
y=Regression.a1 * x + Regression.a0;

y=dataY';
x=dataX';
x=x(~isnan(y));
y=y(~isnan(y));
[b_ls,~,~,~,stats_linreg] = regress(y,[ones(size(x)) x]);
[b_rob, stats_rob] = robustfit(x,y);
rquare_linreg = stats_linreg(1);
clear corr
rsquare_robustfit = corr(y,b_rob(1)+b_rob(2)*x)^2;
sse = stats_rob.dfe * stats_rob.robust_s^2;
phat = b_rob(1) + b_rob(2)*x;
ssr = norm(phat-mean(phat))^2;
possible_rsquare_robustfit = 1 - sse / (sse + ssr);
x=-0.2:0.01:0.7;
y=b_rob(2) * x + b_rob(1);
stats_rob.p
plot(x,y,'r');

% 
% dHP
dataX = [VelocityDiff_448_day2_SSCH VelocityDiff_448_day3_SSCH VelocityDiff_459_day2_SSCH VelocityDiff_459_day3_SSCH VelocityDiff_463_day2_SSCH VelocityDiff_463_day3_SSCH VelocityDiff_473_day2_SSCH VelocityDiff_473_day3_SSCH VelocityDiff_488_day2_SSCH VelocityDiff_488_day3_SSCH VelocityDiff_509_day2_SSCH VelocityDiff_509_day3_SSCH...
    VelocityDiff_448_day2_FRCH VelocityDiff_448_day3_FRCH VelocityDiff_459_day2_FRCH VelocityDiff_459_day3_FRCH VelocityDiff_463_day2_FRCH VelocityDiff_463_day3_FRCH VelocityDiff_473_day2_FRCH VelocityDiff_473_day3_FRCH VelocityDiff_488_day2_FRCH VelocityDiff_488_day3_FRCH VelocityDiff_509_day2_FRCH VelocityDiff_509_day3_FRCH...
    VelocityDiff_448_day2_SSFR VelocityDiff_448_day3_SSFR VelocityDiff_459_day2_SSFR VelocityDiff_459_day3_SSFR VelocityDiff_463_day2_SSFR VelocityDiff_463_day3_SSFR VelocityDiff_473_day2_SSFR VelocityDiff_473_day3_SSFR VelocityDiff_488_day2_SSFR VelocityDiff_488_day3_SSFR VelocityDiff_509_day2_SSFR VelocityDiff_509_day3_SSFR];

dataY = [MeanCorr_dHP_448_day2_SSCH MeanCorr_dHP_448_day3_SSCH MeanCorr_dHP_459_day2_SSCH MeanCorr_dHP_459_day3_SSCH MeanCorr_dHP_463_day2_SSCH MeanCorr_dHP_463_day3_SSCH MeanCorr_dHP_473_day2_SSCH MeanCorr_dHP_473_day3_SSCH MeanCorr_dHP_488_day2_SSCH MeanCorr_dHP_488_day3_SSCH MeanCorr_dHP_509_day2_SSCH MeanCorr_dHP_509_day3_SSCH...
    MeanCorr_dHP_448_day2_FRCH MeanCorr_dHP_448_day3_FRCH MeanCorr_dHP_459_day2_FRCH MeanCorr_dHP_459_day3_FRCH MeanCorr_dHP_463_day2_FRCH MeanCorr_dHP_463_day3_FRCH MeanCorr_dHP_473_day2_FRCH MeanCorr_dHP_473_day3_FRCH MeanCorr_dHP_488_day2_FRCH MeanCorr_dHP_488_day3_FRCH MeanCorr_dHP_509_day2_FRCH MeanCorr_dHP_509_day3_FRCH...
    MeanCorr_dHP_448_day2_SSFR MeanCorr_dHP_448_day3_SSFR MeanCorr_dHP_459_day2_SSFR MeanCorr_dHP_459_day3_SSFR MeanCorr_dHP_463_day2_SSFR MeanCorr_dHP_463_day3_SSFR MeanCorr_dHP_473_day2_SSFR MeanCorr_dHP_473_day3_SSFR MeanCorr_dHP_488_day2_SSFR MeanCorr_dHP_488_day3_SSFR MeanCorr_dHP_509_day2_SSFR MeanCorr_dHP_509_day3_SSFR];

% Robust regression
figure; g=gca; hold on;
plot(dataX,dataY,'.')
[Regression, f]=GetLinearRegression(dataX,dataY,g);
x=-0.2:0.01:0.7;
y=Regression.a1 * x + Regression.a0;

y=dataY';
x=dataX';
x=x(~isnan(y));
y=y(~isnan(y));
[b_ls,~,~,~,stats_linreg] = regress(y,[ones(size(x)) x]);
[b_rob, stats_rob] = robustfit(x,y);
rquare_linreg = stats_linreg(1);
clear corr
rsquare_robustfit = corr(y,b_rob(1)+b_rob(2)*x)^2;
sse = stats_rob.dfe * stats_rob.robust_s^2;
phat = b_rob(1) + b_rob(2)*x;
ssr = norm(phat-mean(phat))^2;
possible_rsquare_robustfit = 1 - sse / (sse + ssr);
x=-0.2:0.01:0.7;
y=b_rob(2) * x + b_rob(1);
plot(x,y,'r');
% 