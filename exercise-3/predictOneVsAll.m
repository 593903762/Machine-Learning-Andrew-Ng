function P = predictOneVsAll(all_theta,X)
%% ����˵���������ݽ���Ԥ��
X=[ones(size(X,1),1),X];
z=X * all_theta.';
h=sigmoid(z);

% h��һ��m*K�ľ���h(m,k)��ֵ��ʾ��m������Ԥ�����ڵ�k��ĸ���
[~,P]=max(h,[],2);
end
