function [ x,minf ] = minGN( f,x0,var,eps )
%   minGN�Ǳ�׼�ĸ�˹ţ���㷨
% Ŀ�꺯����   f��
% ��ʼ�㣺    x0��
% �Ա�����    var��
% ���ȣ� eps��
% Ŀ�꺯��ȡ��Сֵʱ���Ա���ֵ�� x��
% Ŀ�꺯����Сֵ��    minf��

format long;
if nargin == 3
    eps = 1.0e-6;
end
S = transpose(f)*f;     %Ŀ�꺯�� S �ݶ�
k = length(f);
n = length(x0);
x0 = transpose(x0);
tol = 1;
A = jacobian(f,var);    %���㺯�� f ���ݶ�

while tol>eps
    Fx = zeros(k,1);
    for i=1:k
        Fx(i,1) = Funval(f(i),var,x0);
    end
    Sx = Funval(S,var,x0);
    Ax = Funval(A,var,x0);
    gSx = transpose(Ax)*Fx;
    
    
    dx = -transpose(Ax)*Ax\gSx;     %�Ա�������
    x0 = x0 + dx;
    tol = norm(dx);
    x0 = vpa(x0);
end
x = x0;
minf = Funval(S,var,x);
format short;
end

