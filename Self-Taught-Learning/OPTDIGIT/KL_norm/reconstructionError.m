function error=reconstructionError(data,visibleSize,hiddenSize,theta)

% here implement the reconstruction error, means the square error root over
% all test example.
W1 = reshape(theta(1:hiddenSize*visibleSize), hiddenSize, visibleSize);
W2 = reshape(theta(hiddenSize*visibleSize+1:2*hiddenSize*visibleSize), visibleSize, hiddenSize);
b1 = theta(2*hiddenSize*visibleSize+1:2*hiddenSize*visibleSize+hiddenSize);
b2 = theta(2*hiddenSize*visibleSize+hiddenSize+1:end);

[n,m]=size(data);    % size of test set
z2=[b1 W1]*[ones(m,1)';data];
a2=sigmoid(z2);
z3=[b2 W2]*[ones(m,1)';a2];
a3=sigmoid(z3);

error=sum(sum((data-a3).^2))/(n*m);
fprintf('Reconstruction Error is %f \n',error);
end


function sigm = sigmoid(z)
  
    sigm = 1 ./ (1 + exp(-z));
end