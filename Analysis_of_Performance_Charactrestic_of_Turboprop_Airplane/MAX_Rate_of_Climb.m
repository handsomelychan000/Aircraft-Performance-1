%% Estimation of MAX Rate of Climb
clc
clear all
%% Variables
global P
global RO
RO_ss=1.225;%density at sea level
T_ss=288.16;%temperature at sea level
R=287;%universall const of air
S=56.36;%area of the wings
e=-2.5*(pi/180);%angle fo engine
P_ss=0.75*2*1864249.67;%power of both engine in max cruise
g=9.81;%gravity const
W0=21000*g;%initial weight of air plane
a1=-6.5*10^(-3);%slope in Troposphere
%% Rate of climb max VS altitude for flap=0
    h=(0:100:12000);
    CD0=0.032;
    k=0.034;
    T=T_ss+a1*h;
    RO=RO_ss.*(T/T_ss).^(-g/(a1*R)-1);
    P=P_ss.*(RO/RO_ss).^0.7;
    V_RC=sqrt((2./RO).*sqrt(k/(3*CD0))*(W0/S));
    ROC=(P-0.5.*RO.*(V_RC.^3)*S*CD0-(2*k*W0^2)./(RO.*V_RC*S))/W0;
    plot(h,ROC);
    title('Rate Of Climb Max VS Altitude For Flap=0')
    xlabel('Altitude');
    ylabel('Rate of climb Max');
    T1=T_ss+a1*0;
    RO1=RO_ss.*(T1/T_ss).^(-g/(a1*R)-1);
    P1=P_ss.*(RO1/RO_ss).^0.7;
    V_RC1=sqrt((2./RO1).*sqrt(k/(3*CD0))*(W0/S));
    ROC1=(P1-0.5.*RO1.*(V_RC1.^3)*S*CD0-(2*k*W0^2)./(RO1.*V_RC1*S))/W0;
    ROC1_MAX=double(ROC1(1));
    display('For Flap=0:')
    display(ROC1_MAX)
    %% Rate of climb max VS altitude for flap=10
    h=(0:100:12000);
    CD01=0.071;
    k1=0.031;
    T2=T_ss+a1*h;
    RO2=RO_ss.*(T2/T_ss).^(-g/(a1*R)-1);
    P2=P_ss.*(RO2/RO_ss).^0.7;
    V_RC2=sqrt((2./RO2).*sqrt(k1/(3*CD01))*(W0/S));
    ROC2=(P2-0.5.*RO2.*(V_RC2.^3)*S*CD01-(2*k1*W0^2)./(RO2.*V_RC2*S))/W0;
    figure
    plot(h,ROC2);
    title('Rate Of Climb Max VS Altitude For Flap=10')
    xlabel('Altitude');
    ylabel('Rate of climb Max');
    T3=T_ss+a1*0;
    RO3=RO_ss.*(T3/T_ss).^(-g/(a1*R)-1);
    P3=P_ss.*(RO3/RO_ss).^0.7;
    V_RC3=sqrt((2./RO3).*sqrt(k1/(3*CD01))*(W0/S));
    ROC3=(P3-0.5.*RO3.*(V_RC3.^3)*S*CD01-(2*k1*W0^2)./(RO3.*V_RC3*S))/W0;
    ROC2_MAX=double(ROC3(1));
    display('For Flap=10:')
    display(ROC2_MAX)