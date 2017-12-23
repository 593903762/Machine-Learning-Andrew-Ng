function J = computeCostMulti( X,Y,theta )
%%
%  X��������һ��ά�Ⱥ����������
%  T��X��Ӧ�����ֵ
%  theta��ÿ�δ���Ĳ���
[m,~] = size(X);
hypthesis = X * theta;
err = hypthesis - Y;
J = (err.'*err)/(2*m);
end