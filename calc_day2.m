% Calculates MP1 and MP2 for NYBP reference site on October 29, 2015.
format long
format compact

% Extract the measured pseudoranges.
% snr_NN = signal to noise ratio (NN = PRN #)
% pr_CC_NN = pseudorange (CC = code)

% Load rinexv3 data.
load('nybp_1029.mat');

i = 1;
j = 1;
k = 1;
l = 1;

alldata2 = rinexv3_1029.data;
f1 = 1575.42*1e6;   % (Hz) L1 frequency
f2 = 1227.60*1e6;   % (Hz) L2 frequency
c = 2.99792458*1e8;  % (m/s) speed of light
lambda1 = c/f1;
lambda2 = c/f2;

% Calculate multipath for October 29, 2015.
while i <= length(alldata2)
    if alldata2(i,3) == 5
        j = k;
        prn_5_data2(j,:) = alldata2(i,:);
        timesecsprn52(j) = (prn_5_data2(j,2)-345600)/3600;
        mp1prn52(j) = prn_5_data2(j,7) - (((f1^2 + f2^2)/(f1^2 - f2^2))*prn_5_data2(j,4)*lambda1) + (2*f2^2/(f1^2 - f2^2))*prn_5_data2(j,5)*lambda2;
        mp2prn52(j) = prn_5_data2(j,10) - (((f2^2 + f1^2)/(f2^2 - f1^2))*prn_5_data2(j,5)*lambda2) + (2*f1^2/(f2^2 - f1^2))*prn_5_data2(j,4)*lambda1;
        k = k + 1;
    elseif alldata2(i,3) == 6
        j = l;
        prn_6_data2(j,:) = alldata2(i,:);
        timesecsprn62(j) = (prn_6_data2(j,2)-345600)/3600;
        mp1prn62(j) = prn_6_data2(j,7) - (((f1^2 + f2^2)/(f1^2 - f2^2))*prn_6_data2(j,4)*lambda1) + (2*f2^2/(f1^2 - f2^2))*prn_6_data2(j,5)*lambda2;
        mp2prn62(j) = prn_6_data2(j,10) - (((f2^2 + f1^2)/(f2^2 - f1^2))*prn_6_data2(j,5)*lambda2) + (2*f1^2/(f2^2 - f1^2))*prn_6_data2(j,4)*lambda1;
        l = l + 1;
    end
    i = i + 1;
end

