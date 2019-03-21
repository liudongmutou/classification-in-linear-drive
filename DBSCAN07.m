[data,ps] =mapminmax(data',0,1);
data=data';
X=data;
D=pdist2(X,X);
MinPts = 32;
epsilon =0.1;
groupNr = 1;
s =size(X,1);
IDX= zeros(s,1);

    for i=1:s
        Neighbors=find(D(i,(i+1):end)<=epsilon);
        Neighbors =  Neighbors + i ;
    %         Neighbors = [1 2 4 5 6 7]
    %         IDX = [1 1 0 2 3 3 4 4 ]
       if numel(Neighbors)>MinPts
            if IDX(Neighbors)==0
            IDX(Neighbors)=groupNr;
            groupNr = groupNr +1; 
            else
            IDXnei =  IDX(Neighbors);
            IDXmin = min(IDXnei(find(IDXnei)));

            IDXRedund = IDXnei(IDXnei~= min(IDXnei));
            IDXRedund = unique(IDXRedund);
            IDX(Neighbors) = IDXmin;
            for j = 1: length(IDXRedund)
              IDX(IDX==IDXRedund(j))=IDXmin;
            end

            end
     end
    
    end
cidx=IDX;
figure;
plot(X(cidx==1,1),X(cidx==1,2),'r.', ...
X(cidx==2,1),X(cidx==2,2),'b.',...
X(cidx==3,1),X(cidx==3,2),'y.',...
X(cidx==4,1),X(cidx==4,2),'m.',...
X(cidx==0,1),X(cidx==0,2),'k.');
axis equal;
legend('Group1','Group2','Group3','Group4','Noise');
legend('Location', 'NorthEastOutside');
xlabel('Normalized Position');
ylabel('Normalized Force');
title(['DBSCAN Clustering (\epsilon = ' num2str(epsilon) ', MinPts = ' num2str(MinPts) ')']);
