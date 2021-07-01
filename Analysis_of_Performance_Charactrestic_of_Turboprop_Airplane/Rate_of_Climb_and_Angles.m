%% Estimation of Rate of Climb and Related Angles
clc
clear all
%% Variables
global h
global P
global RO
RO_ss=1.225;%density at sea level
T_ss=288.16;%temperature at sea level
R=287;%universall const of air
Ct=400/3600;%fuel consumption
Clm=1.38;%maximum Cl
S=56.36;%area of the wings
e=-2.5*(pi/180);%angle fo engine
P_ss=0.75*2*1379544.76;%power of both engine in max cruise
g=9.81;%gravity const
W0=21000*g;%initial weight of air plane
a1=-6.5*10^(-3);%slope in Troposphere
CD0=0.032;%zero lift drag
k=0.034;%iduced drag coef.
%% Rate of Climb VS Horizontal Element Of Velocity For Flap=0
display('For Flap=0:')
for h=0:1000:7000%altitude
    CD0=0.032;%zero lift drag
    k=0.034;%iduced drag coef.
    V=(20:10:300);
    T=T_ss+a1*h;
    RO=RO_ss.*(T/T_ss).^(-g/(a1*R)-1);
    P=P_ss.*(RO/RO_ss).^0.7;
    ROC=(P-0.5.*RO.*(V.^3)*S*CD0-(2*k*W0^2)./(RO.*V*S))/W0;
    gama=asin(ROC./V);
    Vh=V.*cos(gama);
    hold on
    plot(Vh,ROC)
    axis([0 150 -2 6])
    MAX_GAMA=max(gama);
    s=max(ROC);
    d=find(ROC==s);
    GAMA_RCMAX=gama(d);
    display(MAX_GAMA)
    display(GAMA_RCMAX)
end
 title('Rate of Climb VS Horizontal Element Of Velocity For Flap=0')
    xlabel('Horizontal Element Of Velocity');
    ylabel('Rate of Climb');
    legend('h0=0','h1=1000','h2=2000','h3=3000','h4=4000','h5=5000','h6=6000','h7=7000','Location','northeast')
    %% Rate of Climb VS Horizontal Element Of Velocity For Flap=10
display('For Flap=10:')
figure
for h=0:1000:7000%altitude
    CD01=0.071;%zero lift drag
    k1=0.031;%iduced drag coef.
    V=(20:10:300);
    T=T_ss+a1*h;
    RO=RO_ss.*(T/T_ss).^(-g/(a1*R)-1);
    P=P_ss.*(RO/RO_ss).^0.7;
    ROC1=(P-0.5.*RO.*(V.^3)*S*CD01-(2*k1*W0^2)./(RO.*V*S))/W0;
    gama1=asin(ROC1./V);
    Vh1=V.*cos(gama1);
    hold on
    plot(Vh1,ROC1)
    axis([0 150 -2 6])
    MAX_GAMA1=max(gama1);
    s1=max(ROC1);
    d1=find(ROC1==s1);
    GAMA_RCMAX1=gama1(d1);
    display(MAX_GAMA1)
    display(GAMA_RCMAX1)
end
 title('Rate of Climb VS Horizontal Element Of Velocity For Flap=10')
    xlabel('Horizontal Element Of Velocity');
    ylabel('Rate of Climb');
    legend('h0=0','h1=1000','h2=2000','h3=3000','h4=4000','h5=5000','h6=6000','h7=7000','Location','northeast')
    