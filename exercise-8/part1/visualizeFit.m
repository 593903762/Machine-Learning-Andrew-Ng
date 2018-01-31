function visualizeFit(X, mu, sigma2)
%% �������ݷֲ��ĸ��ʵȸ���
[X1,X2] = meshgrid(0:.5:35); 
Z = multivariateGaussian([X1(:),X2(:)],mu,sigma2);
Z = reshape(Z,size(X1));

% �����������������С��ֵ���Ͳ�����ͼ��
if ( sum(isinf(Z)) == 0 )
    contour(X1,X2,Z,10.^(-20:2:0));
end

end
