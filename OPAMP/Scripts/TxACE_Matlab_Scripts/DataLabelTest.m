%Ian Kintz 1-26-23 UTD TxACE, TIES Lab
%This script is used to calculate the slope, variance, and mean of a signal
%that has been labeled by ROI with the signal labeler application. Signals
%contain voltages over input voltage, temperature, and frequency. RMS
%replaces mean for AC signals


%load the signal labels
%load LabeledTest.mat;
%labelDefinitionsSummary(ls);

%open output file
fileout = ['Features', filename];
fid = fopen(fileout, 'w') ;
fprintf(fid, '%s\n', fileout);

beginval = 1;
endval = height(ls.Labels);
for sig = beginval:endval
    disp(['Signal ', num2str(sig), string(Headers(1,sig*2-1)), string(Headers(1,sig*2))]);
    fprintf(fid, '%s,%d,%s,%s\n', 'Signal', sig, string(Headers(1,sig*2-1)),string(Headers(1,sig*2)));

    %Select the signal
    signal = getSignal(ls,sig);     %sig
    
    %get the ROI labels for the individual signal
    points = ls.Labels.ROI{sig,1};  %sig
    poin = points{:,1};          
    
    %Calculate the difference between the regions of interest. This returns the
    %size of each region by the number of collumns in the region
    diff= poin(:,2) - poin(:,1);
    
    %Reshape the output as an array
    poi1 = reshape(diff, [1,height(diff)]);
    poi1(1,height(diff)) = poi1(1,height(diff))+1;
    
    %separate the signal by ROI
    sepsignal = mat2cell(signal,poi1, 2);
    
    %loop through the regions of interest and calculate the slope, mean,
    %varriance for each
    initv = 1;
    endv = width(poi1);
    if (filename(1:10) == "TransientA")
        fprintf(fid, '%s\n', 'Feature, RMS, Variance, Slope');
    else
        fprintf(fid, '%s\n', 'Feature, Mean, Variance, Slope');
    end

    for index = initv:endv
        %use polyfit function to calculate slope for current section
        signalYval = sepsignal{index,1}(:,2);
        signalXval = sepsignal{index,1}(:,1);
        b = polyfit(signalXval, signalYval, 1);
        slope = b(1);

        %plot signal for reference
         figure
         plot(signalXval,signalYval);
        
        %Calculate varience
        variance = var(signalYval);
        
        %Calculate mean
        
        Mean = mean(signalYval);

        %calculate RMS for AC signals and export in place of mean
        if (filename(1:10) == "TransientA")
            RMS = rms(signalYval);

            disp(['Feature ', num2str(index), ': RMS ', num2str(RMS), ...
            ' Variance ', num2str(variance), ' Slope ', num2str(slope)]);
            fprintf(fid, '%d,%d,%d,%d\n', index, RMS, variance, slope);

        else
            disp(['Feature ', num2str(index), ': Mean ', num2str(Mean), ...
            ' Variance ', num2str(variance), ' Slope ', num2str(slope)]);
            fprintf(fid, '%d,%d,%d,%d\n', index, Mean, variance, slope);
            RMS = [];
        end     
    end
end
fclose(fid);




