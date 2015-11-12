% Calculates MP1 and MP2 for NYBP reference site on October 30, 2015.
format long
format compact

% Extract the measured pseudoranges.
% snr_NN = signal to noise ratio (NN = PRN #)
% pr_CC_NN = pseudorange (CC = code)

% Load rinexv3 data.
load('nybp_1030.mat');

i = 1;
j = 1;
k = 1;
l = 1;

alldata3 = rinexv3_1030.data;
f1 = 1575.42*1e6;   % (Hz) L1 frequency
f2 = 1227.60*1e6;   % (Hz) L2 frequency
c = 2.99792458*1e8;  % (m/s) speed of light
lambda1 = c/f1;
lambda2 = c/f2;

% Calculate multipath for October 30, 2015.
while i <= length(alldata3)
    if alldata3(i,3) == 5
        j = k;
        prn_5_data3(j,:) = alldata3(i,:);
        timesecsprn53(j) = (prn_5_data3(j,2)-432000)/3600;
        mp1prn53(j) = prn_5_data3(j,7) - (((f1^2 + f2^2)/(f1^2 - f2^2))*prn_5_data3(j,4)*lambda1) + (2*f2^2/(f1^2 - f2^2))*prn_5_data3(j,5)*lambda2;
        mp2prn53(j) = prn_5_data3(j,10) - (((f2^2 + f1^2)/(f2^2 - f1^2))*prn_5_data3(j,5)*lambda2) + (2*f1^2/(f2^2 - f1^2))*prn_5_data3(j,4)*lambda1;
        k = k + 1;
    elseif alldata3(i,3) == 6
        j = l;
        prn_6_data3(j,:) = alldata3(i,:);
        timesecsprn63(j) = (prn_6_data3(j,2)-432000)/3600;
        mp1prn63(j) = prn_6_data3(j,7) - (((f1^2 + f2^2)/(f1^2 - f2^2))*prn_6_data3(j,4)*lambda1) + (2*f2^2/(f1^2 - f2^2))*prn_6_data3(j,5)*lambda2;
        mp2prn63(j) = prn_6_data3(j,10) - (((f2^2 + f1^2)/(f2^2 - f1^2))*prn_6_data3(j,5)*lambda2) + (2*f1^2/(f2^2 - f1^2))*prn_6_data3(j,4)*lambda1;
        l = l + 1;
    end
    i = i + 1;
end

