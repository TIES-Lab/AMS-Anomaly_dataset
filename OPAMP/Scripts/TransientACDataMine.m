%Ian Kintz 5-9-23 UTD TxACE, TIES Lab
%This script is used to calculate the slope, RMS, variance, slope, MAE, and MSE of AC
%transient signals that have be collected via candence virtuoso. Signals
%are in the csv format with a single signal being xy format. Subsequent
%signals are in collumns to the right. 1, 2, and 3 stage signals have the 
% following dimensions 151x300,600,900



%use a function at the top to input the file to be operated on.
function TransientACDataMine(filename)
    
    %filename = 'ParamTransientACNA.csv';

    %use readtable to get the values in the csv file
    T = readtable(filename);
    %has the unmodified file headers
    Desc = T.Properties.VariableDescriptions;
    
    %open output file
    fileout = ['Features', filename];
    fid = fopen(fileout, 'w') ;
    fprintf(fid, '%s\n', fileout);

    %get x value for the signal (same for all traces)
    signalXval = T{:,1};

    %Load the Non Anomalous Data Values from .m file for use in MSE, MAE
    %calculations
    load('TableNon_AnomalousReferences.mat', 'TR1', 'TR2', 'TR3');

    %loop through each signal and calculate the slope, RMS,
    %varriance for each
    initv = 1;
    endv = width(T);

    stages = width(T) / 300;
    
    fprintf(fid, '%s\n', 'Stage 1 Output');
    fprintf(fid, '%s\n', 'Signal, RMS, Variance, Slope, MAE, MSE');
    for index = initv:2:endv

        %get the y values for the current signal
        signalYval = T{:,index+1};
        
        %get the y value for the refernce signal
        if(stages == 1)
            NonAnomalousYval = TR1{:,index+1};
        elseif(stages ==2)
            NonAnomalousYval = TR2{:,index+1};
        elseif(stages ==3)
           NonAnomalousYval = TR3{:,index+1};
        end

        %use polyfit function to calculate slope for current section
        b = polyfit(signalXval, signalYval, 1);
        slope = b(1);
        
        %Calculate variance
        variance = var(signalYval);
        
        %Calculate mean
        RMS = rms(signalYval);


        %both of these require knowing actual output. This is loaded from a
        %.mat file containing the N, NN, and NNN data values

        %Calculate Mean Absolute Error
        MAE = mae(NonAnomalousYval - signalYval);

        %Calculate Mean Square Error
        MSE = immse(signalYval, NonAnomalousYval);
        
        %find the signal header
        header = Desc{1,index+1};

        %disp(['Feature ', num2str(index), ': Mean ', num2str(Mean), ...
        %' Variance ', num2str(variance), ' Slope ', num2str(slope)]);
        fprintf(fid, '%s,%d,%d,%d,%d,%d\n', header, RMS, variance, slope, MAE, MSE); 
        if(index == 299 && width(T) > 300)
            fprintf(fid, '%s\n', 'Stage 2 Output');
        elseif(index == 599 && width(T)> 600)
            fprintf(fid, '%s\n', 'Stage 3 Output');
        end
    end
    fclose(fid);
end