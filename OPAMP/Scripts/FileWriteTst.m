%Testing the larger temperature gain test

%filename = './TempGainP.csv';

%R = readmatrix(filename);
%T = readtable(filename);
%Tb=readtable('TempGainNN.matlab','FileType','text');

%Test Read non-Anomalous csv files for reference when doing mae and mse
TR1 = readtable('ParamTransientACN.csv');
TR2 = readtable('ParamTransientACNN.csv');
TR3 = readtable('ParamTransientACNNN.csv');

%load('TableNon_AnomalousReferences.mat');

%{
Desc = T.Properties.VariableDescriptions;
header = Desc{1,1};

initv = 1;
%get the x values for the signal
signalXval = T{:,initv};

endv = 300;
for index = initv:2:endv
    %get the y values for the signal
    signalYval = T{:,index+1};
    RMS = rms(signalYval);
    disp(['RMS ', num2str(RMS)])

end
%}


%header = split(header);
%disp(header);
%Vin = split(header{2,1},'=');
%display(Vin);
%plot(R);
%X = T.x_out0_temp__58_5906_X;
%Y = T.x_out0_temp__58_5906_Y;
%plot(X,Y);