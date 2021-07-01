%% Engine Thrust Estimation
%% Variables 
RO_SS=1.225;%density in sea level at standard condition
T_SS=288.16;%temperature in sea level at standard condition
g=9.81;%garvitrsal air const
E=0.75;%propellor efficiency
R=287;%universall const of air
a1=-6.5*10^(-3);%slope in Troposphere
s=56.36;%area of wing
w=21000*g;%plane weight
Cd0=0.285;%zero lift dar coeff
k=0.361;%induced drag coeff
y=1.4;
%% Inputs
V=input('PLEASE Enter The Velocity ');
N=input('PLEASE Enter The RPM ');
P=input('PLEASE Enter The Power ');%power of one engine
D=input('PLEASE Enter The Diameter ');
h=input('PLEASE Enter The Altitude ');
while h<0 || h>11000
display('Altitude Must Be Between 0&11000 ')
h=input('PLEASE Enter The Altitude ');
end
T=input('PLEASE Enter The Temp Of Sea Level ');
%% Find Thrust
T1=T+a1*(h-0);
RO1=RO_SS*(T/T_SS)^(-g/(a1*R)-1);
RO2=RO1*(T1/T)^(-g/(a1*R)-1);
J=V/(N*D);
Cp=2*P/(RO2*(N^3)*(D^5));
Ct=(E*Cp)/J;
Th=Ct*RO2*(N^2)*(D^4);
display(J)
display(Cp)
display(Ct)
display(Th)
%% Thrust VS Velocity At Sea Level
T2=T+a1*(0-0);
RO3=RO1*(T2/T)^(-g/(a1*R)-1);
P1=2*P*(RO3/RO1).^0.7; %power depend on density variation with altitude
Th1=(E*P1)/V;%thrust at sea level
display(Th1)
%% Plot Thrust VS Velocity At Sea Level
V1=(10:5:500);
Th2=(E*P1)./V1;
plot(V1,Th2)
title('Thrust At Sea Level');
xlabel('Velocity');
ylabel('Thrust');
hold on
plot(V,Th1,'r*')
%% Thrust VS Velocity At h=6000m
T3=T+a1*(6000-0);
RO4=RO1*(T3/T)^(-g/(a1*R)-1);
P2=2*P*(RO4/RO1).^0.7; %power depend on density variation with altitude
Th3=(E*P2)/V;%thrust at h=60000m
display(Th3)
%% Plot Thrust VS Velocity At h=6000m
V1=(10:5:500);
Th4=(E*P2)./V1;
figure
plot(V1,Th4)
title('Thrust At h=6000m');
xlabel('Velocity');
ylabel('Thrust');
hold on
plot(V,Th3,'r*')
%% Thrust VS Velocity At Sea Level For Max Cruise
P3=2*1379544.76243;%power in max cruise
T2=T+a1*(0-0);
RO3=RO1*(T2/T)^(-g/(a1*R)-1);
P4=P3*(RO3/RO1).^0.7; %power depend on density variation with altitude
Th5=(E*P4)/V;%thrust at sea level for max cruise
display(Th5)
%% Plot Thrust VS Velocity At Sea Level For Max Cruise
V1=(10:5:500);
Th6=(E*P4)./V1;
figure
plot(V1,Th6)
title('Thrust At Sea Level For Max Cruise');
xlabel('Velocity');
ylabel('Thrust');
hold on
plot(V,Th5,'r*')
%% Thrust VS Velocity At Sea Level For Max Continous
P5=2*2087959.64043;%power in max continous
T2=T+a1*(0-0);
RO3=RO1*(T2/T)^(-g/(a1*R)-1);
P6=P5*(RO3/RO1).^0.7; %power depend on density variation with altitude
Th7=(E*P6)/V;%thrust at sea level for max continous
display(Th7)
%% Plot Thrust VS Velocity At Sea Level For Max Continous
V1=(10:5:500);
Th8=(E*P6)./V1;
figure
plot(V1,Th8)
title('Thrust At Sea Level For Max Continous');
xlabel('Velocity');
ylabel('Thrust');
hold on
plot(V,Th7,'r*')
%% Thrust VS Velocity At Sea Level For Max Cruise For Standard Air Condition & 15 degree more than it
P3=2*1379544.76243;%power in max cruise
Th9=(E*P3)/V;%thrust at sea level for max cruise in satandard air condition
display(Th9)
%% Plot Thrust VS Velocity At Sea Level For Max Cruise For Standard Air Condition & 15 degree more than it
V1=(10:5:500);
Th10=(E*P3)./V1;
figure
plot(V1,Th10)
title('Thrust At Sea Level For Max Cruise For Standard Air condition & 15 degree more than it');
xlabel('Velocity');
ylabel('Thrust');
hold on
plot(V,Th9,'r*')