clear all, %close all

plotstyle={'b' 'r' 'g' 'm' 'c' 'k' 'y'};
stopTime=5376; % simulation time in h

%% Load the project and the model
project = sbioloadproject('Peripheral_Cholesterol_Model.sbproj');
model = project.m1; 

% configure settings
conf = getconfigset(model);
optionsObj  = get(conf, 'CompileOptions');
set(optionsObj, 'DimensionalAnalysis', false);
set(conf.SolverOptions, 'AbsoluteTolerance', 1.0E-6);
set(conf.SolverOptions, 'RelativeTolerance', 1.0e-8);  
%set(conf.SolverOptions, 'AbsoluteToleranceStepSize', 10);  
set(conf.SolverOptions, 'MaxStep', .1);  
set(conf, 'StopTime', stopTime);
set(conf.SolverOptions, 'OutputTimes', 0:stopTime)
set(conf, 'SolverType', 'ode15s')

%% Load VP to the model  
VPfile='SNL005_VP2.txt';
%VPfile='SNL005_VP2_stat10_150qm_base100.txt';
addPROT(VPfile, model);

%% Change parameter value
 tmp = sbioselect(model, 'Type', 'parameter', 'Name', 'MAb_dose_interval');
 set(tmp, 'value', 672);

%% PCSK9 baseline simulations
 tmp = sbioselect(model, 'Type','parameter', 'Name','MAb_dose_amount');
 set (tmp, 'value',300);

%% LDL-C baseline simulations
% tmp = sbioselect(model, 'Type','species','name','LDL_pl');
% set (tmp, 'InitialAmount',957);

%% variants 
%varObj=getvariant(model);

%% Simulation 
%simDataObj = sbiosimulate(model, conf, varObj([2,3]),dose);
simDataObj = sbiosimulate(model);

%% Get results
% t is time; x is data; n is a cell array of names
% [t,x,n] = selectbyname(simDataObj, 'Conc_PCSK9');



    convert_nmol_to_mmol = 1e-06;
    chol_per_VLDL_particle = 1750;
    chol_per_LDL_particle = 1750;
    chol_per_HDL_particle = 75;
    volume_pl = 2.75  ;
    convert_L_to_dL = 10;
    Chol_MW = 386.65;
    PCSK9_MW = 74286 ;
    MAb_MW = 146000;
    MAb_Vd = 6;
    convert_ng_to_mg = 1e-06;



%% Plot Simulation  
figure(1)
%subplot(2,2,1)
[t1,x1,n1] = selectbyname(simDataObj, 'Conc_LDL');hold on
plot(t1/24,x1,plotstyle{1}), hold on
xlabel('Time [days]')
ylabel('LDL [mg/dl]')
grid on
%%
figure(2)
%subplot(2,2,2)
[t2,x2,n2] = selectbyname(simDataObj, 'Conc_HDL');hold on
plot(t2/24,x2,plotstyle{1}), hold on
xlabel('Time [days]')
ylabel('HDL [mg/dl]')
grid on

% figure(3)
% %subplot(2,2,3)
% [t,x,n] = selectbyname(simDataObj, 'Conc_Chol_Tot');hold on
% plot(t/24,x,plotstyle{1}), hold on
% xlabel('Time [days]')
% ylabel('Total Cholesterol [mg/dl]')
% grid on

figure(3)
%subplot(2,2,4)
[t3,x3,n3] = selectbyname(simDataObj, 'Conc_VLDL');hold on
plot(t3/24,x3,plotstyle{1}), hold on
xlabel('Time [days]')
ylabel('VLDL [mg/dl]')
grid on


figure(4)
[t4,x4,n4] = selectbyname(simDataObj, 'MAb_sc');hold on
Conc_MAbsc =  MAb_MW*convert_ng_to_mg*x4'/(MAb_Vd*convert_L_to_dL);  
plot(t4/24,Conc_MAbsc,plotstyle{1}), hold on
xlabel('Time [days]')
ylabel('Subcutaneous MAb [mg/dl]')
grid on



% subplot(2,2,1)
% [t,x,n] = selectbyname(simDataObj, 'Conc_MAb_Tot');hold on
% plot(t/24,x,plotstyle{1}), hold on
% xlabel('Time [days]')
% ylabel('Total MAb [\mug/ml]')
% grid on

figure(5)
hold off
%subplot(2,2,2)
[t5,x5,n5] = selectbyname(simDataObj, 'Conc_MAb_Free');hold on
x5 = x5/convert_L_to_dL;
plot(t5/24,x5,plotstyle{1}), hold on
xlabel('Time [days]')
ylabel('MAb in plasma [mg/dl]')
grid on

figure(6)
%subplot(2,2,3)
[t6,x6,n6] = selectbyname(simDataObj, 'Conc_PCSK9');hold on
Conc_PCSK9_MW = convert_nmol_to_mmol*PCSK9_MW*x6/convert_L_to_dL; 
plot(t6/24,Conc_PCSK9_MW,plotstyle{1}), hold on
xlabel('Time [days]')
ylabel('PCSK9 [nM]')
grid on



%%%%%%%PLOT PROTEINS%%%%%%%%%%%%%%%
figure
[t7,x7,n7] = selectbyname(simDataObj, 'Conc_ApoA1');hold on
plot(t7/24,x7,plotstyle{1}), hold on
xlabel('Time [days]')
ylabel('ApoA1')

figure
[t8,x8,n8] = selectbyname(simDataObj, 'Conc_ApoB');hold on
plot(t8/24,x8,plotstyle{1}), hold on
xlabel('Time [days]')
ylabel('ApoB')

figure
[t9,x9,n9] = selectbyname(simDataObj, 'SREBP_nu_P');hold on
plot(t9/24,x9,plotstyle{1}), hold on
xlabel('Time [days]')
ylabel('Peripheral SREBP')


save ('Simbio_PeripheralCholModel.mat')