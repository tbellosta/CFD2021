%% Thin airfoils unsteady aerodynamics
clear;

%% data
c = 1;              % chord length
b = c/2;            % half chord length
a = -1;             % distancd from half chord to rotation center
                    % adimensionalized by b
                    
V = 68.0594;        % freestream velocity
rho = 1.22498;      % freestream density

alpha1 = deg2rad(2); % pitching amplitude
omega = 68.0594;   % [rad/s] pitching frequency

alpha0 = 0;          % steady angle of attack

k = omega*b/V;       % reduced frequency

% time discretization
dt = 0.0001;
tt = 0:dt:10;

e = exp(1i*omega.*tt);
edot = 1i*omega*exp(1i*omega.*tt);
edotdot = -omega*omega*exp(1i*omega.*tt);

%% Theodorsen unsteady lift
CL = 2*pi*alpha0 + pi*b*(alpha1*edot/V - (b*a/V^2)*alpha1*edotdot) + ...
    2*pi*(alpha1*e + b*(0.5-a)/V * alpha1*edot)*theod(k);

%% Theodorsen correction to account fo finite thickness
%
%     Motta, Guardone, Quaranta "Influence of airfoil thickness on unsteady 
%     aerodynamic loads on pitching airfoils", Journal of Fluid Mechanics, 2015.
%

sm = 0.12;  % max thickness (percentage)

p1 = 1 - 2.09*sm + 25.73*sm^2 + 160.94*sm^3 - 735.68*sm^4; 
p2 = 1 + 3.93*sm - 64.71*sm^2 + 244.47*sm^3 - 280.08*sm^4;
p3 = 1 + 0.31*sm - 1.65*sm^2 + 24.26*sm^3 - 77.97*sm^4;
p4 = 1 + 4.17*sm - 68.51*sm^2 + 75.45*sm^3 + 269.26*sm^4;

CL_mod = 2*pi*alpha0 + pi*b*(p1*alpha1*edot/V - p2*(b*a/V^2)*alpha1*edotdot) + ...
    2*pi*(p3*alpha1*e + p4*b*(0.5-a)/V * alpha1*edot)*theod(k);

% plot analytic solution
figure;
alpha = rad2deg(alpha0 + alpha1*e);
plot(alpha,CL,'k',alpha,CL_mod,'r','linew',1.3);

%% numerical data
file = "../CFD/history.csv";

T = readtable(file);

dt = 9.231914044466431e-04;  % time step used in numerical simulation

tt = (T.Time_Iter)*dt;       % time discretization
aa = 2*(sin(omega*tt)); % angle of attack of nuerical data


hold on; box on; grid on;
tspp = 100;                                               % time steps per period
plot(aa(end-tspp:end),T.CL(end-tspp:end),'b','linew',1); % plot last period

% labels
tz=legend('Theodorsen','Motta et al.','SU2 Euler');
ty=ylabel('$C_{\ell}$');
tx=xlabel('$\alpha$');

% fig stuff
legend boxoff
tx.Interpreter='latex';
ty.Interpreter='latex';
tz.Interpreter='latex';
tz.Location='NorthWest';
set(gca,'TickLabelInterpreter', 'latex');
x0=10;
y0=10;
width=500;
height=400;
set(gcf,'position',[x0,y0,width,height])
ax = gca;
ax.FontSize = 18;

%% functions

function C = theod(k)
% Theodorsen response function
% k = reduced frequecy
C = besselh(1,2,k) ./ (besselh(1,2,k) + 1i.*besselh(0,2,k));
end
