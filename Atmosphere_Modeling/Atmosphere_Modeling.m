%% Atmosephere Modeling
%% Variables
P_SI=1.01325*10^5;%pressure in SI 
RO_SI=1.225;%density in SI
T_SI=288.16;%temperature in SI
g_SI=9.81;%garvity const in SI
R_SI=287;
P_EN=2116.2;%pressure in English Unit
RO_EN=0.0023769;%density in English Unit
T_EN=518.69;%temperature in English Unit
g_EN=32.174;%garvity const in English Unit
R_EN=1716;
y=1.4;
%% Functions In SI Units
mod=input('1ForSI 2ForEN');
h=input('PLEASE Enter The Altitude');
if mod==1
    a1=-6.5*10^(-3);%slope in Troposphere
    a2=3*10^(-3);%slope in Stratosphere
    a3=-4.5*10^(-3);%slope in Mesosphere
    a4=4*10^(-3);%slope in Thermosphere
    Tuser=0;
    Puser=0;
    ROuser=0;
    Auser=0;
    T2=T_SI+a1*(11000-0);
    P2=P_SI*(T2/T_SI)^(-g_SI/(R_SI*a1));
    RO2=RO_SI*(T2/T_SI)^(-g_SI/(a1*R_SI)-1);
    T3=T2;
    T5=T3;
    P5=P2*exp(((-g_SI)/(R_SI*T3))*(25000-11000));
    RO5=RO2*exp(((-g_SI)/(R_SI*T3))*(25000-11000));
    T8=T5+a2*(47000-25000);
    P8=P5*(T8/T5).^(-g_SI/(R_SI*a2));
    T9=T8;
    RO8=RO5*(T8/T5).^(-g_SI/(a2*R_SI)-1);
    T11=T9;
    P11=P8*exp(((-g_SI)/(R_SI*T11))*(53000-47000));
    RO11=RO8*exp(((-g_SI)/(R_SI*T11))*(53000-47000));
    T14=T11+a3*(79000-53000);
    T15=T14;
    P14=P11*(T14/T11).^(-g_SI/(R_SI*a3));
    RO14=RO11*(T14/T11).^(-g_SI/(a3*R_SI)-1);
    T17=T15;
    P17=P14*exp(((-g_SI)/(R_SI*T15))*(96000-79000));
    RO17=RO14*exp(((-g_SI)/(R_SI*T15))*(96000-79000));
     if h>=0 && h<=11000
        T=T_SI+a1*(h-0);
        P=P_SI*(T/T_SI)^(-g_SI/(R_SI*a1));
        RO=RO_SI*(T/T_SI)^(-g_SI/(a1*R_SI)-1);
        A=sqrt(y*R_SI*T);
        Tuser=T;
        Puser=P;
        ROuser=RO;
        Auser=A;
        display(T)
        display(P)
        display(RO)
        display(A)
        
    end
    if h>11000 && h<=25000
        
        P3=P2*exp(((-g_SI)/(R_SI*T3))*(h-11000));
        RO3=RO2*exp(((-g_SI)/(R_SI*T3))*(h-11000));
        A3=sqrt(y*R_SI*T3);
        Tuser=T3;
        Puser=P3;
        ROuser=RO3;
        Auser=A3;
        display(T3)
        display(P3)
        display(RO3)
        display(A3)
    end
    if h>25000 && h<=47000
        T6=T5+a2*(h-25000);
        P6=P5*(T6/T5).^(-g_SI/(R_SI*a2));
        RO6=RO5*(T6/T5).^(-g_SI/(a2*R_SI)-1);
        A6=sqrt(y*R_SI*T6);
        Tuser=T6;
        Puser=P6;
        ROuser=RO6;
        Auser=A6;
        display(T6)
        display(P6)
        display(RO6)
        display(A6)
    end
    if h>47000 && h<=53000
        
        P9=P8*exp(((-g_SI)/(R_SI*T9))*(h-47000));
        RO9=RO8*exp(((-g_SI)/(R_SI*T9))*(h-47000));
        A9=sqrt(y*R_SI*T9);
        Tuser=T9;
        Puser=P9;
        ROuser=RO9;
        Auser=A9;
        display(T9)
        display(P9)
        display(RO9)
        display(A9)
    end
    if h>53000 && h<=79000
        T12=T11+a3*(h-53000);
        P12=P11*(T12/T11).^(-g_SI/(R_SI*a3));
        RO12=RO11*(T12/T11).^(-g_SI/(a3*R_SI)-1);
        A12=sqrt(y*R_SI*T12);
        Tuser=T12;
        Puser=P12;
        ROuser=RO12;
        Auser=A12;
        display(T12)
        display(P12)
        display(RO12)
        display(A12)
    end
    if h>79000 && h<=96000
        
        P15=P14*exp(((-g_SI)/(R_SI*T15))*(h-79000));
        RO15=RO14*exp(((-g_SI)/(R_SI*T15))*(h-79000));
        A15=sqrt(y*R_SI*T15);
        Tuser=T15;
        Puser=P15;
        ROuser=RO15;
        Auser=A15;
        display(T15)
        display(P15)
        display(RO15)
        display(A15)
    end
    if h>96000 && h<=100000
        T18=T17+a4*(h-96000);
        P18=P17*(T18/T17).^(-g_SI/(R_SI*a4));
        RO18=RO17*(T18/T17).^(-g_SI/(a4*R_SI)-1);
        A18=sqrt(y*R_SI*T18);
        Tuser=T18;
        Puser=P18;
        ROuser=RO18;
        Auser=A18;
        display(T18)
        display(P18)
        display(RO18)
        display(A18)
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
        P1=P_SI*(T1/T_SI).^(-g_SI/(R_SI*a1));
        RO1=RO_SI*(T1/T_SI).^(-g_SI/(a1*R_SI)-1);
        A1=sqrt(y*R_SI*T1);
        T4=T2+H1*0;
        P4=P2*exp(((-g_SI)/(R_SI*T2))*(H1-11000));
        RO4=RO2*exp(((-g_SI)/(R_SI*T2))*(H1-11000));
        A4=sqrt(y*R_SI*T4);
        T7=T5+a2*(H2-25000);
        P7=P5*(T7/T5).^(-g_SI/(R_SI*a2));
        RO7=RO5*(T7/T5).^(-g_SI/(a2*R_SI)-1);
        A7=sqrt(y*R_SI*T7);
        T10=T8+H3*0;
        P10=P8*exp(((-g_SI)/(R_SI*T8))*(H3-47000));
        RO10=RO8*exp(((-g_SI)/(R_SI*T8))*(H3-47000));
        A10=sqrt(y*R_SI*T10);
        T13=T11+a3*(H4-53000);
        P13=P11*(T13/T11).^(-g_SI/(R_SI*a3));
        RO13=RO11*(T13/T11).^(-g_SI/(a3*R_SI)-1);
        A13=sqrt(y*R_SI*T13);
        T16=T14+H5*0;
        P16=P14*exp(((-g_SI)/(R_SI*T15))*(H5-79000));
        RO16=RO14*exp(((-g_SI)/(R_SI*T15))*(H5-79000));
        A16=sqrt(y*R_SI*T16);
        T19=T17+a4*(H6-96000);
        P19=P17*(T19/T17).^(-g_SI/(R_SI*a4));
        RO19=RO17*(T19/T17).^(-g_SI/(a4*R_SI)-1);
        A19=sqrt(y*R_SI*T19);
        figure,plot(H,T1);
        hold on;
        plot(H1,T4,'b');
        plot(H2,T7,'b');
        plot(H3,T10,'b');
        plot(H4,T13,'b');
        plot(H5,T16,'b');
        plot(H6,T19,'b');
        plot(h,Tuser,'r*','MarkerSize',10);
        hold off;
        title('Tempreature');
        xlabel('Altitude');
        ylabel('Temprature');
        figure,plot(H,P1);
        hold on;
        plot(H1,P4,'b');
        plot(H2,P7,'b');
        plot(H3,P10,'b');
        plot(H4,P13,'b');
        plot(H5,P16,'b');
        plot(H6,P19,'b');
        plot(h,Puser,'r*','MarkerSize',10);
        hold off;
        title('Pressure');
        xlabel('Altitude');
        ylabel('Pressure');
        figure,plot(H,RO1);
        hold on;
        plot(H1,RO4,'b');
        plot(H2,RO7,'b');
        plot(H3,RO10,'b');
        plot(H4,RO13,'b');
        plot(H5,RO16,'b');
        plot(H6,RO19,'b');
        plot(h,ROuser,'r*','MarkerSize',10);
        hold off;
        title('Density');
        xlabel('Altitude');
        ylabel('Density');
        figure,plot(H,A1);
        hold on;
        plot(H1,A4,'b');
        plot(H2,A7,'b');
        plot(H3,A10,'b');
        plot(H4,A13,'b');
        plot(H5,A16,'b');
        plot(H6,A19,'b');
        plot(h,Auser,'r*','MarkerSize',10);
        hold off;
        title('Speed Of Sound');
        xlabel('Altitude');
        ylabel('Speed Of Sound');
end
%% Functions In English Units
if mod==2
    a1=-3.5*10^(-3);
    a2=1.62*10^(-3);%slope in Stratosphere
    a3=-2.43*10^(-3);%slope in Mesosphere
    a4=2.16*10^(-3);%slope in Thermosphere

    T2=T_EN+a1*(36089.23-0);
    P2=P_EN*(T2/T_EN)^(-g_EN/(R_EN*a1));
    RO2=RO_EN*(T2/T_EN)^(-g_EN/(a1*R_EN)-1);
    T3=T2;
    T5=T3;
    P5=P2*exp(((-g_EN)/(R_EN*T3))*(82020.99-36089.23));
    RO5=RO2*exp(((-g_EN)/(R_EN*T3))*(82020.99-36089.23));
    T8=T5+a2*(154199.47-82020.99);
    P8=P5*(T8/T5).^(-g_EN/(R_EN*a2));
    RO8=RO5*(T8/T5).^(-g_EN/(a2*R_EN)-1);
    T9=T8;
    T11=T9;
    P11=P8*exp(((-g_EN)/(R_EN*T11))*(173884.51-154199.47));
    RO11=RO8*exp(((-g_EN)/(R_EN*T11))*(173884.51-154199.47));
    T14=T11+a3*(259186.35-173884.51);
    P14=P11*(T14/T11).^(-g_EN/(R_EN*a3));
    RO14=RO11*(T14/T11).^(-g_EN/(a3*R_EN)-1);
    T15=T14;
    T17=T15;
    P17=P14*exp(((-g_EN)/(R_EN*T15))*(314960.62-259186.35));
    RO17=RO14*exp(((-g_EN)/(R_EN*T15))*(314960.62-259186.35));
    Tuser=0;
    Puser=0;
    ROuser=0;
    Auser=0;
    if h>=0 && h<=36089.23
        T=T_EN+a1*(h-0);
        P=P_EN*(T/T_EN)^(-g_EN/(R_EN*a1));
        RO=RO_EN*(T/T_EN)^(-g_EN/(a1*R_EN)-1);
        A=sqrt(y*R_EN*T);
        Tuser=T;
        Puser=P;
        ROuser=RO;
        Auser=A;
        display(T)
        display(P)
        display(RO)
        display(A)
        
    end
    if h>36089.23 && h<=82020.99
        
        P3=P2*exp(((-g_EN)/(R_EN*T3))*(h-36089.23));
        RO3=RO2*exp(((-g_EN)/(R_EN*T3))*(h-36089.23));
        A3=sqrt(y*R_EN*T3);
        Tuser=T3;
        Puser=P3;
        ROuser=RO3;
        Auser=A3;
        display(T3)
        display(P3)
        display(RO3)
        display(A3)
    end
    if h>82020.99 && h<=154199.47
        
        T6=T5+a2*(h-82020.99);
        P6=P5*(T6/T5).^(-g_EN/(R_EN*a2));
        RO6=RO5*(T6/T5).^(-g_EN/(a2*R_EN)-1);
        A6=sqrt(y*R_EN*T6);
        Tuser=T6;
        Puser=P6;
        ROuser=RO6;
        Auser=A6;
        display(T6)
        display(P6)
        display(RO6)
        display(A6)
    end
    if h>154199.47 && h<=173884.51
       
        P9=P8*exp(((-g_EN)/(R_EN*T9))*(h-154199.47));
        RO9=RO8*exp(((-g_EN)/(R_EN*T9))*(h-154199.47));
        A9=sqrt(y*R_EN*T9);
        Tuser=T9;
        Puser=P9;
        ROuser=RO9;
        Auser=A9;
        display(T9)
        display(P9)
        display(RO9)
        display(A9)
    end
    if h>173884.51 && h<=259186.35
       
        T12=T11+a3*(h-173884.51);
        P12=P11*(T12/T11).^(-g_EN/(R_EN*a3));
        RO12=RO11*(T12/T11).^(-g_EN/(a3*R_EN)-1);
        A12=sqrt(y*R_EN*T12);
        Tuser=T12;
        Puser=P12;
        ROuser=RO12;
        Auser=A12;
        display(T12)
        display(P12)
        display(RO12)
        display(A12)
    end
    if h>259186.35 && h<=314960.62
        
        P15=P14*exp(((-g_EN)/(R_EN*T15))*(h-259186.35));
        RO15=RO14*exp(((-g_EN)/(R_EN*T15))*(h-259186.35));
        A15=sqrt(y*R_EN*T15);
        Tuser=T15;
        Puser=P15;
        ROuser=RO15;
        Auser=A15;
        display(T15)
        display(P15)
        display(RO15)
        display(A15)
    end
    if h>314960.62 && h<=328083.98
        
        T18=T17+a4*(h-314960.62);
        P18=P17*(T18/T17).^(-g_EN/(R_EN*a4));
        RO18=RO17*(T18/T17).^(-g_EN/(a4*R_EN)-1);
        A18=sqrt(y*R_EN*T18);
        Tuser=T18;
        Puser=P18;
        ROuser=RO18;
        Auser=A18;
        display(T18)
        display(P18)
        display(RO18)
        display(A18)
    end
    %% plot
        H=(0:100:36089.23);
        H1=(36089.23:100:82020.99);
        H2=(82020.99:100:154199.47);
        H3=(154199.47:100:173884.51);
        H4=(173884.51:100:259186.35);
        H5=(259186.35:100:314960.62);
        H6=(314960.62:100:328083.98);
        
        T1=T_EN+a1*(H-0);
        P1=P_EN*(T1/T_EN).^(-g_EN/(R_EN*a1));
        RO1=RO_EN*(T1/T_EN).^(-g_EN/(a1*R_EN)-1);
        A1=sqrt(y*R_EN*T1);
        T4=T2+H1*0;
        P4=P2*exp(((-g_EN)/(R_EN*T2))*(H1-36089.23));
        RO4=RO2*exp(((-g_EN)/(R_EN*T2))*(H1-36089.23));
        A4=sqrt(y*R_EN*T4);
        T7=T5+a2*(H2-82020.99);
        P7=P5*(T7/T5).^(-g_EN/(R_EN*a2));
        RO7=RO5*(T7/T5).^(-g_EN/(a2*R_EN)-1);
        A7=sqrt(y*R_EN*T7);
        T10=T8+H3*0;
        P10=P8*exp(((-g_EN)/(R_EN*T8))*(H3-154199.47));
        RO10=RO8*exp(((-g_EN)/(R_EN*T8))*(H3-154199.47));
        A10=sqrt(y*R_EN*T10);
        T13=T11+a3*(H4-173884.51);
        P13=P11*(T13/T11).^(-g_EN/(R_EN*a3));
        RO13=RO11*(T13/T11).^(-g_EN/(a3*R_EN)-1);
        A13=sqrt(y*R_EN*T13);
        T16=T14+H5*0;
        P16=P14*exp(((-g_EN)/(R_EN*T15))*(H5-259186.35));
        RO16=RO14*exp(((-g_EN)/(R_EN*T15))*(H5-259186.35));
        A16=sqrt(y*R_EN*T16);
        T19=T17+a4*(H6-314960.62);
        P19=P17*(T19/T17).^(-g_EN/(R_EN*a4));
        RO19=RO17*(T19/T17).^(-g_EN/(a4*R_EN)-1);
        A19=sqrt(y*R_EN*T19);
        figure,plot(H,T1);
        hold on;
        plot(H1,T4,'b');
        plot(H2,T7,'b');
        plot(H3,T10,'b');
        plot(H4,T13,'b');
        plot(H5,T16,'b');
        plot(H6,T19,'b');
        plot(h,Tuser,'r*','MarkerSize',10);
        hold off;
        title('Tempreature');
        xlabel('Altitude');
        ylabel('Temprature');
        figure,plot(H,P1);
        hold on;
        plot(H1,P4,'b');
        plot(H2,P7,'b');
        plot(H3,P10,'b');
        plot(H4,P13,'b');
        plot(H5,P16,'b');
        plot(H6,P19,'b');
        plot(h,Puser,'r*','MarkerSize',10);
        hold off;
        title('Pressure');
        xlabel('Altitude');
        ylabel('Pressure');
        figure,plot(H,RO1);
        hold on;
        plot(H1,RO4,'b');
        plot(H2,RO7,'b');
        plot(H3,RO10,'b');
        plot(H4,RO13,'b');
        plot(H5,RO16,'b');
        plot(H6,RO19,'b');
        plot(h,ROuser,'r*','MarkerSize',10);
        hold off;
        title('Density');
        xlabel('Altitude');
        ylabel('Density');
        figure,plot(H,A1);
        hold on;
        plot(H1,A4,'b');
        plot(H2,A7,'b');
        plot(H3,A10,'b');
        plot(H4,A13,'b');
        plot(H5,A16,'b');
        plot(H6,A19,'b');
        plot(h,Auser,'r*','MarkerSize',10);
        hold off ;
        title('Speed Of Sound');
        xlabel('Altitude');
        ylabel('Speed Of Sound');
end


        
