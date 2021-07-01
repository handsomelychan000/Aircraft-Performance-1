function dy = plane(t,y)
global h
global P
global RO
dy = zeros(3,1);
g=9.81;
Ct=400*g/3600;
S=56.36;
e=-2.5*(pi/180);
CD0=0.032;
k=0.034;

dy(1)=(g/y(3))*((P/y(1))*cos(e)-0.5*RO*y(1)^2*S*CD0-(k*y(3)^2)/(0.5*RO*y(1)^2*S)-y(3)*sin(y(2)));
dy(2)=(g/(y(3)*y(2)))*((P/y(1))*sin(e)+y(3)-y(3)*cos(y(2)));
dy(3)=-Ct;