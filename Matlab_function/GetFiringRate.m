function AvgFiringRate = GetFiringRate(SkaggsRateMap)
AvgFiringRate=nansum(nansum(SkaggsRateMap))/length(find(~isnan(SkaggsRateMap)==1));

