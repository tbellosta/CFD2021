// STRUCTURED MESH OF LAMINAR FLAT PLATE

h = 0.01;

// Points
Point(1) = {-0.33, 0, 0, h};
Point(2) = {0, 0, 0, h};
Point(3) = {2, 0, 0, h};
Point(4) = {2, 1, 0, h};
Point(5) = {0, 1, 0, h};
Point(6) = {-0.33, 1, 0, h};

// Lines
Line(1) = {1,2};
Line(2) = {2,3};
Line(3) = {3,4};
Line(4) = {4,5};
Line(5) = {5,6};
Line(6) = {6,1};

Line(7) = {5,2};

// Line loops
Line Loop(1) = {1,-7,5,6};
Line Loop(2) = {2,3,4,7};

// Surface
Plane Surface(1) = {1};
Plane Surface(2) = {2};

// Transfinite (structured meshing)
Transfinite Line{1} = 41 Using Progression 0.984609;
Transfinite Line{5} = 41 Using Progression 1/0.984609;
Transfinite Line{6} = 100 Using Progression 0.885;
Transfinite Line{7} = 100 Using Progression 0.885;

Transfinite Line{3} = 100 Using Progression 1/0.885;

Transfinite Line{2} = 151 Using Progression 1.00963;
Transfinite Line{4} = 151 Using Progression 1/1.00963;

Transfinite Surface{1} = {1,2,5,6};
Transfinite Surface{2};
Recombine Surface{1,2};

// MESH
Physical Surface("VOLUME") = {1,2};
Physical Line("inlet") = {6};
Physical Line("wall") = {2};
Physical Line("symmetry") = {1};
Physical Line("outlet") = {3,4,5};
