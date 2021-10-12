%% LOTW

% SU2
T = readtable("coarsesu2.csv");

Cf = T.Skin_Friction_Coefficient_0(1);
U  = T.Momentum_0(end)/T.Density(end);
uTau = sqrt(0.5*U*U*Cf);
ypVisc = logspace(-2,1,100);
ypLog = logspace(1,3,100);

u  = T.Momentum_0/T.Density;

up = u/uTau;
nu = T.Laminar_Viscosity/T.Density;
yp = uTau*T.Points_1./nu;


k = 0.41
C = 5;

visc = ypVisc;
ulog = (1/k)*log(ypLog) + C;



%% plot 

figure; grid on;

semilogx(ypVisc,visc,'k', ypLog, ulog, 'k', yp, up, '--k','linew',1.3);

% labels
% tz=legend('Blasius', 'SU2');
ty=ylabel('$u^+$');
tx=xlabel('$y^+$');

% fig stuff
% legend boxoff
tx.Interpreter='latex';
ty.Interpreter='latex';
% tz.Interpreter='latex';
% tz.Location='best';
set(gca,'TickLabelInterpreter', 'latex');
x0=10;
y0=10;
width=500;
height=400;
set(gcf,'position',[x0,y0,width,height])
ax = gca;
ax.FontSize = 18;
% xlim([1e-1 1e3]);
% ylim([0 30]);

