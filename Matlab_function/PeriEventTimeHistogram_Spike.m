function [PETHspike]=PeriEventTimeHistogram_Spike(TrialNumber, thisCLST, Time, RasterInfo)
    rowSpike=length(thisCLST.Timestamp);

    PETHspike.Choice=zeros(TrialNumber.Trial,1);
    for j=1:TrialNumber.Trial
        h=1;
        for i=1:rowSpike
            if(thisCLST.Timestamp(i)>=Time.Choice(j,1)-RasterInfo.Left)&&(thisCLST.Timestamp(i)<Time.Choice(j,1)+RasterInfo.Right)
                PETHspike.Choice(j,h)=thisCLST.Timestamp(i);   
                PETHspike.Choice_tagging(i)=1; % 180402 tagging spikes in the raster plot.
                h=h+1;
            end
        end
    end

    %%
    [Row_Spk_First,Col_Spk_First]=size(PETHspike.Choice);
    for j=1:Row_Spk_First
        for i=1:Col_Spk_First
            if (PETHspike.Choice(j,i)==0)
                PETHspike.Choice(j,i)=NaN;
            end
        end
    end
    for j=1:Row_Spk_First
        for i=1:Col_Spk_First
            PETHspike.Choice(j,i)=PETHspike.Choice(j,i)-Time.Choice(j,1);
        end
    end
    
    PETHspike.Return=zeros(TrialNumber.Trial,1);
    for j=1:TrialNumber.Trial
        h=1;
        for i=1:rowSpike
            if(thisCLST.Timestamp(i)>=Time.ReturnEntry(j,1)-RasterInfo.Left)&&(thisCLST.Timestamp(i)<Time.ReturnEntry(j,1)+RasterInfo.Right)
                PETHspike.Return(j,h)=thisCLST.Timestamp(i);   
                PETHspike.Return_tagging(i)=1; % 180402 tagging spikes in the raster plot.
                h=h+1;
            end
        end
    end

    %%
    [Row_Spk_First,Col_Spk_First]=size(PETHspike.Return);
    for j=1:Row_Spk_First
        for i=1:Col_Spk_First
            if (PETHspike.Return(j,i)==0)
                PETHspike.Return(j,i)=NaN;
            end
        end
    end
    for j=1:Row_Spk_First
        for i=1:Col_Spk_First
            PETHspike.Return(j,i)=PETHspike.Return(j,i)-Time.ReturnEntry(j,1);
        end
    end
    
end


% Block 1 ~ 4
% for i = 1:Row_Spk_First  
%     if i <= TrialNumber.Odd(1)
%         for j=1:Col_Spk_First
%             if ~isnan(Alt_Raster_Spk_FirstRoute_10(i,j)) && Alt_Raster_Spk_FirstRoute_10(i,j)>-RasterInfo.RasterLeft*RasterResolution && Alt_Raster_Spk_FirstRoute_10(i,j)<RasterRight*RasterResolution
%                 if Alt_Raster_Spk_FirstRoute_10(i,j)<0
%                     Raster_First_Binning(1,(RasterInfo.RasterLeft*RasterResolution-fix(Alt_Raster_Spk_FirstRoute_10(i,j))*(-1)))=Raster_First_Binning(1,RasterInfo.RasterLeft*RasterResolution-(fix(Alt_Raster_Spk_FirstRoute_10(i,j))*(-1)))+1;
%                 elseif Alt_Raster_Spk_FirstRoute_10(i,j)>=0
%                     Raster_First_Binning(1,((RasterInfo.RasterLeft*RasterResolution+1)+fix(Alt_Raster_Spk_FirstRoute_10(i,j))))=Raster_First_Binning(1,(RasterInfo.RasterLeft*RasterResolution+1)+(fix(Alt_Raster_Spk_FirstRoute_10(i,j))))+1;
%                 end
%             end
%         end
%     elseif ~sum(i==RewardOmissionSecond)&& i>block(2)/2 && i<=block(3)/2
%         for j=1:Col_Spk_First
%             if ~isnan(Alt_Raster_Spk_FirstRoute_10(i,j)) && Alt_Raster_Spk_FirstRoute_10(i,j)>-RasterInfo.RasterLeft*RasterResolution && Alt_Raster_Spk_FirstRoute_10(i,j)<RasterRight*RasterResolution
%                 if Alt_Raster_Spk_FirstRoute_10(i,j)<0
%                     Raster_First_Binning(2,(RasterInfo.RasterLeft*RasterResolution-fix(Alt_Raster_Spk_FirstRoute_10(i,j))*(-1)))=Raster_First_Binning(2,RasterInfo.RasterLeft*RasterResolution-(fix(Alt_Raster_Spk_FirstRoute_10(i,j))*(-1)))+1;
%                 elseif Alt_Raster_Spk_FirstRoute_10(i,j)>=0
%                     Raster_First_Binning(2,((RasterInfo.RasterLeft*RasterResolution+1)+fix(Alt_Raster_Spk_FirstRoute_10(i,j))))=Raster_First_Binning(2,(RasterInfo.RasterLeft*RasterResolution+1)+(fix(Alt_Raster_Spk_FirstRoute_10(i,j))))+1;
%                 end
%             end
%         end 
%     elseif ~sum(i==RewardOmissionSecond)&& i>block(3)/2 && i<=block(4)/2
%         for j=1:Col_Spk_First
%             if ~isnan(Alt_Raster_Spk_FirstRoute_10(i,j)) && Alt_Raster_Spk_FirstRoute_10(i,j)>-RasterInfo.RasterLeft*RasterResolution && Alt_Raster_Spk_FirstRoute_10(i,j)<RasterRight*RasterResolution
%                 if Alt_Raster_Spk_FirstRoute_10(i,j)<0
%                     Raster_First_Binning(3,(RasterInfo.RasterLeft*RasterResolution-fix(Alt_Raster_Spk_FirstRoute_10(i,j))*(-1)))=Raster_First_Binning(3,RasterInfo.RasterLeft*RasterResolution-(fix(Alt_Raster_Spk_FirstRoute_10(i,j))*(-1)))+1;
%                 elseif Alt_Raster_Spk_FirstRoute_10(i,j)>=0
%                     Raster_First_Binning(3,((RasterInfo.RasterLeft*RasterResolution+1)+fix(Alt_Raster_Spk_FirstRoute_10(i,j))))=Raster_First_Binning(3,(RasterInfo.RasterLeft*RasterResolution+1)+(fix(Alt_Raster_Spk_FirstRoute_10(i,j))))+1;
%                 end
%             end
%         end 
%     elseif ~sum(i==RewardOmissionSecond)&& i>block(4)/2 && i<=block(5)/2
%         for j=1:Col_Spk_First
%             if ~isnan(Alt_Raster_Spk_FirstRoute_10(i,j)) && Alt_Raster_Spk_FirstRoute_10(i,j)>-RasterInfo.RasterLeft*RasterResolution && Alt_Raster_Spk_FirstRoute_10(i,j)<RasterRight*RasterResolution
%                 if Alt_Raster_Spk_FirstRoute_10(i,j)<0
%                     Raster_First_Binning(4,(RasterInfo.RasterLeft*RasterResolution-fix(Alt_Raster_Spk_FirstRoute_10(i,j))*(-1)))=Raster_First_Binning(4,RasterInfo.RasterLeft*RasterResolution-(fix(Alt_Raster_Spk_FirstRoute_10(i,j))*(-1)))+1;
%                 elseif Alt_Raster_Spk_FirstRoute_10(i,j)>=0
%                     Raster_First_Binning(4,((RasterInfo.RasterLeft*RasterResolution+1)+fix(Alt_Raster_Spk_FirstRoute_10(i,j))))=Raster_First_Binning(4,(RasterInfo.RasterLeft*RasterResolution+1)+(fix(Alt_Raster_Spk_FirstRoute_10(i,j))))+1;
%                 end
%             end
%         end 
%     end

