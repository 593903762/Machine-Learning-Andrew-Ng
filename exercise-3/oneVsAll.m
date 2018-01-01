function [all_theta] = oneVsAll(X,Y,num_labels,lambda)
%% �Զ����������ͬʱ����ѵ�������������ÿ������ѵ��ģ�Ͳ���theta���Լ����ǵļ���all_theta
% num_labels���������������ĸ���
[m,n] = size(X);

all_theta = zeros(num_labels,n+1);
X=[ones(m,1) , X];
options = optimset('GradObj', 'on', 'MaxIter', 50);
% ��ǰ����д������ݶȵ�����������ڣ������ǶԶ��theta����������⣬ǰ���ǶԵ���theta����������⣬������Ҫ��һ��forѭ��
for c =1:num_labels
    init_theta = zeros(n+1,1);
    %fmincg���÷���fminunc���ƣ����ڴ����������ʱ������Ч
    [theta] = fmincg(@(t) (lrCostFunction(t,X, (Y == c), lambda)) , init_theta , options);  
    all_theta(c,:) = theta.';
end

        
    
    
   

