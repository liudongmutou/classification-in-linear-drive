function C=precision(data,stcP_X)
p=length(intersect(data.group1(:,1),stcP_X.Clu.clu1(:,1)));
C(1,1)=p/length(stcP_X.Clu.clu1(:,1));
p=length(intersect(data.group2(:,1),stcP_X.Clu.clu2(:,1)));
C(2,1)=p/length(stcP_X.Clu.clu2(:,1));
p=length(intersect(data.group3(:,1),stcP_X.Clu.clu3(:,1)));
C(3,1)=p/length(stcP_X.Clu.clu3(:,1));
p=length(intersect(data.group4(:,1),stcP_X.Clu.clu4(:,1)));
C(4,1)=p/length(stcP_X.Clu.clu4(:,1));
end