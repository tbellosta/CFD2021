%% BFS
clear;
%% experiment
% read and format experimental data

EXP = readtable("EXPERIMENTAL/U.csv");
EXP = EXP{:,:};

EXP1i = EXP(:,1)<4.5;
EXP1 = EXP(EXP1i,:);
[~,s] = sort(EXP1(:,2));
EXP1 = EXP1(s,:);


EXP2i = EXP(:,1)>4.5 & EXP(:,1)<6.92;
EXP2 = EXP(EXP2i,:);
[~,s] = sort(EXP2(:,2));
EXP2 = EXP2(s,:);


EXP3i = EXP(:,1)>6.92 & EXP(:,1)<8.9;
EXP3 = EXP(EXP3i,:);
[~,s] = sort(EXP3(:,2));
EXP3 = EXP3(s,:);


EXP4i = EXP(:,1)>8.9 & EXP(:,1)<11.9;
EXP4 = EXP(EXP4i,:);
[~,s] = sort(EXP4(:,2));
EXP4 = EXP4(s,:);


EXP5i = EXP(:,1)>11.9;
EXP5 = EXP(EXP5i,:);
[~,s] = sort(EXP5(:,2));
EXP5 = EXP5(s,:);


%% plot
% plot experimental data
figure;
subplot(2,1,1); p1=plot(EXP1(:,1),EXP1(:,2),'k','linew',1.5); hold on;
subplot(2,1,1); plot(EXP2(:,1),EXP2(:,2),'k','linew',1.5); hold on;
subplot(2,1,1); plot(EXP3(:,1),EXP3(:,2),'k','linew',1.5); hold on;
subplot(2,1,1); plot(EXP4(:,1),EXP4(:,2),'k','linew',1.5); hold on;
subplot(2,1,1); plot(EXP5(:,1),EXP5(:,2),'k','linew',1.5); hold on;

%% SU2

% variables
u0 = 10.5;
u_ini = 9.39;
h = 0.04;
H = 0.0267;

% read and plot SU2 data
T = readtable("FDS/two.csv");
T.Velocity_0 = T.Velocity_0 * u_ini;
T.Turb_Kin_Energy = T.Turb_Kin_Energy * u_ini^2;
v = 2;
subplot(2,1,1); p2=plot(2.*T.Velocity_0./(u0)+v,T.Points_1./H + 1,'b','linew',1.5); hold on;
subplot(2,1,1); plot([v,v],[0,2.5],'k','linew',0.5);
axis([-2,15,0,2.5]);
subplot(2,1,2); p4=plot(10.*(2/3 * T.Turb_Kin_Energy).^(1/4) ./(u0)+v,T.Points_1./H + 1,'b','linew',1.5); hold on;
subplot(2,1,2); plot([v,v],[0,2.5],'k','linew',0.5);
axis([-2,15,0,2.5]);

T = readtable("FDS/five.csv");
T.Velocity_0 = T.Velocity_0 * u_ini;
T.Turb_Kin_Energy = T.Turb_Kin_Energy * u_ini^2;
v = 5;
subplot(2,1,1); plot(2.*T.Velocity_0./(u0)+v,T.Points_1./H + 1,'b','linew',1.5); hold on;
subplot(2,1,1); plot([v,v],[0,2.5],'k','linew',0.5);
subplot(2,1,2); plot(10.*(2/3 * T.Turb_Kin_Energy).^(1/4) ./(u0)+v,T.Points_1./H + 1,'b','linew',1.5); hold on;
subplot(2,1,2); plot([v,v],[0,2.5],'k','linew',0.5);

T = readtable("FDS/seven.csv");
T.Velocity_0 = T.Velocity_0 * u_ini;
T.Turb_Kin_Energy = T.Turb_Kin_Energy * u_ini^2;
v = 7;
subplot(2,1,1); plot(2.*T.Velocity_0./(u0)+v,T.Points_1./H + 1,'b','linew',1.5); hold on;
subplot(2,1,1); plot([v,v],[0,2.5],'k','linew',0.5);
subplot(2,1,2); plot(10.*(2/3 * T.Turb_Kin_Energy).^(1/4) ./(u0)+v,T.Points_1./H + 1,'b','linew',1.5); hold on;
subplot(2,1,2); plot([v,v],[0,2.5],'k','linew',0.5);

T = readtable("FDS/nine.csv");
T.Velocity_0 = T.Velocity_0 * u_ini;
T.Turb_Kin_Energy = T.Turb_Kin_Energy * u_ini^2;
v = 9;
subplot(2,1,1); plot(2.*T.Velocity_0./(u0)+v,T.Points_1./H + 1,'b','linew',1.5); hold on;
subplot(2,1,1); plot([v,v],[0,2.5],'k','linew',0.5);
subplot(2,1,2); plot(10.*(2/3 * T.Turb_Kin_Energy).^(1/4) ./(u0)+v,T.Points_1./H + 1,'b','linew',1.5); hold on;
subplot(2,1,2); plot([v,v],[0,2.5],'k','linew',0.5);

T = readtable("FDS/twelve.csv");
T.Velocity_0 = T.Velocity_0 * u_ini;
T.Turb_Kin_Energy = T.Turb_Kin_Energy * u_ini^2;
v = 12;
subplot(2,1,1); plot(2.*T.Velocity_0./(u0)+v,T.Points_1./H + 1,'b','linew',1.5); hold on;
subplot(2,1,1); plot([v,v],[0,2.5],'k','linew',0.5);
subplot(2,1,2); plot(10.*(2/3 * T.Turb_Kin_Energy).^(1/4) ./(u0)+v,T.Points_1./H + 1,'b','linew',1.5); hold on;
subplot(2,1,2); plot([v,v],[0,2.5],'k','linew',0.5);

% plot domain
subplot(2,1,1); plot([-2 0],[1,1],'k','linew',2);
subplot(2,1,1); plot([0 0],[1,0],'k','linew',2);
subplot(2,1,1); plot([0 15],[0,0],'k','linew',2);
subplot(2,1,1); plot([15 15],[0,2.5],'k','linew',2);
subplot(2,1,1); plot([15 -2],[2.5,2.5],'k','linew',2);
subplot(2,1,1); plot([-2 -2],[2.5,1],'k','linew',2);
subplot(2,1,2); plot([-2 0],[1,1],'k','linew',2);
subplot(2,1,2); plot([0 0],[1,0],'k','linew',2);
subplot(2,1,2); plot([0 15],[0,0],'k','linew',2);
subplot(2,1,2); plot([15 15],[0,2.5],'k','linew',2);
subplot(2,1,2); plot([15 -2],[2.5,2.5],'k','linew',2);
subplot(2,1,2); plot([-2 -2],[2.5,1],'k','linew',2);



%% experimental data
% read u_rms
EXPk = readtable("EXPERIMENTAL/TKE.csv");
EXPk = EXPk{:,:};

%% plot
% plot experimental u_rms
EXP1i = find(EXPk(:,1)<4.5);
EXP1 = EXPk(EXP1i,:);
[~,s] = sort(EXP1(:,2));
EXP1 = EXP1(s,:);


EXP2i = find(EXPk(:,1)>4.5 & EXPk(:,1)<7);
EXP2 = EXPk(EXP2i,:);
[~,s] = sort(EXP2(:,2));
EXP2 = EXP2(s,:);


EXP3i = find(EXPk(:,1)>7 & EXPk(:,1)<8.9);
EXP3 = EXPk(EXP3i,:);
[~,s] = sort(EXP3(:,2));
EXP3 = EXP3(s,:);


EXP4i = find(EXPk(:,1)>8.9 & EXPk(:,1)<11.9);
EXP4 = EXPk(EXP4i,:);
[~,s] = sort(EXP4(:,2));
EXP4 = EXP4(s,:);


EXP5i = find(EXPk(:,1)>11.9);
EXP5 = EXPk(EXP5i,:);
[~,s] = sort(EXP5(:,2));
EXP5 = EXP5(s,:);


%% plot

% plot experimenlat u_rms
subplot(2,1,2); p3=plot(EXP1(:,1),EXP1(:,2),'k','linew',1.5); hold on;
subplot(2,1,2); plot(EXP2(:,1),EXP2(:,2),'k','linew',1.5); hold on;
subplot(2,1,2); plot(EXP3(:,1),EXP3(:,2),'k','linew',1.5); hold on;
subplot(2,1,2); plot(EXP4(:,1),EXP4(:,2),'k','linew',1.5); hold on;
subplot(2,1,2); plot(EXP5(:,1),EXP5(:,2),'k','linew',1.5); hold on;

% format plot
% u_mean
subplot(2,1,1); ty=ylabel('$y/H$'); tx=xlabel('$2u/U_0 + x/H$'); 
tx.Interpreter='latex'; ty.Interpreter='latex';
tz = legend([p1,p2],'Fessler \& Eaton','SU2'); tz.Interpreter='latex'; legend boxoff;
tz.Location='NorthWest';
set(gca,'TickLabelInterpreter', 'latex'); ax = gca; ax.FontSize = 15;

% u_rms
subplot(2,1,2); ty=ylabel('$y/H$'); tx=xlabel('$10u^\prime_{rms}/U_0 + x/H$'); 
tx.Interpreter='latex'; ty.Interpreter='latex';
set(gca,'TickLabelInterpreter', 'latex'); ax = gca; ax.FontSize = 15;
tz = legend([p3,p4],'Fessler \& Eaton','SU2'); tz.Interpreter='latex'; legend boxoff;
tz.Location='NorthWest';
