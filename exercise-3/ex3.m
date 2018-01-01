%% Machine Laearning Online Class - Exercise 3: One-vs-All Logistic Regression
close all;clc
%% =================== Part.1 Inilitzation and Load/Visualizing Data =========================
fprintf('Load dataSet:ex3data1.mat\n');
load('ex3data1.mat');
%�����������ѡ��100�����ݣ���ʾ��10*10�����ֱ��
%����[1,m]������������У�ֻȡ100������
randIndex = randperm(size(X,1));
seldata = X(randIndex(1:100),:);
%���ݿ��ӻ�
figure(1);
displayData(seldata);
title('Random handwritten digits');
hold off;

%% =================== Part.2 Vectorizing Logistic Regression =============================
%  ������Logisyic Regression����������ۺ������ݶ�ֵ
fprintf('Training data with one-Vs-All logistic regression\n');

lambda = 0.1;
num_labels=10;
[all_theta] = oneVsAll(X,y,num_labels,lambda);

%% =================== Part.3 Predict for oneVsAll =============================
P=predictOneVsAll(all_theta,X);
fprintf('Training set Accuracy is %f\n',mean(double(P==y))*100);
%�Ҳ����ף�Ϊʲô�ҵ�ģ����ѵ�����ϵ�׼ȷ����94.76%���ﲻ��94.9%

