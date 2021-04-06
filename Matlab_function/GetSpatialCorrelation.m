function SpaCorr12 = GetSpatialCorrelation(SkaggsRatemap1, SkaggasRatemap2)

SkaggsRatemap1_1D=0;
SkaggasRatemap2_1D=0;

for i=1:size(SkaggsRatemap1,1)
    for j=1:size(SkaggsRatemap1,2)
        SkaggsRatemap1_1D(end+1)=SkaggsRatemap1(i,j);
        SkaggasRatemap2_1D(end+1)=SkaggasRatemap2(i,j);
    end
end
SkaggsRatemap1_1D=SkaggsRatemap1_1D(2:end);
SkaggasRatemap2_1D=SkaggasRatemap2_1D(2:end);

SkaggsRatemap1_1D_ne=0;
SkaggasRatemap2_1D_ne=0;

for i=1:length(SkaggsRatemap1_1D)
    if ~isnan(SkaggsRatemap1_1D(i)) && ~isnan(SkaggasRatemap2_1D(i))
        SkaggsRatemap1_1D_ne(end+1)=SkaggsRatemap1_1D(i);
        SkaggasRatemap2_1D_ne(end+1)=SkaggasRatemap2_1D(i);
    end
end
SkaggsRatemap1_1D_ne=SkaggsRatemap1_1D_ne(2:end);
SkaggasRatemap2_1D_ne=SkaggasRatemap2_1D_ne(2:end);
SpaCorr12=corr2(SkaggsRatemap1_1D_ne,SkaggasRatemap2_1D_ne);



% SkaggsRatemap1_1D=0;
% SkaggasRatemap2_1D=0;
% 
% for i=1:48
%     for j=1:72
%         SkaggsRatemap1_1D(end+1)=SkaggsRatemap1(i,j);
%         SkaggasRatemap2_1D(end+1)=SkaggasRatemap2(i,j);
%     end
% end
% SkaggsRatemap1_1D=SkaggsRatemap1_1D(2:end);
% SkaggasRatemap2_1D=SkaggasRatemap2_1D(2:end);
% 
% SkaggsRatemap1_1D_ne=0;
% SkaggasRatemap2_1D_ne=0;
% 
% for i=1:length(SkaggsRatemap1_1D)
%     if ~isnan(SkaggsRatemap1_1D(i)) && ~isnan(SkaggasRatemap2_1D(i))
%         SkaggsRatemap1_1D_ne(end+1)=SkaggsRatemap1_1D(i);
%         SkaggasRatemap2_1D_ne(end+1)=SkaggasRatemap2_1D(i);
%     end
% end
% SkaggsRatemap1_1D_ne=SkaggsRatemap1_1D_ne(2:end);
% SkaggasRatemap2_1D_ne=SkaggasRatemap2_1D_ne(2:end);
% SpaCorr12=corr2(SkaggsRatemap1_1D_ne,SkaggasRatemap2_1D_ne);
% 


