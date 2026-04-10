close all
clear all
clc


M=1521; %kg Vehicle mass
f_r=0.015; % rolling resistance coefficient
g=9.81; %m/s^2 gravitational acceleration
rho=1.2; %kg^m3 air density
c_d=0.28; % drag coefficient
A_f=2.33; %m^2 frontal area
eta=0.93; % efficiency
R=0.5; % wheel radius
H=0; %km altitude (Road features) 
theta =0; % angle (Road features) 
c_h=1-0.085*H; %altitude factor 


L  = (0.5/M)*rho*c_d*c_h*A_f;
k  = (R*M)/eta;
N = eta/(R*M);



% FOR ROBUSTNESS, REDUCED 10% UNCERTAINITY IN OUR SYSTEM
% TO CALCULATE PERCENTAGE _ N - (N * P/100)
M_U1=1521 - (1521 * 10/100); %kg Vehicle mass
f_r_U1=0.015 - (0.015 * 10/100); % rolling resistance coefficient
c_d_U1=0.28 - (0.28 * 10/100); % drag coefficient
A_f_U1=2.33 - (2.33 * 10/100); %m^2 frontal area
eta_U1=0.93 - (0.93 * 10/100); % efficiency
R_U1=0.5 - (0.5 * 10/100); % wheel radius
rho=1.2; %kg^m3 air density
H=0; %km altitude (Road features)  
c_h=1-0.085*H; %altitude factor 

L_U1 = (0.5/M_U1)*rho*c_d_U1*c_h*A_f_U1;


A_ego=[0 1;0 0];
B_ego=[0; eta/(R*M)];



A_lead=[0 1;0 0];
B_lead=[0; eta/(R*M)];
C=[1 0 ; 0 1];
D=0;
