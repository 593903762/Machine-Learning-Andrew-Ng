%% Machine Learning Online Class - Exercise 3 : Neural Networks
% ʹ�ü򵥵���������ʵ�֡���д����ʶ�𡰣�����ֻ��3�㣺����㡢�м����ز㡢�����
% �м����ز���25��unit�����1��ֵΪ1��ƫ��unit
% �������10�����unit����Ӧ���ֵ�10�����

%% =================== Part.1 Inilization and Load/Visualizing Data ======================
close all;clc
fprintf('Load data and visulizing .... \n');
load('ex3data1.mat');

index = randperm(size(X,1));
figure(1);
displayData(X(index(1:100),:));
title('Random Examples');
hold off;

%% =================== Part.2 Load Parameters  ==================================
% ����ѵ���õĲ�����
% Thtea1����Ӧ���ز�ÿһ���ڵ���������
% Theta2����Ӧ�����ÿһ��unit�Ĳ���
fprintf('Load parameters Theta1 and Thetha2 ....\n');
load('ex3weights.mat');

%% ================== Part.3 Implement Prediction ===============================
fprintf('Implement prediction ....\n');
%����Ĳ�����ѵ���õģ����Կ���ֱ������Ԥ�⣬����˲���Ҫ����ѵ���ļ���
P=predict(X,Theta1,Theta2);

fprintf('The training set accuracy is %f\n',mean(double(P==y))*100);

% ���ȡ��X�е����ݣ��ο�������Ԥ����
figure(2);
for i =1 : size(X,1)
    fprintf('Displaying the random example ... \n');
    displayData(X(index(i),:));
    
    fprintf('The ture digit is %d ,the Neural Networks prediction : %d (digit %d)',mod(y(index(i)),10),mod(P(index(i)),10));
    
    fprintf('Program paused. Pleasr enter any key to continue.\n');
    pause;
end








