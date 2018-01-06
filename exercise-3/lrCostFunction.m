function [Jcost,grad] = lrCostFunction(theta,X,Y,lambda)
%% ������ۺ������ݶ�ֵ
% X:m*n    Y:m*1   theta:n*1 
[m,~]=size(X);
hypthesis = sigmoid(X*theta);

%��������Ĵ��ۺ������ʽ
Jcost = ( -Y.' * log(hypthesis) - (1-Y.') * log(1-hypthesis) ) / (m) + lambda  / (2*m) * (theta.' * theta);

grad =( (X.') * (hypthesis - Y) +lambda * [0;theta(2:end)] ) / m;

end
