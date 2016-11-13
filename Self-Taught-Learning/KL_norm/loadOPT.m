function [trainData,trainLabels,testData,testLabels]=loadOPT(opt_dir)
fprintf('Loading training data...\n');
data=load([opt_dir '/optdigits.tra']);
test=load([opt_dir '/optdigits.tes']);

trainData=data(:,2:end-1);
trainLabels=data(:,end)+1;
testData=test(:,2:end-1);
testLabels=test(:,end)+1;


% [trainData, mu, sigma] = zscore(trainData);
% testData = normalize(testData, mu, sigma);
trainData=trainData'/16;
testData=testData'/16;
end