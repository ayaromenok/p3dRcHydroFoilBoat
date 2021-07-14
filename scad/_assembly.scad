include <hydrofoil.scad>
include <floatsHiSpeed_v2.scad>


wingMainNACA_V(40,75,-114, 90,10,180);
wingHolderSingle(20,100,-122.5,  180,180,180, length=120);

wingMainNACA_V(40,-125,-114, 90,10,180);
wingHolderSingle(20,-100,-122.5,  180,180,180, length=120);

floatHiSpeed_v2_assmebly(0,0,39.5, 0,0,-90);

