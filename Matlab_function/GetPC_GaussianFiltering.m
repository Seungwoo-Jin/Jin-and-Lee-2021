function z = GetPC_GaussianFiltering(x, window, gaussFilter)

for i=1:(window-1)/2
    temp = x((1:i+(window-1)/2),:);
    z(i,:) = (temp'*gaussFilter((window+1)/2+1-i:window,i))';
end
for i=(window+1)/2:size(x,1)-(window-1)/2
    temp = x((i-(window-1)/2:i+(window-(window+1)/2)),:);
    z(i,:) = (temp'*gaussFilter(:,(window+1)/2))';
end
j=1;
for i=size(x,1)-(window-1)/2+1:size(x,1)
    temp=x((end-window+1+j:end),:);
    z(i,:) = (temp'*gaussFilter(1:window-j,(window+1)/2-j))'; j=j+1;
end