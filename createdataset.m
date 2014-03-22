function [ selectedData id labels] = CreateDataset(data,selectionVector,labels)
%UNTITLED5 Summary of this function goes here
%   Detailed explanation goes here
 data = [data labels];
 temp = 1:size(data,1);
 id=temp'.*selectionVector;
 id(id==0)=[];
 selectedData=data(id,:);
 labels = selectedData(:,size(selectedData,2));
 selectedData = selectedData(:,1:(size(selectedData,2)-1));
end