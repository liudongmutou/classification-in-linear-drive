function [m,y]=RemoveOutlier(t,y)
  n=length(y);
  z=medfilt1(y,7);
  plot(t,z,'b.');
  hold on;
  xlabel('Time(s)');
  ylabel('Force(N)');
q(:,1)=t;
q(:,2)=y(:,1)-z(:,1);
miu=mean(q(:,2));
std8=8*std(q(:,2));
k=0;
for i=1:size(z,1)
    p(i)=q(i,2)-miu;
    Q(i,1)=abs(p(i));
   if Q(i)>std8
        k=k+1;
        m(k,1)=t(i);%time
        m(k,2)=y(i,1);%true value
        plot(m(k,1),m(k,2));
        text(m(k,1),m(k,2),num2str(k));
        hold on;
   end
end
 y(:,1)=z(:,1);
  end


