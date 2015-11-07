% Extracts pseudorange, SNR, and carrier phase data from RINEX files
% Name of file
% fname = 'nybp3010.15o';
% PRN_list = [2, 5, 6, 10, 12];
% 
% % use function to read in the observations for the PRNs of interest
% [ rinexv3 ] = read_rinex_obs5(fname, PRN_list);

format long g
format compact
clear all;
close all;
% Extract the measured pseudoranges.
% snr_NN = signal to noise ratio (NN = PRN #)
% pr_CC_NN = pseudorange (CC = code)
% carrier = carrier phase data
load('nybp_1028.mat');

i = 1;
j = 1;
k = 1;
m = 1;
n = 1;
p = 1;
q = 1;

alldata = rinexv3_1028.data;
f1 = 1575.42*1e6;
f2 = 1227.60*1e6;

while i <= length(alldata)
    if alldata(i,3) == 2
        j = k;
        prn_2_data(j,:) = alldata(i,:);
        timesecsprn2(j) = prn_2_data(j,2);
        mp1prn2(j) = prn_2_data(j,7) - (((f1^2 + f2^2)/(f1^2 - f2^2))*prn_2_data(j,4)) + (2*f2^2/(f1^2 - f2^2))*prn_2_data(j,5);
        mp2prn2(j) = prn_2_data(j,10) - (((f2^2 + f1^2)/(f2^2 - f1^2))*prn_2_data(j,5)) + (2*f1^2/(f2^2 - f1^2))*prn_2_data(j,4);
        k = k + 1;
    elseif alldata(i,3) == 5
        j = m;
        prn_5_data(j,:) = alldata(i,:);
        timesecsprn5(j) = prn_5_data(j,2);
        mp1prn5(j) = prn_5_data(j,7) - (((f1^2 + f2^2)/(f1^2 - f2^2))*prn_5_data(j,4)) + (2*f2^2/(f1^2 - f2^2))*prn_5_data(j,5);
        mp2prn5(j) = prn_5_data(j,10) - (((f2^2 + f1^2)/(f2^2 - f1^2))*prn_5_data(j,5)) + (2*f1^2/(f2^2 - f1^2))*prn_5_data(j,4);
        m = m + 1;
    elseif alldata(i,3) == 6
        j = n;
        prn_6_data(j,:) = alldata(i,:);
        timesecsprn6(j) = prn_6_data(j,2);
        mp1prn6(j) = prn_6_data(j,7) - (((f1^2 + f2^2)/(f1^2 - f2^2))*prn_6_data(j,4)) + (2*f2^2/(f1^2 - f2^2))*prn_6_data(j,5);
        mp2prn6(j) = prn_6_data(j,10) - (((f2^2 + f1^2)/(f2^2 - f1^2))*prn_6_data(j,5)) + (2*f1^2/(f2^2 - f1^2))*prn_6_data(j,4);
        n = n + 1;
    elseif alldata(i,3) == 10
        j = p;
        prn_10_data(j,:) = alldata(i,:);
        timesecsprn10(j) = prn_10_data(j,2);
        mp1prn10(j) = prn_10_data(j,7) - (((f1^2 + f2^2)/(f1^2 - f2^2))*prn_10_data(j,4)) + (2*f2^2/(f1^2 - f2^2))*prn_10_data(j,5);
        mp2prn10(j) = prn_10_data(j,10) - (((f2^2 + f1^2)/(f2^2 - f1^2))*prn_10_data(j,5)) + (2*f1^2/(f2^2 - f1^2))*prn_10_data(j,4);
        p = p + 1;
    elseif alldata(i,3) == 12
        j = q;
        prn_12_data(j,:) = alldata(i,:);
        timesecsprn12(j) = prn_12_data(j,2);
        mp1prn12(j) = prn_12_data(j,7) - (((f1^2 + f2^2)/(f1^2 - f2^2))*prn_12_data(j,4)) + (2*f2^2/(f1^2 - f2^2))*prn_12_data(j,5);
        mp2prn12(j) = prn_12_data(j,10) - (((f2^2 + f1^2)/(f2^2 - f1^2))*prn_12_data(j,5)) + (2*f1^2/(f2^2 - f1^2))*prn_12_data(j,4);
        q = q + 1;
    end
    i = i + 1;
end

plot(timesecsprn2, prn_2_data(:,4))
figure;
plot(timesecsprn2, prn_2_data(:,5))
figure;
plot(timesecsprn2, prn_2_data(:,7))
figure;
plot(timesecsprn2, mp1prn2 - mean(mp1prn2))
