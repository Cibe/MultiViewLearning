function [ Accuracy ] = cotraining(numViews,views,trainingsetVector,labels)
% function implementing cotraining algorithm
sum(trainingsetVector)
testsetVector = ~trainingsetVector;
iteration = 0;
originalLabels = labels;
trainingSize = sum(trainingsetVector);
testsetSize = sum(testsetVector);
while(sum(testsetVector)~=0)
    iteration = iteration + 1;
    sum(trainingsetVector);
for i=1:numViews
    if iteration == 1
        [original(i).testData Oindices original(i).labels]=createdataset(views(i).viewdata,testsetVector,labels);
    end
   [trainingData trainingDataIndices trainingLabels]=createdataset(views(i).viewdata,trainingsetVector,labels);
   [testData testDataIndices testLabels]=createdataset(views(i).viewdata,testsetVector,labels);
   % views(i).model=LearnSVM(trainingData,trainingLabels);  % for svm
   % uncomment the line
   views(i).model=Learn(trainingData,trainingLabels)
   if(i==1)
       probablitys=ones(size(testData,1),max(labels));
     % probablitys=ones(size(testData,1),2); % for binary class
   end
   size(probablitys)
   size(labelprobablity(views(i).model,testData))
   % probablitys=probablitys.*labelprobablity(views(i).model,testData);
   probablitys = probablitys.*posterior(views(i).model,testData);
   % probablitys=probablitys.*labelprobablitySVM(views(i).model,testData,max(labels));
end
   %[newlabels SortedIds]=selectTopK(probablitys);
   [newlabels SortedIds]=multiselectTopKeveryclass(probablitys);      % selecting high probablity datapoints and labeling them
   %[newlabels SortedIds]=multiselectTopKeveryclass(probablitys);     % uncomment this line to select top K in every class
   testsetVector(testDataIndices(SortedIds))=0;
   labels(testDataIndices(SortedIds))=newlabels;
   trainingsetVector= ~testsetVector;
end
% sort the probablitys based on the classes 
Accuracy=(sum(originalLabels == labels)-trainingSize)/testsetSize;
end
