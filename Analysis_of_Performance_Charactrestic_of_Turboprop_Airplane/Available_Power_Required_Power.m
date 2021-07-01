%% Ploting of Available Power And Required Power of Aircraft
clc
clear all
%% Variables
global P
global RO
global P2
global RO2
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
%% Power VS Velocity at sea level
    V=(10:10:200);
    T=T_ss+a1*0;
    RO=RO_ss.*(T/T_ss).^(-g/(a1*R)-1);
    P=P_ss.*(RO/RO_ss).^0.7+0*V;
    P_Req=0.5*RO*V.^3*S*CD0+(k*W0^2)./(0.5*S*RO.*V);
    plot(V,P);
    hold on
    plot(V,P_Req);
    hold off
    title('Power VS Velocity For Sea Level')
    xlabel('Velocity');
    ylabel('Power');
    legend('Power Available','Power Required','Location','northwest')
%% Power VS velocity at h=6000m
    V=(10:10:300);
    T2=T_ss+a1*6000;
    RO2=RO_ss.*(T2/T_ss).^(-g/(a1*R)-1);
    P2=P_ss.*(RO2/RO_ss).^0.7+0*V;
    P_Req2=0.5*RO2*V.^3*S*CD0+(k*W0^2)./(0.5*S*RO2.*V);
    figure
    plot(V,P2);
    hold on
    plot(V,P_Req2);
    hold off
        title('Power VS Velocity For h=6000m')
        xlabel('Velocity');
        ylabel('Power');
        legend('Power Available','Power Required','Location','northwest')
      %% Find Minimum And Maximum Velocity At Sea Level
      syms V1
      P1=P_ss.*(RO/RO_ss).^0.7+0*V1;
      P_Req1=0.5*RO*V1^3*S*CD0+(k*W0^2)/(0.5*S*RO*V1);
      eq1=P1-P_Req1;
      V_EX1=solve(eq1,V1);
      V_MIN1=double(V_EX1(1)); %minimum of velocity at sea level
      V_MAX1=double(V_EX1(2)); %maximum of velocity at sea level
      display('Min & MAx Velocity At Sea Level:')
      display(V_MIN1)
      display(V_MAX1)
      %% Find Minimum And Maximum Velocity At h=6000
      syms V2
      P3=P_ss.*(RO2/RO_ss).^0.7+0*V2;
      P_Req3=0.5*RO2*V2^3*S*CD0+(k*W0^2)/(0.5*S*RO2*V2);
      eq2=P3-P_Req3;
      V_EX2=solve(eq2,V2);
      V_MIN2=double(V_EX2(1)); %minimum of velocity at h=6000
      V_MAX2=double(V_EX2(2)); %maximum of velocity at h=6000
      display('Min & MAx Velocity At h=6000m:')
      display(V_MIN2)
      display(V_MAX2)