function [centroids] = kMeansInitCentroids(X,K)
%% ����K���������
randIndex = randperm(size(X,1));
centroids  = X(randIndex(1:K),:);

end
