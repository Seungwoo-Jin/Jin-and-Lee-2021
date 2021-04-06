function Data = GetGroupingVar(data,varargin)
if nargin == 1
    for i=1:length(data)
        Data(i,1)=i;
    end
elseif nargin == 2
    if ischar(varargin{1})
        for i=1:length(data)
            Data{i,1} = varargin{1};
        end
    else
        n=varargin{1};
        Data = n*ones(length(data),1);
    end
end