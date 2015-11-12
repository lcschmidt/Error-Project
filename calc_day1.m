% Calculates MP1 and MP2 for NYBP reference site on October 28, 2015.
format long
format compact

% Extract the measured pseudoranges.
% snr_NN = signal to noise ratio (NN = PRN #)
% pr_CC_NN = pseudorange (CC = code)

% Load rinexv3 data.
load('nybp_1028.mat');

i = 1;
j = 1;
k = 1;
l = 1;

alldata1 = rinexv3_1028.data;
f1 = 1575.42*1e6;   % (Hz) L1 frequency
f2 = 1227.60*1e6;   % (Hz) L2 frequency
c = 2.99792458*1e8;  % (m/s) speed of light
lambda1 = c/f1;
lambda2 = c/f2;

% Calculate multipath for October 28, 2015.
while i <= length(alldata1)
    if alldata1(i,3) == 5
        j = k;
        prn_5_data1(j,:) = alldata1(i,:);
        timesecsprn51(j) = (prn_5_data1(j,2)-259200)/3600;
        mp1prn51(j) = prn_5_data1(j,7) - (((f1^2 + f2^2)/(f1^2 - f2^2))*prn_5_data1(j,4)*lambda1) + (2*f2^2/(f1^2 - f2^2))*prn_5_data1(j,5)*lambda2;
        mp2prn51(j) = prn_5_data1(j,10) - (((f2^2 + f1^2)/(f2^2 - f1^2))*prn_5_data1(j,5)*lambda2) + (2*f1^2/(f2^2 - f1^2))*prn_5_data1(j,4)*lambda1;
        k = k + 1;
    elseif alldata1(i,3) == 6
        j = l;
        prn_6_data1(j,:) = alldata1(i,:);
        timesecsprn61(j) = (prn_6_data1(j,2)-259200)/3600;
        mp1prn61(j) = prn_6_data1(j,7) - (((f1^2 + f2^2)/(f1^2 - f2^2))*prn_6_data1(j,4)*lambda1) + (2*f2^2/(f1^2 - f2^2))*prn_6_data1(j,5)*lambda2;
        mp2prn61(j) = prn_6_data1(j,10) - (((f2^2 + f1^2)/(f2^2 - f1^2))*prn_6_data1(j,5)*lambda2) + (2*f1^2/(f2^2 - f1^2))*prn_6_data1(j,4)*lambda1;
        l = l + 1;
    end
    i = i + 1;
end

