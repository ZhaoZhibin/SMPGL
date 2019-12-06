%% Demo1: 
% HomePages: https://zhaozhibin.github.io/
% Author   : Zhibin Zhao
% Place    : Xi'an Jiaotong University
% Email    : zhibinzhao1993@gmail.com
% Date     : 2019.12
clc
clear all
close all
addpath(genpath(fileparts(mfilename('fullpath'))));

rng('default')
rng(25);

%% Creat the simulation signal
Fs = 12800;
N = 16000;
% fault_1
NF1 = 12800;
F1 = 37;
Sig1 = CreatSimulation(NF1 , F1 , Fs);
% Sig1 = zeros(NF1,1);

% fault_2
NF2 = 9600;
F2 = 49;
Sig2 = CreatSimulation(NF2 , F2 , Fs);
% Sig2 = zeros(NF2 , 1);

% fault_3
NF3 = 6400;
F3 = 57;
Sig3 = CreatSimulation(NF3 , F3 , Fs);
% Fusion the signal
Sig1 = [zeros(N-NF1 , 1) ; Sig1];
Sig2 = [zeros(N-NF2 , 1) ; Sig2];
Sig3 = [zeros(N-NF3 , 1) ; Sig3];
t = (0 : N-1) / Fs;
Sigma = 0.5;
Sig_N = Sig1 + Sig2 + Sig3 + Sigma * randn(N ,1);

%% Set the parameters
% Fault1
K1 = 1;
N1 = 4;
N0 = round(Fs/F1) - N1;   % Fault1
M = 4;
B1 = binaryblock( K1 , N0 , N1 , M );
% Fault2
K1 = 1;
N1 = 4;
N0 = round(Fs/F2) - N1;   % Fault2
M = 4;
B2 = binaryblock( K1 , N0 , N1 , M );
% Fault3
K1 = 1;
N1 = 4;
N0 = round(Fs/F3) - N1;   % Fault3
M = 4;
B3 = binaryblock( K1 , N0 , N1 , M );

%% Perform the algorithm
[lambda, rho] = Selection_Pars(Sigma);
B = {B1, B2, B3};
Nit = 50;
mu = 2/3*0.9;
[x , cost1] = SMPGL(Sig_N , B, lambda , rho, mu, Nit);       
x_1 = x(:, 1);
x_2 = x(:, 2);
x_3 = x(:, 3);

%% Plot the results
figure(1)
subplot(311)
plot(t, Sig1, 'b')
hold on
plot(t, x_1, 'r')
title('Fault1')
ylabel('Amp (g)')
subplot(312)
plot(t, Sig2, 'b')
hold on
plot(t, x_2, 'r')
title('Fault2')
xlabel('Time (s)')
subplot(313)
plot(t, Sig3, 'b')
hold on
plot(t, x_3, 'r')
title('Fault3')
legend('Original','Extracted','Location','northwest','Orientation','horizontal')


filename = ['results', filesep, sprintf('Demo1_Extracted_Time.pdf')];
print(filename, '-dpdf');

% If you feel our SMPGL is useful for your research, please consider citing our paper:
% @article{zhao2019sparse,
%   title={Sparse Multiperiod Group Lasso for Bearing Multifault Diagnosis},
%   author={Zhao, Zhibin and Wang, Shibin and Sun, Chuang and Yan, Ruqiang and Chen, Xuefeng},
%   journal={IEEE Transactions on Instrumentation and Measurement},
%   year={2019},
%   publisher={IEEE}
% }