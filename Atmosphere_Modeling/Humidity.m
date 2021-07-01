%% Humidity Variation
%% Variables
RO_SI=1.225;%density in SI
%% Functions In SI Units
ROuser=0;
X=input('PLEASE Enter The Humidity Ratio');
while X<0 || X>1
display('Humidity Ratio Must Be Between 0&1')
X=input('PLEASE Enter The Humidity Ratio');
end
RO=RO_SI*(1+X)/(1+1.609*X);
ROuser=RO;
display(RO)
%% plot
X1=(0:0.01:1);
RO1=RO_SI*(1+X1)./(1+1.609*X1);
plot(X1,RO1);
hold on
plot(X,ROuser,'r*','MarkerSize',10);
title('Humidity');
xlabel('Humidity Ratio');
ylabel('Density');