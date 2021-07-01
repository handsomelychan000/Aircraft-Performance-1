%% Airplane Speed
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
M=0.6;%Mach Number
y=1.4;
%% Functions In SI Units
        T_SIplus=T_SI+15;
        T_SIminus=T_SI-15;
        h=input('PLEASE Enter The Altitude');
     while h<0 || h>8000 
        display('The Altitude Must Be Between 0&8000')
        h=input('PLEASE Enter The Altitude');
     end
        T=T_SI+a1*(h-0);
        Tplus=T_SIplus+a1*(h-0);
        Tminus=T_SIminus+a1*(h-0);
        A=M*sqrt(y*R_SI*T);%in standard atmosphere
        Aplus=M*sqrt(y*R_SI*Tplus);%in satndard atmosphere + 15
        Aminus=M*sqrt(y*R_SI*Tminus);%in satndard atmosphere - 15
        display(T)
        display(Tplus)
        display(Tminus)
        display(A)
        display(Aplus)
        display(Aminus)
    %% plot
        H=(0:100:8000);
        
        T1=T_SI+a1*(H-0);
        T1plus=T_SIplus+a1*(H-0);
        T1minus=T_SIminus+a1*(H-0);
        A1=M*sqrt(y*R_SI*T1);
        A1plus=M*sqrt(y*R_SI*T1plus);
        A1minus=M*sqrt(y*R_SI*T1minus);
        
        figure,plot(H,T1);
        hold on;
        plot(H,T1plus,'-.g');
        plot(H,T1minus,'--r');
        hold off;
        title('Tempreature');
        xlabel('Altitude');
        ylabel('Temprature');
        legend('T1','T1plus','T1minus','Location','northeast')

        figure,plot(H,A1);
        hold on;
        plot(H,A1plus,'-.g');
        plot(H,A1minus,'--r');
        legend('A1','A1plus','A1minus','Location','northeast')
        hold off;
        title('Speed Of Airplane');
        xlabel('Altitude');
        ylabel('Speed Of Airplane');