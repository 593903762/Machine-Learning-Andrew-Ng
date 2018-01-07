function  [J,grad] = nnCostFunction(input_layer_size, ...
                                                 hidden_layer_size, ...
                                                 label_num, ...
                                                 Theta, ...
                                                 X,y,lambda)
%% �������ܣ�������������ݺͶ�Ӧ��������Լ���������Ӧ�Ĳ�����������ۺ���
if nargin == 6
    %ֻ��6��������ʱ�򣬱�ʾû���������ϵ��lambda����Ϊ0
    lambda =0;
end
%% ��һ���֣�������ۺ���
theta1 = reshape(Theta(1:hidden_layer_size * (input_layer_size + 1 )),hidden_layer_size,input_layer_size+1); 
theta2 = reshape(Theta(hidden_layer_size * (input_layer_size + 1 )+1:end),label_num,hidden_layer_size+1);

[m,~] = size(X);
X = [ones(m,1),X];

a1 = X;

z2 = a1 * theta1.' ;
a2 = sigmoid(z2);
a2 = [ones(size(a2,1),1) , a2];

z3 = a2 * theta2.';
a3 = sigmoid(z3);
% ת���������
yk = zeros(length(y),label_num);
for i =1:length(y)
    yk(i,y(i)) =1;
end

logisf = (-yk) .* log(a3) - (1-yk) .* log(1 - a3);
J = (1/m) * sum(sum(logisf)) + (lambda/(2*m)) * ( sum(sum(theta1(:,2:end) .^ 2 )) + sum(sum(theta2(:,2:end) .^2)) );

%% �ڶ����֣�BP�㷨�������ĵ��ϵ�д�������Ǻ�����֪��BP�㷨��Щ��һ��
delta3 = a3 - yk;

delta2 = delta3 * theta2 .* sigmoidGradient([ones(size(z2,1),1),z2]);
delta2 = delta2(:,2:end);

tridelta_1 = 0;
tridelta_1 = tridelta_1 + delta2.' * a1;
teta1_temp = [zeros(hidden_layer_size,1),theta1(:,2:end)];
theta1_grad = (1/m) .* tridelta_1 + (lambda/m) *teta1_temp  ;

tridelta_2 = 0;
tridelta_2 = tridelta_2 + delta3.' * a2;
theta2_temp = [zeros(label_num,1),theta2(:,2:end)];
theta2_grad = (1/m) .* tridelta_2 +(lambda/m) *theta2_temp ;

grad = [theta1_grad(:);theta2_grad(:)];

end
