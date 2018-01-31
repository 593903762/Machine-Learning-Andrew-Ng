function [mu,sigma2] = estimateGaussian(X)
%% ���Ƹ�˹�ֲ��Ĳ���

[m, ~] = size(X);

mu = sum(X) / m;
sigma2 = sum( bsxfun(@minus,X,mu) .^ 2) / (m-1);

% sigma2 = var(X) / m;

end
