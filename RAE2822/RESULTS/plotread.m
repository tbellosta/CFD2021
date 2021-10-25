DATA = readtable('data.dat');
figure; hold on; box on; hold on;
plot(DATA.Var1,DATA.Var2,'dk');

SU2 = readtable('OGRID/CFD/coarse.csv');
x = SU2.Points_0;
y = -SU2.Pressure_Coefficient;
order = reorderPoints(x,y);
plot(x(order),y(order),'linew',1.5);

SU2 = readtable('CGRID/CFD/baseline.csv');
x = SU2.Points_0;
y = -SU2.Pressure_Coefficient;
order = reorderPoints(x,y);
plot(x(order),y(order),'linew',1.5);

SU2 = readtable('OGRID/CFD/fine.csv');
x = SU2.Points_0;
y = -SU2.Pressure_Coefficient;
order = reorderPoints(x,y);
plot(x(order),y(order),'linew',1.5);

tx = xlabel('$x$');
ty = ylabel('$C_P$');
tz = legend('DATA','coarse','baseline','fine');



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
grid on; box on;

