function WeightedEUdist=GetWeightedEuclideanDistance(x,y,z)
SumOfSquare=0;
for j=1:length(x)
    SumOfSquare=SumOfSquare+z(j)*0.01*(x(j)-y(j))^2;
end
WeightedEUdist=sqrt(SumOfSquare);
