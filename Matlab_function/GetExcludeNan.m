function data = GetExcludeNan(y)
k=1;
for i=1:length(y)
    if ~isnan(y(i))
        data(k)=y(i);
        k=k+1;
    end
end
