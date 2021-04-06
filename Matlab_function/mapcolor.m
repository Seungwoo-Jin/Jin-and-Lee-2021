function c=mapcolor(i,flag)
% flag : 1 
  c = distinguishable_colors(i);
  if flag==1
      fig=figure;
      fig.Position=[0 0 2300 1000];
      image(reshape(c,[10 size(c,1)/10 3]));
      
%       EPS file save    
%         filename_ai=['E:\EphysAnalysis\Result\ColorMap.eps'];
%         print( gcf, '-painters', '-r300', filename_ai, '-depsc');
% 
        SaveRoot=['E:\EphysAnalysis\Result'];
        FileName=['ColorMap.png'];
        SaveFigure(gcf,SaveRoot, FileName);


  end
end