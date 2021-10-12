// STRUCTURED MESH - BOUNDARY LAYER ON FLAT PLATE

h = 0.01;

X1=-0.06; 
X2= 0;
X3= 0.3048;
Y1= 0;
Y2= 0.03;


// POINTS
Point(1) = {X1, Y1, 0, h};
Point(2) = {X2, Y1, 0, h};
Point(3) = {X3, Y1, 0, h};
Point(4) = {X3, Y2, 0, h};
Point(5) = {X2, Y2, 0, h};
Point(6) = {X1, Y2, 0, h};

// Lines

Line(1) = {1,2};
Line(2) = {2,3};
Line(3) = {3,4};
Line(4) = {4,5};
Line(5) = {5,6};
Line(6) = {6,1};

// construction lines
Line(7) = {5,2};

// first block (symmetry)
Transfinite Line{1} = 60 Using Progression 0.95;
Transfinite Line{5} = 60 Using Progression 1/0.95;

Transfinite Line{7} = 64 Using Progression 0.9;
Transfinite Line{6} = 64 Using Progression 0.9;

// second block (flat plate)
Transfinite Line{2} = 100 Using Progression 1.05;
Transfinite Line{4} = 100 Using Progression 1/1.05;

Transfinite Line{3} = 64 Using Progression 1/0.9;

// Line Loop
Line Loop(1) = {1,-7,5,6};
Line Loop(2) = {2,3,4,7};

Plane Surface(1) = {1};
Plane Surface(2) = {2};

Transfinite Surface{1} = {1,2,5,6};
Recombine Surface{1};

Transfinite Surface{2} = {2,3,4,5};
Recombine Surface{2};

// MESH
Physical Surface("VOLUME") = {1,2};
Physical Line("wall") = {2};
Physical Line("symm") = {1};
Physical Line("inlet") = {6};
Physical Line("outlet") = {3,4,5}; 

