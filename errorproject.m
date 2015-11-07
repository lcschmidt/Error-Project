% ASEN 5090 Error Models - Error Project HW 7
%
% CORS data files from: http://www.ngs.noaa.gov/UFCORS/
% 
% pr1 
% f1
% f2
% phi1
% lambda1
% phi2
% lambda2

% ASEN 5090 HW6: Expected Range
% Author: Tiffany Finley

% Steps:
% Determined filename for October 7, 2015, using Sidera:
% 
% Downloading GPS broadcast file from: ftp://cddis.gsfc.nasa.gov/gps/data/daily/2015/280/15n/
% File name: brdc2800.15n.Z

% Broadcast ephemeris filename: brdc2800.15n
% Ran read_GPSbroadcast.p to turn into a matrix of ephem_all
% 
clear all;
ephem_all = read_GPSbroadcast('brdc3020.15n');

% gps week = 1865m TOW = 262920, at 01:02:00 10/7/2015.
%  t_input      - GPS times to calculate values at                 [WN TOW] (nx2)
%  prn          - PRN to compute values for (one satellite only)    

% need usersite in ECEF
% NAD_83 (2011) POSITION (EPOCH 2010.0)                                       |
% | Transformed from IGS08 (epoch 2005.0) position in Aug 2012.                 |
% |     X =   1333553.827 m     latitude    =  40 42 03.81683 N                 |
% |     Y =  -4655045.323 m     longitude   = 074 00 51.54905 W                 |
% |     Z =   4137302.552 m     ellipsoid height =  -14.452   m                 |
%    0.050      (antenna height)    +40.70106901 (latitude)    -74.01432229 (longitude)     -015.704      (elevation) 

timeinsecs1 = 259200 + 16*60*60;   % GPS time ... GPS - UTC = 17 sec
tr1 = [1868 timeinsecs1];
timeinsecs2 = 345600 + 16*60*60;   % GPS time
tr2 = [1868 timeinsecs2];
timeinsecs3 = 432000 + 16*60*60;   % GPS time
tr3 = [1868 timeinsecs3];

PRN = 8; % AMC2: 7 23 27, NYBP: 9 23 27
[health,x,v,relcorr,satClkCorr] = broadcast2xv(ephem_all,tr3,PRN)
%usersite = [-1248596.2520 -4819428.2840 3976506.0340];  % m, Schriever, WGS-84
usersite = [1333553.827 -4655045.323 4137302.552]; % m, NYBP
[ range0, range1 ] = compute_range( ephem_all, PRN, tr3, usersite )
% 
% [lat_gd, lon, ellip_h] = convertrtolatlon(usersite);
% sitelatitude = lat_gd*180/pi   % NYBP: sitelatitude = 40.701060228759
% sitelongitude = lon*180/pi     % NYBP: sitelongitude = -74.0143191781472

% Site is Schriever Air Force Base in Colorado Springs, CO, maybe the
% Master Control Segment 2SOPS building

% Repeat for PRN 23 and 27

% [ range0(2), range1(2) ] = compute_range( ephem_all, 23, tr1, usersite )
% [ range0(3), range1(3) ] = compute_range( ephem_all, 27, tr1, usersite )

rinexv3 = read_rinex_obs5('nybp3020.15o', [2 5 6 10 12], 7200);  % Oct 28
%rinexv3 = read_rinex_obs5('nybp3010.15o', [9 23 27], 7200);  % Oct 28
%rinexv3 = read_rinex_obs5('amc23030.15o', [7 23 27], 7200);  % Oct 28
%rows = find(rinexv3.data(:,2)==timeinsecs3);
%     11    L1    L2    L5    C1    P1    C2    P2    C5    S1# / TYPES OF OBSERV
%           S2    S5                                          # / TYPES OF OBSERV
%    WEEK: 1     TOW: 2     PRN: 3      L1: 4      L2: 5     L5: 6
%      C1: 7      P1: 8      C2: 9      P2: 10      S1: 12      S2: 13



