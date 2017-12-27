function [J, grad] = costFunctionReg(theta, X, Y, lambda)
%% �������������Ĵ��ۺ������ݶ�ֵ�����У�
%  lambda���������ϵ��
[m,n]=size(X);
[cost1,grad1] = costFunction(theta,X,Y);
J= cost1  + lambda/(2*m) * (theta.'*theta);

grad = zeros(n,1);
grad(1) = grad1(1);
grad(2:n) = grad1(2:n).' + lambda/m.*theta(2:n);

end

