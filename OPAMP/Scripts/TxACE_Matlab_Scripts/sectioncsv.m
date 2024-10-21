%Ian Kintz 1-31-23 UTD TxACE, TIES Lab
%This script is used to section csv files containing signals into 
%smaller single trace workspace variables. Results go to matlab workspace. 
%Signals contain voltages over input voltage, temperature, and frequency.
%The script focusses on Sectioning signals from Dual Stage amplifiers.

%Clear the space of all previous variables and plots
%close all;clear;clc;

%read the csv file that is given as function arguement and seperate traces
function [A,B,C,R,Headers, filename] = sectioncsv(filename)
    
    disp(['Sectioning csv file: ', string]);
    %read the csv file values into array R, then spilt by signal
    R = readmatrix(filename);
    A = R(:,1:2);
    B = R(:,3:4);
    
    %read headers from csv file using textscan function
    fileID = fopen(filename);

    %Signal cases for Dual Stage two signal input vs 3, vs 3 signal imaginary
    if(width(R)==4) %2 Signal(out1, out2) Form (x, y)
        C = 0;
        headers = textscan(fileID, '%[^,\n]%*c %[^,\n]%*c %[^,\n]%*c %[^,\n]%*c');
        Headers = [headers{1,1}(1,1) headers{1,2}(1,1) headers{1,3}(1,1) headers{1,4}(1,1)];
    elseif(width(R) == 6)%3 Signal(vin, out1, out2 Form (x, y)
        C = R(:,5:6);
        headers = textscan(fileID, '%[^,\n]%*c %[^,\n]%*c %[^,\n]%*c %[^,\n]%*c %[^,\n]%*c %[^,\n]%*c');
        Headers = [headers{1,1}(1,1) headers{1,2}(1,1) headers{1,3}(1,1) headers{1,4}(1,1) headers{1,5}(1,1) headers{1,6}(1,1)];
    else%3 Signal(vin, out1, out2) Form(x, yReal, yImag)
        %populate x axis columns
        A = R(:,1);
        B = R(:,4);
        C = R(:,7);

        %perform preprocessing to compute the magnitude of the signal given
        %yReal and yImag. Use mag = sqrt(yReal^2 + yImag^2)
        A(:,2) = sqrt(R(:,2).^2 + R(:,3).^2);
        B(:,2) = sqrt(R(:,5).^2 + R(:,6).^2);
        C(:,2) = sqrt(R(:,8).^2 + R(:,9).^2);

        headers = textscan(fileID, '%[^,\n]%*c %[^,\n]%*c %[^,\n]%*c %[^,\n]%*c %[^,\n]%*c %[^,\n]%*c %[^,\n]%*c %[^,\n]%*c %[^,\n]%*c');
        Headers = [headers{1,1}(1,1) headers{1,2}(1,1) headers{1,4}(1,1) headers{1,5}(1,1) headers{1,7}(1,1) headers{1,8}(1,1)];
    end

     fclose(fileID);


