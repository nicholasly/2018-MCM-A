n=20;
w=(pi/30:(2*pi-pi/30)/19:2*pi);
an=randn(1,20);
rad=(-pi:2*pi/19:pi);
g=9.8;
%h=zeros(201,201);
h=zeros(21,21);
j=1;
k=1;
t=0;
%[x,y]=meshgrid(-10:10,-10:10)
x=(-10:10);
y=(-10:10);
%x=(-50:0.5:50);
%y=(-50:0.5:50);
for m=1:21
    for n=1:211
     %   for t=0:0.1:30
            for i=1:20
                e=2*pi*rand();
                a=(w(i)^2)/g;
     h(j,k)=h(j,k)+an(i)*cos(a*x(j)*cos(rad(i))+a*y(k)*cos(rad(i)-w(i)*t+e));
            end
            k=k+1;
            if k==21
                k=1;
            end
    end
    j=j+1;
end
%mesh(x,y,h);
surf(x,y,h)