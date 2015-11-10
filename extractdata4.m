% Extracts pseudorange, SNR, and carrier phase data from RINEX files
% Name of file
% fname = 'nybp3010.15o';
% PRN_list = [2, 5, 6, 10, 12];
% 
% % use function to read in the observations for the PRNs of interest
% [ rinexv3 ] = read_rinex_obs5(fname, PRN_list);

format long
format compact
clear all;
close all;
% Extract the measured pseudoranges.
% snr_NN = signal to noise ratio (NN = PRN #)
% pr_CC_NN = pseudorange (CC = code)

load('nybp_1028.mat');

i = 1;
j = 1;
k = 1;
m = 1;
n = 1;
p = 1;
q = 1;

alldata = rinexv3_1028.data;
f1 = 1575.42*1e6;   % (Hz) L1 frequency
f2 = 1227.60*1e6;   % (Hz) L2 frequency
c = 2.99792458*1e8;  % (m/s) speed of light
lambda1 = c/f1;
lambda2 = c/f2;

while i <= length(alldata)
    if alldata(i,3) == 2
        j = k;
        prn_2_data(j,:) = alldata(i,:);
        timesecsprn2(j) = prn_2_data(j,2);
        mp1prn2(j) = prn_2_data(j,7) - ((f1^2 + f2^2)/(f1^2 - f2^2))*prn_2_data(j,4)*lambda1 + (2*f2^2/(f1^2 - f2^2))*prn_2_data(j,5)*lambda2;
        mp2prn2(j) = prn_2_data(j,10) - ((f2^2 + f1^2)/(f2^2 - f1^2))*prn_2_data(j,5)*lambda2 + (2*f1^2/(f2^2 - f1^2))*prn_2_data(j,4)*lambda1;
        k = k + 1;
    elseif alldata(i,3) == 5
        j = m;
        prn_5_data(j,:) = alldata(i,:);
        timesecsprn5(j) = prn_5_data(j,2);
        mp1prn5(j) = prn_5_data(j,7) - (((f1^2 + f2^2)/(f1^2 - f2^2))*prn_5_data(j,4)*lambda1) + (2*f2^2/(f1^2 - f2^2))*prn_5_data(j,5)*lambda2;
        mp2prn5(j) = prn_5_data(j,10) - (((f2^2 + f1^2)/(f2^2 - f1^2))*prn_5_data(j,5)*lambda2) + (2*f1^2/(f2^2 - f1^2))*prn_5_data(j,4)*lambda1;
        m = m + 1;
    elseif alldata(i,3) == 6
        j = n;
        prn_6_data(j,:) = alldata(i,:);
        timesecsprn6(j) = prn_6_data(j,2);
        mp1prn6(j) = prn_6_data(j,7) - (((f1^2 + f2^2)/(f1^2 - f2^2))*prn_6_data(j,4)*lambda1) + (2*f2^2/(f1^2 - f2^2))*prn_6_data(j,5)*lambda2;
        mp2prn6(j) = prn_6_data(j,10) - (((f2^2 + f1^2)/(f2^2 - f1^2))*prn_6_data(j,5)*lambda2) + (2*f1^2/(f2^2 - f1^2))*prn_6_data(j,4)*lambda1;
        n = n + 1;
    elseif alldata(i,3) == 10
        j = p;
        prn_10_data(j,:) = alldata(i,:);
        timesecsprn10(j) = prn_10_data(j,2);
        mp1prn10(j) = prn_10_data(j,7) - (((f1^2 + f2^2)/(f1^2 - f2^2))*prn_10_data(j,4)*lambda1) + (2*f2^2/(f1^2 - f2^2))*prn_10_data(j,5)*lambda2;
        mp2prn10(j) = prn_10_data(j,10) - (((f2^2 + f1^2)/(f2^2 - f1^2))*prn_10_data(j,5)*lambda2) + (2*f1^2/(f2^2 - f1^2))*prn_10_data(j,4)*lambda1;
        p = p + 1;
    elseif alldata(i,3) == 12
        j = q;
        prn_12_data(j,:) = alldata(i,:);
        timesecsprn12(j) = prn_12_data(j,2);
        mp1prn12(j) = prn_12_data(j,7) - (((f1^2 + f2^2)/(f1^2 - f2^2))*prn_12_data(j,4)*lambda1) + (2*f2^2/(f1^2 - f2^2))*prn_12_data(j,5)*lambda2;
        mp2prn12(j) = prn_12_data(j,10) - (((f2^2 + f1^2)/(f2^2 - f1^2))*prn_12_data(j,5)*lambda2) + (2*f1^2/(f2^2 - f1^2))*prn_12_data(j,4)*lambda1;
        q = q + 1;
    end
    i = i + 1;
end
% Plot pseudorange.
figure;
plot(timesecsprn2, prn_2_data(:,7)) % C1
xlabel('Time (minutes)')
ylabel('Pseudorange (m)')
title('Pseudorange from C/A Code, Oct. 28, 2015')

% Plot carrier phase data.
figure
plot(timesecsprn2, prn_2_data(:,4), timesecsprn2, mp2prn2 - mean(mp2prn2)) % L1 & L2
xlabel('Time (minutes)')
title('Carrier Phase Data for L1 & L2, Oct. 28, 2015')
legend('L1','L2')

% Plot SNR
prn_2_snr1 = prn_2_data(:,12);
prn_2_snr2 = prn_2_data(:,13);
figure 
plot(timesecsprn2, prn_2_snr1, timesecsprn2, prn_2_snr2)
title('SNR1 and SNR2 for PRN 2 on Oct. 28, 2015')
xlabel('Time of Day (minutes)')
ylabel('SNR (dB-Hz)')
legend('SNR1', 'SNR2')

% Plot MP1, MP2.
figure;
plot(timesecsprn2, mp1prn2 - mean(mp1prn2), timesecsprn2, mp2prn2 - mean(mp2prn2)) % Multipath1 for PRN2
xlabel('Hours from Midnight GPS Time')
ylabel('MP1, MP2 (m)')
title('Multipath for PRN2 - Oct. 28, 2015')
legend('MP1','MP2')


