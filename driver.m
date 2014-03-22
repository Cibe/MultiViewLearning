% load the parameters 
parametersFile = fopen('parameters1');   % check the sample parameters file for the format          
numSplits = fscanf(parametersFile,'%d'); 
dataPath = fgetl(parametersFile); 
folderPath = fgetl(parametersFile);
multiViewlearning.numberofViews = fscanf(parametersFile,'%d');            
path = fgetl(parametersFile);
labels = load(strcat(folderPath,path));
multiViewlearning.classLabels = labels.labels
multiViewlearning.numberLabels = size(multiViewlearning.classLabels,2);                             
multiViewlearning.numberIds = size(multiViewlearning.classLabels,1)               
trainingProportion = 0.1;   
for view_id=1:multiViewlearning.numberofViews        
    path = fgetl(parametersFile)
    data=load(strcat(folderPath,path));
    multiViewlearning.view(view_id).viewdata = data.('view');
    multiViewlearning.view(view_id).numfeatures=size(multiViewlearning.view(view_id).viewdata,2);           % get the data for the
end    
multiViewlearning.numberLabels=max(labels.labels);
numSplits=1;
%   create training and test set
% get the accuracys and create a magnifying vector on every split

multiViewlearning.numberLabels

for j=1:multiViewlearning.numberLabels
    for i=1:numSplits
     load(strcat(dataPath,int2str(i)));
     multiViewlearning.initiallabeledVector=tv;
     multiViewlearning.accuracy=cotrain(multiViewlearning.numberofViews,multiViewlearning.view,multiViewlearning.initiallabeledVector,multiViewlearning.classLabels(:,j))
    end
end
Accsum = sum(multiViewlearning.accuracy);
Accuracy = Accsum./numSplits;
save('Accuracysfile','Accuracy');               
