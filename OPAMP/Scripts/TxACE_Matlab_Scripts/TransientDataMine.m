%Ian Kintz 3-28-23 UTD TxACE, TIES Lab
%This script is used to calculate the slope, variance, and mean of DC
%transient signals that have be collected via candence virtuoso. Signals
%are in the csv format with a single signal being xy format. Subsequent
%signals are in collumns to the right


%use a function at the top to input the file to be operated on.
function TransientDataMine(filename)
    
    %use readtable to get the values in the csv file
    T = readtable(filename);
    %has the unmodified file headers
    Desc = T.Properties.VariableDescriptions;
    
    %open output file
    fileout = ['Features', filename];
    fid = fopen(fileout, 'w') ;
    fprintf(fid, '%s\n', fileout);
    
    %is the signal 1, 2, or 3 stage, 151x300,600,900
    stage = width(T)/300;

    %get x value for the signal (same for all traces)
    signalXval = T{:,1};

    %loop through the regions of interest and calculate the slope, mean,
    %varriance for each
    initv = 1;
    endv = width(T);
    
    fprintf(fid, '%s\n', 'Stage 1 Output');
    fprintf(fid, '%s\n', 'Signal, Mean, Variance, Slope');
    for index = initv:2:endv

        %get the y values for the current signal
        signalYval = T{:,index+1};

        %use polyfit function to calculate slope for current section
        b = polyfit(signalXval, signalYval, 1);
        slope = b(1);
        
        %Calculate varience
        variance = var(signalYval);
        
        %Calculate mean
        Mean = mean(signalYval);
        
        %find the signal header
        header = Desc{1,index+1};

        %disp(['Feature ', num2str(index), ': Mean ', num2str(Mean), ...
        %' Variance ', num2str(variance), ' Slope ', num2str(slope)]);
        fprintf(fid, '%s,%d,%d,%d\n', header, Mean, variance, slope); 
        if(index == 299 && width(T) > 300)
            fprintf(fid, '%s\n', 'Stage 2 Output');
        elseif(index == 599 && width(T)> 600)
            fprintf(fid, '%s\n', 'Stage 3 Output');
        end
    end
    fclose(fid);
end



