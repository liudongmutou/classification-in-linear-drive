s=M';
subplot(2,2,1);
plot(s);
title('ԭʼ�ź�')
%=============================

%��db1С����ԭʼ�źŽ���6��ֽⲢ��ȡϵ��

[c,l]=wavedec(s,3,'db1');%���ж���������

a3=appcoef(c,l,'db1',3);

d3=detcoef(c,l,3);

d2=detcoef(c,l,2);

d1=detcoef(c,l,1);

%=============================

%���źŽ���ǿ�������봦��ͼʾ���

dd3=zeros(1,length(d3));

dd2=zeros(1,length(d2));

dd1=zeros(1,length(d1));

c1=[a3 dd3 dd2 dd1];

s1=waverec(c1,l,'db1');

subplot(2,2,2); plot(s1);grid;

title('ǿ���������ź�');

%=============================

%��Ĭ����ֵ���źŽ������봦��ͼʾ���

%��ddencmp��������źŵ�Ĭ����ֵ

[thr,sorh,keepapp]=ddencmp('den','wv',s); 
s2=wdencmp('gbl',c,l,'db1',3,thr,sorh,keepapp);

subplot(2,2,3); plot(s2);grid;

title('Ĭ����ֵ�������ź�');

%=============================

%�ø���������ֵ�������봦��
softd1=wthresh(d1,'s',0);

softd2=wthresh(d2,'s',1.823);

softd3=wthresh(d3,'s',2.768);

c2=[a3 softd3 softd2 softd1];

s3=waverec(c2,l,'db1');

subplot(2,2,4); plot(s3);grid;

title('��������ֵ�������ź�'); 
ftd1=wthresh(d1,'s',1.465);