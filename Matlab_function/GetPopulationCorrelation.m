function [Data1, Data2] = GetPopulationCorrelation(data1, data2)
k=1;
for i=1:size(data1,1)
    if ~(sum(double(isnan(data1(i,:)))) || sum(double(isnan(data2(i,:)))))
        Data1(k,:)=data1(i,:);
        Data2(k,:)=data2(i,:);
        k=k+1;
    end
end

