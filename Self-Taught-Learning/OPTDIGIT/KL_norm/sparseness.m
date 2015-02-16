function sparse=sparseness(X)
 %here implement the formular int the paper 4.3
 %Error(\textbf{x},\hat{\textbf{x}}) = \frac{1}{MN} \sum_{i=1}^{M}{\sum_{j=1}^{N}{(x_j^i - \hat{x}_j^i})}

 [n,m]=size(X);   %n the demision of X ,m: test sample size
 cursW=(sqrt(n)-sum(abs(X))./sqrt(sum(X.^2)))/(sqrt(n)-1);
 sparse=mean(cursW);
 fprintf('Effectiveness of sparsity level %f \n',sparse);
 
end