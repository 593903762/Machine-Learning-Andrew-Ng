function X_rec = recoverData(X_pro,U,K)
%% ��ͶӰ����X_pro�ָ���ԭʼ����

X_rec=X_pro * U(:,1:K).';

end
