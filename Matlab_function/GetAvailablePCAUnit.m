% function Data=GetAvailablePCAUnit(Data1, Data2)
% FR_Thre=0.25; 
% k=1; Data=zeros(size(Data1,1),1);
% for clstindex=1:size(Data1,2)
%     if mean(Data2(:,clstindex)) > FR_Thre% && ~(length(find(Data2(:,clstindex)==0)) == 30)
%         Data(:,k)=Data1(:,clstindex); k=k+1;
%        
%     end
% end

function [Data, Data_Name] = GetAvailablePCAUnit(Data2, FR_Thre,Name)
% FR_Thre=0.5; 
k=1; Data=zeros(size(Data2,1),1);
for clstindex=1:size(Data2,2)
    if nanmean(Data2(:,clstindex)) > FR_Thre && (length(find(Data2(:,clstindex)==0)) <= size(Data2,1)*0.5)
        Data(:,k)=Data2(:,clstindex); 
        Data_Name(k,1)=Name(clstindex); k=k+1;
    end
end