
lambda_vec=[  0 0.00001 0.00003 0.0001 0.0003 0.001 0.003  ]';
accuracy=zeros(length(lambda_vec),1);


for i=1:length(lambda_vec),
    lambda=lambda_vec(i);
    numClasses=numel(unique(trainLabels));
    inputSizes=hiddenSize;
    options.maxIter=100;
    softmaxModel=softmaxTrain(inputSizes,numClasses,lambda,trainFeatures,trainLabels, options);
    [pred]=softmaxPredict(softmaxModel,valFeatures);
    accuracy(i)=100*mean(pred(:) == valLabels(:));
end

for i=1:length(accuracy)
    fprintf('Cross Validation Accuracy: %f%%\n', accuracy(i));
end
[value,index]=max(accuracy);
lambda=lambda_vec(index);
inputSizes=hiddenSize;                             
options.maxIter=100;          
softmaxModel=softmaxTrain(inputSizes,numClasses,lambda,trainFeatures,trainLabels, options);                                              
[pred]=softmaxPredict(softmaxModel,testFeatures);      
fprintf('Test Accuracy:%f %%\n',100*mean(pred(:) == testLabels(:))); 