function [U,S] = pca(X)
%% ʹ��SVD����PCA�ֽ�
Sigma = X.' * X / (size(X,1));
[U, S, ~]=svd(Sigma);

end
