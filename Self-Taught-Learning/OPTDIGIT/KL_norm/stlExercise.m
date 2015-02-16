function [sparse,reconstructError,testAccuracy]=stlExercise(beta)

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

%train set=3823, corss validation set=10000, test set = 10000
trainsize=3000;


inputSize  = 63;

hiddenSize = 25;    % here set it to 196 ,equal to the paper's construction.
sparsityParam = 0.1; % desired average activation of the hidden units.
                     % (This was denoted by the Greek alphabet rho, which looks like a lower-case "p",
		             %  in the lecture notes).       
lambda = 3e-3;       % weight of sparsity penalty term   
% beta=3;              % weight of sparsity penalty term




%% ======================================================================
%  STEP 1: Load data from the MNIST database
%
%  This loads our training and test data from the MNIST database files.
%  We have sorted the data for you in this so that you will not have to
%  change it.

% Load MNIST database files
[optData, optLabels,testData,testLabels]= loadOPT('optdigits');

[trainData,trainLabels,valData,valLabels]=sampleImages(optData,optLabels,trainsize);

% Output Some Statistics
fprintf('# examples in supervised training set: %d\n', size(trainData, 2));
fprintf('# examples in supervised cross-validation set: %d\n', size(valData, 2));
fprintf('# examples in supervised testing set: %d\n', size(testData, 2));

%% ======================================================================
%  STEP 2: Train the sparse autoencoder
%  This trains the sparse autoencoder on the unlabeled training
%  images. 

%  Randomly initialize the parameters
theta = initializeParameters(hiddenSize, inputSize);

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
options.display = 'off';


[opttheta, ~] = minFunc( @(p) sparseAutoencoderCost(p, ...
                                   inputSize, hiddenSize, ...
                                   lambda, sparsityParam, ...
                                   beta,trainData), ...
                              opttheta, options);

%% -----------------------------------------------------
                          
% Visualize weights
W1 = reshape(opttheta(1:hiddenSize * inputSize), hiddenSize, inputSize);
% save data.mat W1;
% visualize(W1');
%display_network(W1');

%%======================================================================
%% STEP 3: Extract Features from the Supervised Dataset
%  
%  You need to complete the code in feedForwardAutoencoder.m so that the 
%  following command will extract features from the data.

trainFeatures = feedForwardAutoencoder(opttheta, hiddenSize, inputSize, ...
                                       trainData);

valFeatures = feedForwardAutoencoder(opttheta, hiddenSize, inputSize, ...
                                       valData);

testFeatures = feedForwardAutoencoder(opttheta, hiddenSize, inputSize, ...
                                       testData);                                   
                                   

% %%======================================================================
% %% STEP 4: Train the softmax classifier
% 
% softmaxModel = struct;  
% %%=====================================================================
% %%	SETP5: Cross Validation & Testing
testAccuracy=crosVal(trainFeatures,trainLabels,valFeatures,valLabels,testFeatures,testLabels,hiddenSize);
reconstructError=constructError(testData,opttheta,hiddenSize,inputSize);
sparse=sparseness(testFeatures);
% fprintf('Beta is equal to %f\n',beta);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
end
