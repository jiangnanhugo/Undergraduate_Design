function [trainexample,trainexample_label,validset,validset_label]=sampleImages(images,imageLabels,samplesize)

% We randly sample the dataset Images,divide it into two part, training
% example and validation set.
[n,m]=size(images);
trainexample=zeros(n,samplesize);
trainexample_label=zeros(n,samplesize);
validset=zeros(n,m-samplesize);
validset_label=zeros(n,m-samplesize);
index=randsample(m,samplesize,'false');
rest_index=setdiff(1:m,index);

trainexample=images(:,index);
trainexample_label=imageLabels(index);
validset=images(:,rest_index);
validset_label=imageLabels(rest_index);
    
end

