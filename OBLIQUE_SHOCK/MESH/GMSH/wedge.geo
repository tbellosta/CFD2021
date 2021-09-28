// WEDGE TRIANGULAR MESH

// GEOMETRY DEFINITION

h = 0.007;

// POINTS
Point(1) = {0, 0, 0, h};
Point(2) = {0.3, 0, 0, h};
Point(3) = {2, 0.2, 0, h};
Point(4) = {2, 1, 0, h};
Point(5) = {0, 1, 0, h};

// CURVE

Line(1) = {1, 2};
Line(2) = {2, 3};
Line(3) = {3, 4};
Line(4) = {4, 5};
Line(5) = {5, 1};

// LINE LOOPS

Line Loop(1) = {1, 2, 3, 4, 5};

// SURFACE

Plane Surface(10) = {1};

// MESH CONFIG

Physical Surface("VOLUME") = {10};
Physical Line("inlet") = {5};
Physical Line("outlet") = {3};
Physical Line("upper") = {4};
Physical Line("lower") = {1, 2};
