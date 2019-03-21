% Neural Network
%data import
kraft=xlsread('C:\Users\hp\Desktop\kraft.xlsx');
position=xlsread('C:\Users\hp\Desktop\Positionen.xlsx');
neu_data=[position(3:10:10053,32:34),kraft(3:10:10053,274)];

input_train=neu_data(1:800,1:3)';
output_train=neu_data(1:800,4)';
input_test=neu_data(800:1006,1:3)';

[inputn,inputps]=mapminmax(input_train);
[outputn,outputps]=mapminmax(output_train);
net=newff(inputn,outputn,3);

net.trainParam.epochs=100;
net.trainParam.lr=0.1;
net.trainParam.goal=0.00004;

net=train(net,inputn,outputn);

inputn_test=mapminmax('apply',input_test,inputps);
an=sim(net,inputn_test);
BPoutput=mapminmax('reverse',an,outputps);

%mse ist mean squared error
