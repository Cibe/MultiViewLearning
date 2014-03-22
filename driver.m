% load the parameters 
parametersFile = fopen('parameters1');   % check the sample parameters file for the format          
numSplits = fscanf(parametersFile,'%d'); 
dataPath = fgetl(parametersFile); 
folderPath = fgetl(parametersFile);
Cotraining.numberofViews = fscanf(parametersFile,'%d');            
path = fgetl(parametersFile);
labels = load(strcat(folderPath,path));
Cotraining.classLabels = labels.labels
Cotraining.numberLabels = size(Cotraining.classLabels,2);                             
Cotraining.numberIds = size(Cotraining.classLabels,1)               
trainingProportion = 0.1;   
for view_id=1:Cotraining.numberofViews        
    path = fgetl(parametersFile)
    data=load(strcat(folderPath,path));
    Cotraining.view(view_id).viewdata = data.('view');
    Cotraining.view(view_id).numfeatures=size(Cotraining.view(view_id).viewdata,2);           % get the data for the
end    
Cotraining.numberLabels=max(labels.labels);
numSplits=1;
%   create training and test set
% get the accuracys and create a magnifying vector on every split

Cotraining.numberLabels

for j=1:Cotraining.numberLabels
    for i=1:numSplits
     load(strcat(dataPath,int2str(i)));
     Cotraining.initiallabeledVector=tv;
     Cotraining.accuracy=cotrain(Cotraining.numberofViews,Cotraining.view,Cotraining.initiallabeledVector,Cotraining.classLabels(:,j))
    end
end
Accsum = sum(Cotraining.accuracy);
Accuracy = Accsum./numSplits;
save('Accuracysfile','Accuracy');               
