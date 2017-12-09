function [k,ender]=steepest(f,x,e)
    %�ݶ��½���,fΪĿ�꺯����������x1��x2����xΪ��ʼ��,��[0;0]
    syms x0 x1 x2 x3 x4 x5 x6 x7 x8 x9 x10 x11 x12 x13 x14 x15 x16 x17 x18 x19 x20 x21 x22 x23 x24 x25 m; %mΪѧϰ��
    d=-[diff(f,x0);diff(f,x1);diff(f,x2);diff(f,x3);diff(f,x4);diff(f,x5);diff(f,x6);diff(f,x7);diff(f,x8);diff(f,x9);diff(f,x10);diff(f,x11);diff(f,x12);diff(f,x13);diff(f,x14);diff(f,x15);diff(f,x16);diff(f,x17);diff(f,x18);diff(f,x19);diff(f,x20);diff(f,x21);diff(f,x22);diff(f,x23);diff(f,x24);diff(f,x25)];  %�ֱ���x1��x2��ƫ���������½��ķ���
    flag=1;  %ѭ����־
    k=0; %��������
    while(flag)
        d_temp=subs(d,x0,x(1));      %����ʼ����룬��õ����½�x1�ݶ�ֵ
        d_temp=subs(d_temp,x1,x(2)); %����ʼ����룬��õ����½�x2�ݶ�ֵ
        d_temp=subs(d_temp,x2,x(3));
        d_temp=subs(d_temp,x3,x(4));
        d_temp=subs(d_temp,x4,x(5));
        d_temp=subs(d_temp,x5,x(6));
        d_temp=subs(d_temp,x6,x(7));
        d_temp=subs(d_temp,x7,x(8));
        d_temp=subs(d_temp,x8,x(9));
        d_temp=subs(d_temp,x9,x(10));
        d_temp=subs(d_temp,x10,x(11));
        d_temp=subs(d_temp,x11,x(12));
        d_temp=subs(d_temp,x12,x(13));
        d_temp=subs(d_temp,x13,x(14));
        d_temp=subs(d_temp,x14,x(15));
        d_temp=subs(d_temp,x15,x(16));
        d_temp=subs(d_temp,x16,x(17));
        d_temp=subs(d_temp,x17,x(18));
        d_temp=subs(d_temp,x18,x(19));
        d_temp=subs(d_temp,x19,x(20));
        d_temp=subs(d_temp,x20,x(21));
        d_temp=subs(d_temp,x21,x(22));
        d_temp=subs(d_temp,x22,x(23));
        d_temp=subs(d_temp,x23,x(24));
        d_temp=subs(d_temp,x24,x(25));
        d_temp=subs(d_temp,x25,x(26));
        
        nor=norm(d_temp); %����
        if(nor>=e) %�ݶ�Ϊ0��˵���ﵽ��С��
            x_temp=x+m*d_temp;            %�ı��ʼ��x��ֵ
            f_temp=subs(f,x0,x_temp(1));  %���ı���x1��x2����Ŀ�꺯��
            f_temp=subs(f_temp,x1,x_temp(2));
            f_temp=subs(f_temp,x2,x_temp(3));
            f_temp=subs(f_temp,x3,x_temp(4));
            f_temp=subs(f_temp,x4,x_temp(5));
            f_temp=subs(f_temp,x5,x_temp(6));
            f_temp=subs(f_temp,x6,x_temp(7));
            f_temp=subs(f_temp,x7,x_temp(8));
            f_temp=subs(f_temp,x8,x_temp(9));
            f_temp=subs(f_temp,x9,x_temp(10));
            f_temp=subs(f_temp,x10,x_temp(11));
            f_temp=subs(f_temp,x11,x_temp(12));
            f_temp=subs(f_temp,x12,x_temp(13));
            f_temp=subs(f_temp,x13,x_temp(14));
            f_temp=subs(f_temp,x14,x_temp(15));
            f_temp=subs(f_temp,x15,x_temp(16));
            f_temp=subs(f_temp,x16,x_temp(17));
            f_temp=subs(f_temp,x17,x_temp(18));
            f_temp=subs(f_temp,x18,x_temp(19));
            f_temp=subs(f_temp,x19,x_temp(20));
            f_temp=subs(f_temp,x20,x_temp(21));
            f_temp=subs(f_temp,x21,x_temp(22));
            f_temp=subs(f_temp,x22,x_temp(23));
            f_temp=subs(f_temp,x23,x_temp(24));
            f_temp=subs(f_temp,x24,x_temp(25));
            f_temp=subs(f_temp,x25,x_temp(26));
            
            h=diff(f_temp,m);  %��m�󵼣��ҳ����ѧϰ��
            m_temp=solve(h);   %�󷽳̣��õ�����m
            x=x+m_temp*d_temp; %������ʼ��x
            k=k+1;
        else
            flag=0;
        end
    end
    ender=double(x);  %�յ�
end