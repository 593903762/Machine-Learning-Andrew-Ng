function J = computeCost( X,Y,theta )
%%
%  X��������һ��ά�Ⱥ����������
%  T��X��Ӧ�����ֵ
%  theta��ÿ�δ���Ĳ���
[~,m]=size(X);
hypthesis = theta.'*X;
err = hypthesis -Y;
J = (err*err.') /(2*m);
end

