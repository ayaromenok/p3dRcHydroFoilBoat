include <hydrofoil.scad>
include <floatsHiSpeed_v2.scad>
include <dual2212MotorMount.scad>
include <fuselage.scad>


floatHiSpeed_v2_assmebly(0,0,39.5, 0,0,-90);

//front wing
wingMainNACA_V(40,75,-120, 90,10,180);
mirror([0,1,0])
wingHolderSingle(20,-100,-130,  180,180,180, length=120);

wingMainNACA_V(40,-125,-120, 90,10,180);
wingHolderSingle(20,-100,-130,  180,180,180, length=120);
wingChassis(35,0,0);

//back wing
wingMainNACA_V(-360,75,-120, 90,10,180);
mirror([0,1,0])
wingHolderSingle(-380,-100,-130,  180,180,180, length=120);

wingMainNACA_V(-360,-125,-120, 90,10,180);
wingHolderSingle(-380,-100,-130,  180,180,180, length=120);
wingChassis(-365,0,0);


fuselage_front(-200,0,0);
fuselage_back(-300,0,0);
//engine wing
engine2212_wing(-200,-5,85 );
engine2212_wing(-200,5,85, my=1);
engine2212_mount(-200,-5,85,isMetal=true);
engine2212_mount(-200,5,85,isMetal=true, my=1);
