function [out ] = sigmoid(z)
%% logsitic ����
out = 1.0 ./ (1.0+exp(-z));
end