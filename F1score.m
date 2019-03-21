function FM=F1score(test_labels,predict_label);
[mat,order] = confusionmat(test_labels,predict_label);
TP=diag(mat);
for i=1:4
    P=sum(mat(:,i));
    C=sum(mat(i,:));
    precision(i,1)=TP(i)/P;
    recall(i,1)=TP(i)/C;
    F1(i,1)=2*precision(i)*recall(i)/(precision(i)+recall(i));
    FM=[precision,recall,F1];
    Pmacro=sum(precision)/4;
    Rmacro=sum(recall)/4;
    Fmacro=2*Pmacro*Rmacro/(Pmacro+Rmacro);
    end
end