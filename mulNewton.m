function [r,n]=mulNewton(F,x0,eps)
%�����Է����飺F
%��ʼ����ֵ��x0
%��ľ��ȣ�eps
%��õ�һ��⣺r
%����������n

if nargin==2
    eps=1.0e-6;
end
x0=transpose(x0);
Fx=subs(F,findsym(F),x0);    %F��������SĿ�꺯��
dF=jacobian(F);              %��F��Jacobian����
dFx=subs(dF,findsym(dF),x0); 
r=x0-Fx\dFx;                 %��ӳ��˹�����ĺ��ĵ�����ʽ
n=1;
to1=1;
while to1>eps
% while n>5
    x0=r;
    Fx=subs(F,findsym(F),x0);
    dFx=subs(dF,findsym(dF),x0);
    r=x0-Fx\dFx;              %���ĵ�����ʽ
    to1=norm(r-x0);
    n=n+1;
    if(n>100000)
        disp('��������̫�࣬���ܲ�������');
        return;
    end
end    