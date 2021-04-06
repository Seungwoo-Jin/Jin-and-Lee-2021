function [Pvalue, result, gnames] = Stat_ANOVA1(Y,GROUP) 
    [Pvalue.Main_OneWay,result,stats] = anova1(Y,GROUP,'off');
    [Pvalue.MultipleComparison_OneWay,~,~,gnames] = multcompare(stats, 'display', 'off');
end

