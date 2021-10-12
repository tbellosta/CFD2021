%% BLASIUS
solver = 'bvp4c';
bvpsolver = fcnchk(solver);

infinity = 3;
maxinfinity = 10;

% This constant guess satisfying the boundary conditions
% is good enough to get convergence when 'infinity' = 3.
solinit = bvpinit(linspace(0,infinity,5),[0 0 1]);
sol = bvpsolver(@blasius,@resBlasius,solinit);
eta = sol.x;
f = sol.y;

% Reference solution from T. Cebeci and H.B. Keller, Shooting and parallel
% shooting methods for solving the Falkner-Skan boundary-layer equation, J.
% Comp. Phy., 7 (1971) p. 289-300.

for Bnew = infinity+1:maxinfinity
   
   solinit = bvpxtend(sol,Bnew);   % Extend the solution to Bnew.
   sol = bvpsolver(@blasius,@resBlasius,solinit);
   eta = sol.x;
   f = sol.y;
   
   fprintf('Value computed using infinity = %g is %7.5f.\n',Bnew,f(3,1))
end

figure;
plot(f(2,:),eta);
title("Blasius profile")
ylabel('\eta')
xlabel("u/U")

%% SU2
T = readtable("coarsesu2.csv");

x = 0.15;                                        % position along plate
nu = T.Laminar_Viscosity(end)/T.Density(end);    % kinematic viscosity
U  = T.Momentum_0(end)/T.Density(end);           % external velocity
delta = sqrt(U/(nu*x));                          % approx BL thickness

u  = T.Momentum_0./T.Density;                    % velocity profile
etaCFD = T.Points_1*delta;                       % non-dim normal cooridnates (eta)

%% plot 

figure; hold on; box on; grid on;

plot(f(2,:),eta,'k', u/U, etaCFD, '--k','linew',1.3);
hold on;

% labels
tz=legend('Blasius', 'SU2');
ty=ylabel('$\eta$');
tx=xlabel('$u/U$');

% fig stuff
legend boxoff
tx.Interpreter='latex';
ty.Interpreter='latex';
tz.Interpreter='latex';
tz.Location='best';
set(gca,'TickLabelInterpreter', 'latex');
x0=10;
y0=10;
width=500;
height=400;
set(gcf,'position',[x0,y0,width,height])
ax = gca;
ax.FontSize = 18;
xlim([0 1.2]);
ylim([0 10]);


%% FUNCTIONS

function yp = blasius(t,y)
% BLASIUS

yp = y;

yp(1) = y(2);
yp(2) = y(3);
yp(3) = -0.5*y(1).*y(3);

end

function res = resBlasius(f0,finf)
res = [f0(1)
    f0(2)
    finf(2) - 1];
end
