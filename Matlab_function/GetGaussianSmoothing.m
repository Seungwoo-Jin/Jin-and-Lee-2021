function Data_Smoothing = GetGaussianSmoothing(Data,Timewindow)
%% Smoothing processing
Data_Smoothing=zeros(1,size(Data,2));
gaussFilter = gausswin(Timewindow,2.5);
gaussFilter=gaussFilter';
gaussFilter = gaussFilter / sum(gaussFilter); % Normalize.

% % Data transformation for smoothing
if size(Data,2)==1 && size(Data,1) > 1
    Data=Data';
end

if size(Data,1) == 1 %% 1 * n matrix
    Data_Smoothing=conv(Data, gaussFilter);    
    %     Eliminate first and last bins contained unsufficient information.
    %     that created by smoothing process
    Data_Smoothing=Data_Smoothing((floor(Timewindow/2)+1):end-floor(Timewindow/2));
elseif size(Data,1) > 1 %% m * n matrix
    for i=1:size(Data,1)
        temp(i,:)=conv(Data(i,:), gaussFilter);    
        Data_Smoothing(i,:)=temp(i,(floor(Timewindow/2)+1):end-floor(Timewindow/2));
    end
end
