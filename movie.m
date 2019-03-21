r=subplot(2,1,1)
z=peaks;surf(z);
axis tight
set(gca,'nextplot','replacechildren');
s=subplot(2,1,2)
z=peaks;surf(z);
axis tight
set(gca,'nextplot','replacechildren');
for j=1:20
axes(r)
surf(sin(2*pi*j/20)*z,z)
axes(s)
surf(sin(2*pi*(j+5)/20)*z,z)
F(j)=getframe(gcf);
pause(.0333)
end
h2=figure;
movie(F,10);
movie(h2,F,10);