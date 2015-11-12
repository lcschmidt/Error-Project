% Plots MP1 and MP2 for NYBP reference site on October 28 - 30, 2015.
clear all
close all
% Calculate MP1 & MP2 for satellites for 
calc_day1
calc_day2
calc_day3

% % Plot pseudorange (day 1).
% figure
% plot(timesecsprn51, prn_5_data1(:,7)) % C1
% xlabel('Time of Day (GPST)')
% ylabel('Pseudorange (m)')
% title('PR of PRN 5 from C/A Code, Oct. 28, 2015')
% 
% % Plot carrier phase data (day1).
% figure
% plot(timesecsprn51, prn_5_data1(:,4), timesecsprn51, prn_5_data1(:,5)) % L1 & L2
% xlabel('Time of Day (GPST)')
% title('Carrier Phase for PRN 5, Oct. 28, 2015')
% legend('L1','L2')
% 
% % Plot SNR (day1)
% figure
% prn_5_snr11 = prn_5_data1(:,12);
% prn_5_snr21 = prn_5_data1(:,13);
% figure 
% plot(timesecsprn51, prn_5_snr11, timesecsprn51, prn_5_snr21)
% title('SNR1 and SNR2 for PRN 5 on Oct. 28, 2015')
% xlabel('Time of Day (GPST)')
% ylabel('SNR (dB-Hz)')
% legend('SNR1', 'SNR2')

% Plot MP1, MP2 for day 1 - October 28, 2015.
figure
plot(timesecsprn51, mp1prn51 - mean(mp1prn51), timesecsprn51, mp2prn51 - mean(mp2prn51)) % Multipath1 for PRN2
xlabel('Time of Day (GPST)')
ylabel('MP1, MP2 (m)')
title('Multipath for PRN5 - Oct. 28, 2015')
legend('MP1','MP2')

% % Plot pseudorange (day 2).
% figure
% plot(timesecsprn52, prn_5_data2(:,7)) % C1
% xlabel('Time of Day (GPST)')
% ylabel('Pseudorange (m)')
% title('PR of PRN 5 from C/A Code, Oct. 29, 2015')
% 
% % Plot carrier phase data (day2).
% figure
% plot(timesecsprn52, prn_5_data2(:,4), timesecsprn52, prn_5_data2(:,5)) % L1 & L2
% xlabel('Time of Day (GPST)')
% title('Carrier Phase for PRN 5, Oct. 29, 2015')
% legend('L1','L2')
% 
% % Plot SNR (day2)
% prn_5_snr12 = prn_5_data2(:,12);
% prn_5_snr22 = prn_5_data2(:,13);
% figure 
% plot(timesecsprn52, prn_5_snr12, timesecsprn52, prn_5_snr22)
% title('SNR1 and SNR2 for PRN 5 on Oct. 29, 2015')
% xlabel('Time of Day (GPST)')
% ylabel('SNR (dB-Hz)')
% legend('SNR1', 'SNR2')

% Plot MP1, MP2 for day 2 - October 29, 2015.
figure
plot(timesecsprn52, mp1prn52 - mean(mp1prn52), timesecsprn52, mp2prn52 - mean(mp2prn52)) % Multipath1 for PRN2
xlabel('Time of Day (GPST)')
ylabel('MP1, MP2 (m)')
title('Multipath for PRN5 - Oct. 29, 2015')
legend('MP1','MP2')

figure
plot(timesecsprn53, mp1prn53 - mean(mp1prn53), timesecsprn53, mp2prn53 - mean(mp2prn53)) % Multipath1 for PRN2
xlabel('Time of Day (GPST)')
ylabel('MP1, MP2 (m)')
title('Multipath for PRN5 - Oct. 30, 2015')
legend('MP1','MP2')

[acor5mp1d12,lag1] = xcorr(mp1prn51 - mean(mp1prn51), mp1prn52 - mean(mp1prn52));
[acor5mp2d12,lag2] = xcorr(mp2prn51 - mean(mp2prn51), mp2prn52 - mean(mp2prn52));
[acor5mp1d13,lag3] = xcorr(mp1prn51 - mean(mp1prn51), mp1prn53 - mean(mp1prn53));
[acor5mp2d13,lag4] = xcorr(mp2prn51 - mean(mp2prn51), mp2prn53 - mean(mp2prn53));

% Plot correlation of MP1s for Day 1 & Day 2 for PRN5
figure
plot(lag1, acor5mp1d12) 
xlabel('Lag')
ylabel('Correlation')
title('Cross correlation of MP1 Day1 & MP1 Day2 for PRN5')

figure
plot(lag3, acor5mp1d13) 
xlabel('Lag')
ylabel('Correlation')
title('Cross correlation of MP1 Day1 & MP1 Day3 for PRN5')

figure
plot(lag2, acor5mp2d12) 
xlabel('Lag')
ylabel('Correlation')
title('Cross correlation of MP2 Day1 & MP2 Day2 for PRN5')

figure
plot(lag4, acor5mp2d13) 
xlabel('Lag')
ylabel('Correlation')
title('Cross correlation of MP2 Day1 & MP2 Day3 for PRN5')