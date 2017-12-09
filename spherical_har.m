function y=spherical_har(m,n,theta,fai)

% this function is for solving the spherical harmonics 
% y is the output 
% n: the order of spherical harmonics
% m: the degree of spherical harmonics
% theta:������ [0,pi]
% fai:��λ�� [0,2*pi]
% write on 2009.4.7
% edit on 4.12

i=sqrt(-1);
p=legendre(n,cos(theta)); 
% Because legendre function is just for [0,m], 
% so harmonics function must be cut into [0,m] and [-m,-1].
if m>=0    
    y=sqrt((2*n+1)*factorial(n-m)/4/pi/factorial(n+m))*p((m+1),:).*exp(i*m*fai);
else
    y=(-1)^(-m)*sqrt((2*n+1)*factorial(n+m)/4/pi/factorial(n-m))*p((-m+1),:).*exp(i*m*fai);
end