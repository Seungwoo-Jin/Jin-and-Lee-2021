function [Pvalue, result, gnames] = Stat_ANOVA2(Y,GROUP,NAME) 
        
% Example 1
% a=[1;2;3;4;5]
% b=[2;2;3;4;4]
% c=[1;3;3;2;2]
% d=[2;3;4;4;1]
% A=[1;2;3;4;5]
% B=[2;2;3;4;4]
% C=[1;3;3;2;2]
% D=[2;3;4;4;1]
% Y = [a; b; c; d;...
%      A; B; C; D];
% Species = [GetGroupingVar(a,1); GetGroupingVar(b,1); GetGroupingVar(c,1); GetGroupingVar(d,1); ...
%     GetGroupingVar(A,2); GetGroupingVar(B,2); GetGroupingVar(C,2); GetGroupingVar(D,2)];
% Block = [GetGroupingVar(a,1); GetGroupingVar(b,2); GetGroupingVar(c,3); GetGroupingVar(d,4); ...
%     GetGroupingVar(A,1); GetGroupingVar(B,2); GetGroupingVar(C,3); GetGroupingVar(D,4)];
% NAME = {'Species', 'Block'};
% [Pvalue, result, gnames] = Stat_ANOVA2(Y,[Species Block],NAME)

% Example 2
% Y = [dHP_Odd; dHP_Even; iHP_Odd; iHP_Even];
% Region = [GetGroupingVar(dHP_Odd,1); GetGroupingVar(dHP_Even,1); ...
%     GetGroupingVar(iHP_Odd,2); GetGroupingVar(iHP_Even,2)];
% Trajectory = [GetGroupingVar(dHP_Odd,1); GetGroupingVar(dHP_Even,2);...
%     GetGroupingVar(iHP_Odd,1); GetGroupingVar(iHP_Even,2)];
% NAME = {'Region', 'Trajectory'};
% [Pvalue, result, gnames] = Stat_ANOVA2(Y,[Region Trajectory],NAME)


[Pvalue.Main_TwoWay,result,stats] = anovan(Y,GROUP,'model','interaction','varnames',NAME,'display','off');
[Pvalue.MultipleComparison, ~, ~, gnames] = multcompare(stats,'Dimension',[1,2],'display','off');
end
