function [ model ] = Learn( trainingSet,labels )
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here
  model = NaiveBayes.fit(trainingSet,labels,'Distribution', 'mn');
end

