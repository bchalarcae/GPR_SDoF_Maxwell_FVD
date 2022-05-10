% Parametric Study and Prediction Models of the Seismic Response of
% Single-Degree-of-Freedom Systems equipped with Maxwell Material Fluid Viscous Dampers.
% Bryan Chalarca, Andre Filiatrault, Daniele Perrone.
% University School for Advanced Studies IUSS Pavia, Italy.
% January 2022

% Gaussian Process Regression models to predict the peak floor absolute acceleration (PFAA),
% peak floor absolute spectral acceleration (PFASA),
% peak relative velocity (PRV), and peak relative displacement (PRD),
% of SDoF system equipped with Maxwell material viscous dampers. The response parameters are predicted
% as a factor of such response parameter in the equivalent SDoF system without dampers.

%% Input parameters

load('N_MPFAA_model.mat');	% Load GPR Prediction model for peak floor absolute acceleration
load('N_MPFASA_model.mat');	% Load GPR Prediction model for peak floor absolute spectral acceleration
load('N_MPRD_model.mat');	% Load GPR Prediction model for peak relative displacement
load('N_MPRV_model.mat');	% Load GPR Prediction model for peak relative velocity

% Load the input data to get the prediction, each row is a data point, the
% columns represent the input variables and should follow an
% strict order: Period (s), Maxwell Stiffness as a fraction of the model
% stiffness (Kd/Kmod), Supplemental damping as % (e.g. 10), Seismic intensity as
% the ground spectral acceleration at 1 s in g (e.g. 0.6), velocity
% exponent of VD. [T Kd Damp Sa Alpha];

input=dlmread('input.txt'); 

%% This part does the prediction of the GPR.
% The output matrix is defined as
% [Predicted value, standard deviation, 95% of confidence level]
% The predict command follows (call GPR model, input points)

[p_npaa,sd_npaa,int_npaa] = predict(MPFAA.RegressionGP,input);
[p_npsa,sd_npsa,int_npsa] = predict(MPFASA.RegressionGP,input);
[p_nprd,sd_nprd,int_nprd] = predict(MPRD.RegressionGP,input);
[p_nprv,sd_nprv,int_nprv] = predict(MPRV.RegressionGP,input);


%% Figures

fh1=figure(1);

set(fh1,'color','white','Name','Predicted Seismic Response');

%% Graph PFAA

sh=subplot(2,2,1);

fill([(1:length(p_npaa))';flipud((1:length(p_npaa))')],[int_npaa(:,1);flipud(int_npaa(:,2))],[0.9 0.9 0.9]);
hold on
plot(1:length(p_npaa),p_npaa,'^k','MarkerEdgeColor','k','MarkerFaceColor','k','MarkerSize',10);
lgd=legend('95% Confidence Level','Predicted Values','Location','best');
legend('boxoff','FontSize',20,'FontName','Times New Roman')
set(sh,'Box','off','TickDir','out','FontSize',20,'FontName','Times New Roman');
xlabel('Observations');
ylabel('Norm. Peak Floor Abs. Accel.');

%% Graph PFASA

sh=subplot(2,2,2);

fill([(1:length(p_npsa))';flipud((1:length(p_npsa))')],[int_npsa(:,1);flipud(int_npsa(:,2))],[0.9 0.9 0.9]);
hold on
plot(1:length(p_npsa),p_npsa,'^k','MarkerEdgeColor','k','MarkerFaceColor','k','MarkerSize',10);
lgd=legend('95% Confidence Level','Predicted Values','Location','best');
legend('boxoff','FontSize',20,'FontName','Times New Roman')
set(sh,'Box','off','TickDir','out','FontSize',20,'FontName','Times New Roman');
xlabel('Observations');
ylabel('Norm. Peak Floor Spectral Accel.');

%% Graph PRV

sh=subplot(2,2,3);

fill([(1:length(p_nprv))';flipud((1:length(p_nprv))')],[int_nprv(:,1);flipud(int_nprv(:,2))],[0.9 0.9 0.9]);
hold on
plot(1:length(p_nprv),p_nprv,'^k','MarkerEdgeColor','k','MarkerFaceColor','k','MarkerSize',10);
lgd=legend('95% Confidence Level','Predicted Values','Location','best');
legend('boxoff','FontSize',20,'FontName','Times New Roman')
set(sh,'Box','off','TickDir','out','FontSize',20,'FontName','Times New Roman');
xlabel('Observations');
ylabel('Norm. Peak Relative Velocity');

%% Graph PRD

sh=subplot(2,2,4);

fill([(1:length(p_nprd))';flipud((1:length(p_nprd))')],[int_nprd(:,1);flipud(int_nprd(:,2))],[0.9 0.9 0.9]);
hold on
plot(1:length(p_nprd),p_nprd,'^k','MarkerEdgeColor','k','MarkerFaceColor','k','MarkerSize',10);
lgd=legend('95% Confidence Level','Predicted Values','Location','best');
legend('boxoff','FontSize',20,'FontName','Times New Roman')
set(sh,'Box','off','TickDir','out','FontSize',20,'FontName','Times New Roman');
xlabel('Observations');
ylabel('Norm. Peak Relative Displacement');
