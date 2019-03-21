data=CluXSP31;
X1=[data.group1(1:round(size(data.group1,1)/2),:);data.group2(1:round(size(data.group2,1)/2),:);...
    data.group3(1:round(size(data.group3,1)/2),:);data.group4(1:round(size(data.group4,1)/2),:)];
n=size(X1,1);
Y1 = X1(1:100:n,4);
X1=X1(1:100:n,2:3);  
X2=[data.group1((round(size(data.group1,1)/2)+1):size(data.group1,1),:);data.group2((round(size(data.group2,1)/2)+1):size(data.group2,1),:);...
    data.group3((round(size(data.group3,1)/2)+1):size(data.group3,1),:);data.group4((round(size(data.group4,1)/2)+1):size(data.group4,1),:)];
m=size(X2,1);
Y2 = X2(1:100:n,4);
X2=X2(1:100:m,2:3);  
train=X1;test=X2;
[mtrain,ntrain] = size(train);
[mtest,ntest] = size(test);
dataset = [train;test];
[dataset_scale,ps] = mapminmax(dataset',0,1);
dataset_scale = dataset_scale';
train = dataset_scale(1:mtrain,:);
test = dataset_scale( (mtrain+1):(mtrain+mtest),: );

[theta lable]=LRtrain(train,Y1)
[h predictlable] = LRTest(test,theta)
count=0;
for i=1:size(Y2,1)
    if predictlable(i)==Y2(i)
        count=count+1;
    else
        count=count;
    end
end
accuracy=count/size(Y2,1)

