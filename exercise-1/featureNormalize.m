function [ X_Norm,mu,sigma ] = featureNormalize(X)
%%�������ܣ�Feature Normalization
%  ��һ���������X������
%  X_Norm����һ������������
%  mu�����������������ֵ
%  sigma�����������������׼��
mu = mean(X,1);
%sigma = std(X,1);
sigma=sqrt(sum((X-mu).^2)/size(X,1));
X_Norm = (X-mu)./sigma;

end

