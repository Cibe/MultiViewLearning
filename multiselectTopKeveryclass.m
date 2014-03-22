function [ sortedprobablityLabels indexes ] = multiselectTopKeveryclass(probablitys)
% Calculate the top probablitys in every class
k = 9;
[classprobablitymaxValues classIndex]=max(probablitys,[],2);
numClass=size(probablitys,2);
sortedprobablityLabels=[];
indexes=[];
 for i=1:numClass
   datapointsIndex = find(classIndex==i);
   if(sum(classIndex==i)~=0)
   [~, sorteddatapointsIndex]=sort(classprobablitymaxValues(datapointsIndex));
   if(size(datapointsIndex,1) >= k)
    sortedprobablityLabels=[sortedprobablityLabels;classIndex(datapointsIndex(sorteddatapointsIndex(1:k)))];    % get back the original index and get the class
    indexes = [indexes ; datapointsIndex(sorteddatapointsIndex(1:k))];
   else
    k = size(datapointsIndex,1);
    sortedprobablityLabels=[sortedprobablityLabels;classIndex(datapointsIndex(sorteddatapointsIndex(1:k)))];  
    indexes = [indexes;datapointsIndex(sorteddatapointsIndex(1:k))];
   end
   end
 end
end