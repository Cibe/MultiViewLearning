function [ sortedprobablityLabels indexes ] = multiselectTopK( probablitys )
% Calculate the top probablitys in every class
k = 100;
if(size(probablitys,1) < k)
    k=size(probablitys,1);
end
[maxValues index]=max(probablitys,[],2);
[~, sortedIndices]=sort(maxValues);
sortedprobablityLabels=index(sortedIndices(1:k));
indexes = sortedIndices(1:k);
end