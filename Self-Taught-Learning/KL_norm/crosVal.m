function accuracies=crosVal(trainFeatures,trainLabels,valFeatures,valLabels,testFeatures,testLabels,hiddenSize)
lambda_vec=[0.00001 0.00003 0.0001 0.0003 0.001 0.003  ]';
accuracy=zeros(length(lambda_vec),1);
%softmaxModel = struct; 

for i=1:length(lambda_vec),
    lambda=lambda_vec(i);
    numClasses=numel(unique(trainLabels));
    inputSize=hiddenSize;
    options.maxIter=100;
    options.display='off';
    softmaxModel=softmaxTrain(inputSize,numClasses,lambda,trainFeatures,trainLabels, options);
    [pred]=softmaxPredict(softmaxModel,valFeatures);
    accuracy(i)=100*mean(pred(:) == valLabels(:));
end

[value,index]=max(accuracy);
numClasses=numel(unique(trainLabels));
lambdas=lambda_vec(index);
inputSize=hiddenSize;                             
options.maxIter=100;          
softmaxModel=softmaxTrain(inputSize,numClasses,lambdas,trainFeatures,trainLabels, options);                                              
[pred]=softmaxPredict(softmaxModel,testFeatures);  
accuracies=100*mean(pred(:) == testLabels(:));

end

