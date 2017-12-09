function CRB=ball_crb(M,N,elevation,azimuth,y_omega,Bn,Rs,snapshot,sigma)
%Cramer-Rao Bound  Զ���ź�
%%%      N  ��г����
%%%      M  ��Ԫ����
%%%      elevation  ������
%%%      azimuth   ��λ��
    
%%%���ϽǶȾ�Ϊ������ʽ
%Rs Э�������
%snapshot ������
%sigma ��������
%%%%s���  ����Ϊ�����ǡ���λ�ǵ�CRB 
    I=size(elevation,1);
    for n=0:N
        for m=-n:n 
            for i=1:I                
                %[y_fai(i,n.^2+n+m+1) D_theta(i,n.^2+n+m+1) D_fai(i,n.^2+n+m+1)]=spherical_har1(m,n,elevation1(i),azimuth1(i));     % ����Y(fai)����
                [y_fai(i,n.^2+n+m+1) D_theta(i,n.^2+n+m+1) D_fai(i,n.^2+n+m+1)]=spherical_har2(m,n,elevation(i),azimuth(i));     % ����Y(fai)����
            end
        end
    end
    %C=pinv(y_omega);
    %Aa=(C*C')^(-1/2)*Bn*y_fai';
    %D1=(C*C')^(-1/2)*Bn*D_theta'.*pi./180;;
    %D2=(C*C')^(-1/2)*Bn*D_fai'.*pi./180;;
    Aa=y_omega*Bn*y_fai';
    D1=y_omega*Bn*D_theta'.*pi./180;
    D2=y_omega*Bn*D_fai'.*pi./180;
    %TT=eye(25)-Aa*inv(Aa'*Aa)*Aa';
    TT=eye(M)-Aa*inv(Aa'*Aa)*Aa';
    H11=D1'*TT*D1;
    H12=D1'*TT*D2;
    H21=D2'*TT*D1;
    H22=D2'*TT*D2;
    HH=[H11 H12;H21 H22];
    E=sigma/2/snapshot.*inv(real(HH.*[Rs Rs;Rs Rs]));
    CRB=sqrt(diag(E));    