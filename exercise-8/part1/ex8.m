%% Machine Learning Online Class
%  Exercise 8 | Anomaly Detection and Collaborative Filtering
close all;clc
%% 1.��������
fprintf('Visualizing example dataset for outlier detection.\n\n');
load('ex8data1.mat');
figure(1);
plot(X(:,1),X(:,2),'bx');
xlabel('Latency(ms)');
ylabel('Throughput(mb/s)');
axis([0 30 0 30]);
hold on;
%% 2.�������ݼ��ķֲ�ģ�Ͳ���
fprintf('Visualizing Gaussian fit.\n\n');
[mu,sigma2] = estimateGaussian(X);
visualizeFit(X,  mu, sigma2);
hold on;

%% 3.ѡ������epsilon
pval = multivariateGaussian(Xval,mu,sigma2);
[epsilon,F1] = selectThreshold(yval,pval);
fprintf('Best epsilon found using cross-validation: %e\n', epsilon);
fprintf('Best F1 on Cross Validation Set:  %f\n', F1);
fprintf('   (you should see a value epsilon of about 8.99e-05)\n\n');

%% 4.�ҵ��쳣��
p = multivariateGaussian(X, mu, sigma2);
% �ҵ�����ֵС�����޵�����
outliers = find(p < epsilon);
plot(X(outliers,1),X(outliers,2),'ro','LineWidth',2,'MarkerSize',10);
hold off;
fprintf('Program paused. Press enter to continue.\n');
pause;

%% 5.��ά����
clear all;clc
load('ex8data2.mat');
% ����ģ�Ͳ���
[mu,sigma2] = estimateGaussian(X);
% ����ѵ��������֤�������ݸ���
p = multivariateGaussian(X, mu, sigma2);
pval = multivariateGaussian(Xval, mu, sigma2);
% Ѱ������
[epsilon,F1] = selectThreshold(yval, pval);

fprintf('Best epsilon found using cross-validation: %e\n', epsilon);
fprintf('Best F1 on Cross Validation Set:  %f\n', F1);
fprintf('# Outliers found: %d\n', sum(p < epsilon));