function [Mean, STD, STE] = Jin_MeanSTE_Line(x,y,varargin)
y = GetExcludeNan(y);

% markersize=25;
markersize=5;
linewidth=1;
% Example)
% Width=0.3;
% Color.color=53; Color.alpha=0.4;
% h = JMeanSTE_Line(1,a.data1,Width,Color)

if nargin == 2
    Width = 0.25;
    Color.color=4; Color.alpha=1;
end

if nargin == 3
    Color = varargin{1};
    Width =  0.25;
end

if nargin == 4
    Width = varargin{1};
    Color = varargin{2};
end


c=mapcolor(100,0);
Mean=nanmean(y);
STD=nanstd(y);
STE=nanstd(y)/sqrt(length(y));

x1=x-Width;
x2=x+Width;
y1=0;
y2=Mean;

% p1=plot(x,Mean,'.'); p1.MarkerSize=markersize; p1.Color=c(Color.color,:);
% Std
if Mean >= 0
    l1=line([x x],[(Mean-STE) (Mean+STE)],'LineWidth',1,'LineStyle','-'); l1.Color=c(Color.color,:); l1.LineWidth=linewidth;
    l1=line([(x-Width/3) (x+Width/3)],[(Mean+STE) (Mean+STE)],'LineWidth',1,'LineStyle','-'); l1.Color=c(Color.color,:); l1.LineWidth=linewidth;
    l1=line([(x-Width/3) (x+Width/3)],[(Mean-STE) (Mean-STE)],'LineWidth',1,'LineStyle','-'); l1.Color=c(Color.color,:); l1.LineWidth=linewidth;
elseif Mean < 0
    l1=line([x x],[Mean+STE (Mean-STE)],'LineWidth',1,'LineStyle','-'); l1.Color=c(Color.color,:);
    l1=line([(x-Width/3) (x+Width/3)],[(Mean+STE) (Mean+STE)],'LineWidth',1,'LineStyle','-'); l1.Color=c(Color.color,:); l1.LineWidth=linewidth;
    l1=line([(x-Width/3) (x+Width/3)],[(Mean-STE) (Mean-STE)],'LineWidth',1,'LineStyle','-'); l1.Color=c(Color.color,:);
end

g=gca;
g.YColor=[0 0 0];
g.XColor=[0 0 0];
g.ZColor=[0 0 0];
g.LineWidth=0.6;
