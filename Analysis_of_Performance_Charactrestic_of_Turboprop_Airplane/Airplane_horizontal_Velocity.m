%% Estimation of Airplane Horizontal Velocity
clc
clear all
%% Variables
global h
global P
global RO
RO_ss=1.225;%density at sea level
T_ss=288.16;%temperature at sea level
R=287;%universall const of air
S=56.36;%area of the wings
e=-2.5*(pi/180);%angle fo engine
P_ss=0.75*2*1379544.76;%power of both engine in max cruise
g=9.81;%gravity const
W0=21000*g;%initial weight of air plane
a1=-6.5*10^(-3);%slope in Troposphere
CD0=0.032;%zero lift drag
k=0.034;%iduced drag coef.
syms Th CL CD V
%% Functions
for h=0:1000:6000%altitude
    T=T_ss+a1*h;
    RO=RO_ss.*(T/T_ss).^(-g/(a1*R)-1);
    P=P_ss;%.*(RO/RO_ss).^0.7;
    eq1=Th-(P)/V;
    eq2=Th*cos(e)-0.5*RO*V^2*S*CD;
    eq3=Th*sin(e)+0.5*RO*V^2*S*CL-W0;
    eq4=CD-CD0-k*CL^2;
    answer=solve([eq1,eq2,eq3,eq4],[Th,CL,CD,V]);
    V1(h/1000+1)=double(answer.V(2));
    
end
    display(V1)