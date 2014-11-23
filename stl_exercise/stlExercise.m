%% CS294A/CS294W Self-taught Learning Exercise

%  Instructions
%  ------------
% 
%  This file contains code that helps you get started on the
%  self-taught learning. You will need to complete code in feedForwardAutoencoder.m
%  You will also need to have implemented sparseAutoencoderCost.m and 
%  softmaxCost.m from previous exercises.
%
%% ======================================================================
%  STEP 0: Here we provide the relevant parameters values that will
%  allow your sparse autoencoder to get good filters; you do not need to 
%  change the parameters below.

%train set=50000, corss validation set=10000
trainsize=50000;


inputSize  = 28 * 28;
numLabels  = 5;
hiddenSize = 196;    % here set it to 196 ,equal to the paper's construction.
sparsityParam = 0.1; % desired average activation of the hidden units.
                     % (This was denoted by the Greek alphabet rho, which looks like a lower-case "p",
		             %  in the lecture notes). 
lambda = 3e-3;       % weight decay parameter       
beta = 3;            % weight of sparsity penalty term   
maxIter = 400;

gamma = 5e-2;       % L1-regularisation parameter (on features)
epsilon = 1e-5;     % L1-regularisation epsilon |x| ~ sqrt(x^2 + epsilon)

%% ======================================================================
%  STEP 1: Load data from the MNIST database
%
%  This loads our training and test data from the MNIST database files.
%  We have sorted the data for you in this so that you will not have to
%  change it.

% Load MNIST database files
mnistData   = loadMNISTImages('mnist/train-images.idx3-ubyte');
mnistLabels = loadMNISTLabels('mnist/train-labels.idx1-ubyte');
mnistDataTest=loadMNISTImages('mnist/t10k-images.idx3-ubyte');
mnistLabelsTest=loadMNISTLabels('mnist/t10k-labels.idx1-ubyte');

mnistLabels(mnistLabels==0)=10;    %remap 0 to 10
mnistLabelsTest(mnistLabelsTest==0)=10;
% Set Unlabeled Set (All Images)

[trainData,trainLabels,cvdData,cvdLabels]=sampleImages(mnistData,trainsize,mnistLabels);

unlabeledData=trainData;

testData=mnistDataTest;
testLabels=mnistLabelsTest;

% Output Some Statistics
fprintf('# examples in unlabeled set: %d\n', size(unlabeledData, 2));
fprintf('# examples in supervised training set: %d\n\n', size(trainData, 2));
fprintf('# examples in supervised cross validation set: %d\n\n', size(cvdData, 2));
fprintf('# examples in supervised testing set: %d\n\n', size(cvdData, 2));

%% ======================================================================
%  STEP 2: Train the sparse autoencoder
%  This trains the sparse autoencoder on the unlabeled training
%  images. 

%  Randomly initialize the parameters
theta = initializeParameters(hiddenSize, inputSize);

%% ----------------- YOUR CODE HERE ----------------------
%  Find opttheta by running the sparse autoencoder on
%  unlabeledTrainingImages
addpath minFunc;
opttheta = theta; 

options.Method = 'lbfgs'; % Here, we use L-BFGS to optimize our cost
                          % function. Generally, for minFunc to work, you
                          % need a function pointer with two outputs: the
                          % function value and the gradient. In our problem,
                          % sparseAutoencoderCost.m satisfies this.
options.maxIter = 400;	  % Maximum number of iterations of L-BFGS to run 
options.display = 'on';


[opttheta, cost] = minFunc( @(p) sparseAutoencoderCost(p, ...
                                   inputSize, hiddenSize, ...
                                   lambda, sparsityParam, ...
                                   beta, unlabeledData,...
                                   gamma,epsilon), ...
                              opttheta, options);

%% -----------------------------------------------------
                          
% Visualize weights
W1 = reshape(opttheta(1:hiddenSize * inputSize), hiddenSize, inputSize);
display_network(W1');

%%======================================================================
%% STEP 3: Extract Features from the Supervised Dataset
%  
%  You need to complete the code in feedForwardAutoencoder.m so that the 
%  following command will extract features from the data.

trainFeatures = feedForwardAutoencoder(opttheta, hiddenSize, inputSize, ...
                                       trainData);

cvdFeatures = feedForwardAutoencoder(opttheta, hiddenSize, inputSize, ...
                                       cvdData);

testFeatures = feedForwardAutoencoder(opttheta, hiddenSize, inputSize, ...
                                       testData);                                   
                                   

%%======================================================================
%% STEP 4: Train the softmax classifier

softmaxModel = struct;  

%  Use softmaxTrain.m from the previous exercise to train a multi-class
%  classifier. 

%  Use lambda = 1e-4 for the weight regularization for softmax

% You need to compute softmaxModel using softmaxTrain on trainFeatures and
% trainLabels
lambda=1e-4;
numClasses=numel(unique(trainLabels));
inputSize=hiddenSize;
options.maxIter=100;
softmaxModel=softmaxTrain(inputSize,numClasses,lambda,...
                        trainFeatures,trainLabels, options);


%% ------------------------ CORSS VALIDATION METHOD -----------------------------
[lambda_vec,error_train,error_val]=validationCurve(trainFeatures,trainLabels,cvdFeatures,cvdLabels,...
                                    inputSize,numClasses,options);

%%======================================================================
%% STEP 5: Testing 

%% ----------------- YOUR CODE HERE ----------------------
% Compute Predictions on the test set (cvdFeatures) using softmaxPredict
% and softmaxModel



[pred]=softmaxPredict(softmaxModel,testFeatures);


%% -----------------------------------------------------

% Classification Score
fprintf('Test Accuracy: %f%%\n', 100*mean(pred(:) == testLabels(:)));

% (note that we shift the labels by 1, so that digit 0 now corresponds to
%  label 1)
%
% Accuracy is the proportion of correctly classified images
% The results for our implementation was:
%
% Accuracy: 98.3%
%
% 
