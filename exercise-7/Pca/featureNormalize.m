function [X_norm, mu, sigma] = featureNormalize(X)
%% �����ݽ��б�׼����������
% ����д������Mattlab��׼д��
mu = mean(X);
X_norm = bsxfun(@minus, X, mu);
sigma = std(X_norm); % �õ���׼��
X_norm = bsxfun(@rdivide, X_norm, sigma);

end
