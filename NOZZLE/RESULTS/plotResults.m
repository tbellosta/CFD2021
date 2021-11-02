% read data
figure; hold on; box on;
coarse = readtable('../EULER/CFD/coarsest.csv');
x = coarse.Points_0;
y = coarse.Mach;
plot(x,y,'linew',1.5);

medium = readtable('../EULER/CFD/medium.csv');
x = medium.Points_0;
y = medium.Mach;
plot(x,y,'linew',1.5);

fine = readtable('../EULER/CFD/fine.csv');
x = fine.Points_0;
y = fine.Mach;
plot(x,y,'linew',1.5);

tx = xlabel('$x$');
ty = ylabel('$Mach$');
tz = legend('coarse','baseline','fine');



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
ax.FontSize = 22;
ylim([0 1.7]);
xlim([min(x) max(x)]);
grid on; box on;