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
theta=0; % angle (Road features) 
c_h=1-0.085*H; %altitude factor

A_ego=[0 1;0 0];
B_ego=[0; eta/(R*M)];


A_lead=[0 1;0 0];
B_lead=[0; eta/(R*M)];
C=[1 0 ; 0 1];
D=0;

L  =(0.5/M)*rho*c_d*c_h*A_f
k  =(R*M)/eta
N=eta/(R*M)