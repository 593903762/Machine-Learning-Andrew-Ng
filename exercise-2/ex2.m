%% Machine Learning Online Class - Exercise 2: Logistic Regression
%
%  Instructions
%  ------------
% 
%  This file contains code that helps you get started on the logistic
%  regression exercise. You will need to complete the following functions 
%  in this exericse:
%
%     sigmoid.m
%     costFunction.m
%     predict.m
%     costFunctionReg.m
%
%  For this exercise, you will not need to change any code in this file,
%  or any other files other than those mentioned above.
%
%% ==================== Part 1: Initialization and Visualizing ====================
clear all;clc
dataSet = load('ex2data1.txt');
X=dataSet(:,1:2);
Y=dataSet(:,3);
figure;
plotData(X,Y);

xlabel('Exam1 score');
ylabel('Exam2 score');
legend('Admiited','Not admiited');
hold off;
%% ============ Part 2: Compute Cost and Gradient ============
X=[ones(size(X,1),1),X];
initTheta = zeros(size(X,2),1);

[cost,grad] = costFunction(initTheta,X,Y);
fprintf('The cost value at initThtea (zeros) is : %f\n ',cost);
fprintf('The gradient value at initThtea (zeros) is : %f\n ',grad);

%% ============= Part 3: Optimizing using fminunc  =============
% fminunc�������ܣ�
% �ҵ�һ���������������Сֵ����һ�����Ƶĳ���ֵ��ʼ��ͨ�������Ż���Լ������������
% x =fminunc(fun,x0,options)    ���ݽṹ��options�е��������ҵ���Сֵ������optimset������options
% [x,fval]= fminunc(...)    ����Ŀ�꺯��fun�ڽ�x���ĺ���ֵfval

%ʹ���Զ�����ݶȺ�������������Ϊ400��
maxIter = 400;
J = zeros(maxIter,1);
theta = initTheta;
options = optimset('GradObj', 'on', 'MaxIter', 1);
for i =1:maxIter
    [theta,cost] = fminunc(@(the)(costFunction(the,X,Y)),theta,options);
    J(i) = cost;
end

figure(2);
plot([1:maxIter],J,'b-','LineWidth',2);
xlabel('Iterator number');
ylabel('Cost value');

fprintf('Cost at theta found by fminunc: %f\n', cost);
fprintf('theta: \n');
fprintf(' %f \n', theta);

%���Ʒֽ���
figure(3);
plotDecisionBoundary( theta,X,Y );

xlabel('Exam1 score');
ylabel('Exam2 score');
legend('Admitted', 'Not admitted', 'Decision Boundary')
hold off;

%% ============== Part 4: Predict and Accuracies ==============
prob = sigmod([1 45 85] * theta);
fprintf(['For a student with scores 45 and 85, we predict an admission ' ...
         'probability of %f\n\n'], prob);
P = predict (theta,X);
fprintf('The model train accuracy is: %f\n', mean(double(P == Y))*100);
