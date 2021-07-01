%% Estimation of Stable-Time in 80% of MAX Cruise Phase
clc;
clear all;
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
P_ss=0.75*0.8*2*1379544.76;%power of both engine in max cruise
g=9.81;%gravity const
W0=21000*g;%initial weight of air plane
a1=-6.5*10^(-3);%slope in Troposphere
CD0=0.032;%zero lift drag
k=0.034;%iduced drag coef.
%% Functions
for h=0:1000:6000%altitude
    T=T_ss+a1*h;
    RO=RO_ss.*(T/T_ss).^(-g/(a1*R)-1);
    P=P_ss.*(RO/RO_ss).^0.7;
    V0=1.3*sqrt((2*W0)/(RO*S*Clm));
    [t,y] = ode45('plane',[0 1000],[V0 1 W0]);
    %% find V_Steady
    i=0;
    V_steady(h/1000+1)=0;
    t_steady(h/1000+1)=0;
    while (V_steady(h/1000+1)==0 && t_steady(h/1000+1)==0)
        i=i+1;
        deltav=y(i+1)-y(i);
        deltat=t(i+1)-t(i);
        if abs(deltav/deltat)<0.01
            V_steady(h/1000+1)=y(i);
            t_steady(h/1000+1)=t(i);
        end
    end
    hold on
    plot(t,y(:,1))
    hold off

end
    display(V_steady)
    display(t_steady)
    title('Velocity VS Time 80% MAX Cruise')
    xlabel('Time');
    ylabel('Velocity');
    legend('h0=0','h1=1000','h2=2000','h3=3000','h4=4000','h5=5000','h6=6000','Location','southeast')