%% Pressure, Density, and Tepmerature Ratio
%% Variables
P_SI=1.01325*10^5;%pressure in SI 
RO_SI=1.225;%density in SI
T_SI=288.16;%temperature in SI
g_SI=9.81;%garvity const in SI
R_SI=287;
a1=-6.5*10^(-3);%slope in Troposphere
a2=3*10^(-3);%slope in Stratosphere
a3=-4.5*10^(-3);%slope in Mesosphere
a4=4*10^(-3);%slope in Thermosphere
y=1.4;
%% Functions In SI Units
h=input('PLEASE Enter The Altitude');
    T2=T_SI+a1*(11000-0);
    T3=T2;
    T5=T3;
    T8=T5+a2*(47000-25000);
    T9=T8;
    T11=T9;
    T14=T11+a3*(79000-53000);
    T15=T14;
    T17=T15;
    theta2=(T_SI+a1*(11000-0))/T_SI;
    P2=P_SI*(T2/T_SI)^(-g_SI/(R_SI*a1));
    RO2=RO_SI*(T2/T_SI)^(-g_SI/(a1*R_SI)-1);
    theta3=theta2;
    theta5=theta3;
    P5=P2*exp(((-g_SI)/(R_SI*T3))*(25000-11000));
    RO5=RO2*exp(((-g_SI)/(R_SI*T3))*(25000-11000));
    theta8=(T5+a2*(47000-25000))/T_SI;
    P8=P5*(T8/T5).^(-g_SI/(R_SI*a2));
    theta9=theta8;
    RO8=RO5*(T8/T5).^(-g_SI/(a2*R_SI)-1);
    theta11=theta9;
    P11=P8*exp(((-g_SI)/(R_SI*T11))*(53000-47000));
    RO11=RO8*exp(((-g_SI)/(R_SI*T11))*(53000-47000));
    theta14=(T11+a3*(79000-53000))/T_SI;
    theta15=theta14;
    P14=P11*(T14/T11).^(-g_SI/(R_SI*a3));
    RO14=RO11*(T14/T11).^(-g_SI/(a3*R_SI)-1);
    theta17=theta15;
    P17=P14*exp(((-g_SI)/(R_SI*T15))*(96000-79000));
    RO17=RO14*exp(((-g_SI)/(R_SI*T15))*(96000-79000));
     if h>=0 && h<=11000
        T=T_SI+a1*(h-0);
        theta=(T_SI+a1*(h-0))/T_SI;
        delta=(P_SI*(T/T_SI)^(-g_SI/(R_SI*a1)))/P_SI;
        sigma=(RO_SI*(T/T_SI)^(-g_SI/(a1*R_SI)-1))/RO_SI;
        display(theta)
        display(delta)
        display(sigma)
        
    end
    if h>11000 && h<=25000
        delta3=(P2*exp(((-g_SI)/(R_SI*T3))*(h-11000)))/P_SI;
        sigma3=(RO2*exp(((-g_SI)/(R_SI*T3))*(h-11000)))/RO_SI;
        display(theta3)
        display(delta3)
        display(sigma3)
    end
    if h>25000 && h<=47000
        T6=T5+a2*(h-25000);
        theta6=theta5+(a2*(h-25000))/T_SI;
        delta6=(P5*(T6/T5).^(-g_SI/(R_SI*a2)))/P_SI;
        sigma6=(RO5*(T6/T5).^(-g_SI/(a2*R_SI)-1))/RO_SI;
        display(theta6)
        display(delta6)
        display(sigma6)
    end
    if h>47000 && h<=53000
        
        delta9=(P8*exp(((-g_SI)/(R_SI*T9))*(h-47000)))/P_SI;
        sigma9=(RO8*exp(((-g_SI)/(R_SI*T9))*(h-47000)))/RO_SI;
        display(theta9)
        display(delta9)
        display(sigma9)
    end
    if h>53000 && h<=79000
        T12=T11+a3*(h-53000);
        theta12=theta11(+a3*(h-53000))/T_SI;
        delta12=(P11*(T12/T11).^(-g_SI/(R_SI*a3)))/P_SI;
        sigma12=(RO11*(T12/T11).^(-g_SI/(a3*R_SI)-1))/RO_SI;
        display(theta12)
        display(delta12)
        display(sigma12)
    end
    if h>79000 && h<=96000
        
        delta15=(P4*exp(((-g_SI)/(R_SI*T15))*(h-79000)))/P_SI;
        sigma15=(RO14*exp(((-g_SI)/(R_SI*T15))*(h-79000)))/RO_SI;
        display(theta15)
        display(delta15)
        display(sigma15)
    end
    if h>96000 && h<=100000
        T18=T17+a4*(h-96000);
        theta18=theta17+(a4*(h-96000))/T_SI;
        delta18=(P17*(T18/T17).^(-g_SI/(R_SI*a4)))/P_SI;
        sigma18=(RO17*(T18/T17).^(-g_SI/(a4*R_SI)-1))/RO_SI;
        A18=sqrt(y*R_SI*T18);
        display(theta18)
        display(delta18)
        display(sigma18)
    end
    %% plot
        H=(0:100:11000);
        H1=(11000:100:25000);
        H2=(25000:100:47000);
        H3=(47000:100:53000);
        H4=(53000:100:79000);
        H5=(79000:100:96000);
        H6=(96000:100:100000);
        
        T1=T_SI+a1*(H-0);
        theta1=(T_SI+a1*(H-0))/T_SI;
        delta1=(P_SI*(T1/T_SI).^(-g_SI/(R_SI*a1)))/P_SI;
        sigma1=(RO_SI*(T1/T_SI).^(-g_SI/(a1*R_SI)-1))/RO_SI;
        
        T4=T2+H1*0;
        theta4=theta2+(H1*0)/T_SI;
        delta4=(P2*exp(((-g_SI)/(R_SI*T2))*(H1-11000)))/P_SI;
        sigma4=(RO2*exp(((-g_SI)/(R_SI*T2))*(H1-11000)))/RO_SI;
        
        T7=T5+a2*(H2-25000);
        theta7=theta5+(a2*(H2-25000))/T_SI;
        delta7=(P5*(T7/T5).^(-g_SI/(R_SI*a2)))/P_SI;
        sigma7=(RO5*(T7/T5).^(-g_SI/(a2*R_SI)-1))/RO_SI;
        
        T10=T8+H3*0;
        theta10=theta8+(H3*0)/T_SI;
        delta10=(P8*exp(((-g_SI)/(R_SI*T8))*(H3-47000)))/P_SI;
        sigma10=(RO8*exp(((-g_SI)/(R_SI*T8))*(H3-47000)))/RO_SI;
        
        T13=T11+a3*(H4-53000);
        theta13=theta11+(a3*(H4-53000))/T_SI;
        delta13=(P11*(T13/T11).^(-g_SI/(R_SI*a3)))/P_SI;
        sigma13=(RO11*(T13/T11).^(-g_SI/(a3*R_SI)-1))/RO_SI;
        
        T16=T14+H5*0;
        theta16=theta14+(H5*0)/T_SI;
        delta16=(P14*exp(((-g_SI)/(R_SI*T15))*(H5-79000)))/P_SI;
        sigma16=(RO14*exp(((-g_SI)/(R_SI*T15))*(H5-79000)))/RO_SI;
        
        T19=T17+a4*(H6-96000);
        theta19=theta17+(a4*(H6-96000))/T_SI;
        delta19=(P17*(T19/T17).^(-g_SI/(R_SI*a4)))/P_SI;
        sigma19=(RO17*(T19/T17).^(-g_SI/(a4*R_SI)-1))/RO_SI;
        
        figure,plot(H,theta1);
        hold on;
        plot(H1,theta4,'b');
        plot(H2,theta7,'b');
        plot(H3,theta10,'b');
        plot(H4,theta13,'b');
        plot(H5,theta16,'b');
        plot(H6,theta19,'b');
        hold off;
        title('theta');
        xlabel('Altitude');
        ylabel('theta');
        
        figure,plot(H,delta1);
        hold on;
        plot(H1,delta4,'b');
        plot(H2,delta7,'b');
        plot(H3,delta10,'b');
        plot(H4,delta13,'b');
        plot(H5,delta16,'b');
        plot(H6,delta19,'b');
        hold off;
        title('Delta');
        xlabel('Altitude');
        ylabel('Delta');
        
        figure,plot(H,sigma1);
        hold on;
        plot(H1,sigma4,'b');
        plot(H2,sigma7,'b');
        plot(H3,sigma10,'b');
        plot(H4,sigma13,'b');
        plot(H5,sigma16,'b');
        plot(H6,sigma19,'b');
        hold off;
        title('Sigma');
        xlabel('Altitude');
        ylabel('Sigma');
    