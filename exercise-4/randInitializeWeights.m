function init_theta = randInitializeWeights(L_in,L_out)
%% ��������˵������ʼ�������֮���Ȩ�أ����룺L_in�������L_out
epsilon_init = 0.12;
init_theta = rand(L_out,L_in+1) * 2* epsilon_init - epsilon_init;

end
