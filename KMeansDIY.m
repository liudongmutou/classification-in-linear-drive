function [cidx,costDis]=KMeansDIY(data,K)
[data,ps] =mapminmax(data',0,1);%data normalization
data=data';
x_min=min(data(:,1));
x_max=max(data(:,1));
y_min=min(data(:,2));
y_max=max(data(:,2));
x_edge=linspace(x_min,x_max,(K+1));
y_edge=linspace(y_min,y_max,(K+1));
ctrs={x_edge,y_edge};
[N,xcenters]=hist(data(:,1),(K+1));
[M,ycenters]=hist(data(:,2),(K+1));
for i=1:K
    xid=find(N==max(N)); 
    yid=find(M==max(M));
    Kmus_X(i)=xcenters(N==max(N));
    Kmus_Y(i)=ycenters(M==max(M));
    N(xid)=0;M(yid)=0;
    Kmus(i,:)=[ Kmus_X(i), Kmus_Y(i)];
end
X=data;
N=size(X,1);
D=size(X,2);
cost_all = 0;
% Kmus=zeros(K,D); 
%  rndinds=randperm(N);
%  Kmus=X(rndinds(1:K),:);
maxiters=100;
for iter=1:maxiters
   
    sqDmat=pdist2(X,Kmus);%calculate distance to centers
    costDis(iter)=0
    Rnk=determineRnk(sqDmat);
    KmusOld=Kmus;
    Kmus=recalcMus(X,Rnk);
    if sum(abs(KmusOld(:)-Kmus(:)))<1e-6
        disp(iter);
        break
    end

end
costDis = sum(min(sqDmat,[],2));
[~,cidx(:,1)]=max(Rnk,[],2);

plot(X(cidx==1,1),X(cidx==1,2),'r.', ...
 X(cidx==2,1),X(cidx==2,2),'b.',...
 X(cidx==3,1),X(cidx==3,2),'y.',...
 X(cidx==4,1),X(cidx==4,2),'m.');
 xlabel('Normalized Position');
 ylabel('Normalized Force');
end

