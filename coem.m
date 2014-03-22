function [ accuracy] = CoEM(numViews,views,trainingsetVector,labels)
testsetVector = ~trainingsetVector;
trainingSize = sum(trainingsetVector);
testsetSize = sum(testsetVector);
iteration = 1 ;
while 1
for i=1:numViews
   [trainingData trainingDataIndices trainingLabels]=CreateDataset(views(i).viewdata,trainingsetVector,labels);
   [testData testDataIndices testLabels]=CreateDataset(views(i).viewdata,testsetVector,labels);
   %model=LearnSVM(trainingData,trainingLabels);
   model = Learn(trainingData,trainingLabels);
   if(i==1)
       oldlabels = ones(size(testData,1),1);
       probablitys=ones(size(testData,1),2);%max(labels));
   end
  % probablitys=probablitys.*labelprobablitySVM(model,testData,max(labels));
   probablitys= probablitys.*(posterior(model,testData));
   probablitys=weights(i).*probablitys
end
   [ temp newlabels]=max(probablitys,[],2);
   labels(testDataIndices)=newlabels;
   trainingsetVector= ones(size(trainingsetVector,1),1);
   iteration = iteration + 1;
   if(newlabels == oldlabels)
       break;
   else
       oldlabels=newlabels;
   end
end
accuracy=(sum(newlabels == labels)-trainingSize)/testsetSize;
end

