
include <hydrofoil.scad>
include <floatsHiSpeed_v2.scad>
include <dual2212MotorMount.scad>
include <fuselage_v2.scad>
include <floatsSupport.scad>

floatHiSpeed_v2_assmebly(0,0,39.5, 0,0,-90);

//front wing
floatSupportWingFront(pz=-15.5);
floatSupportWingFront(pz=-15.5,rz=180);
floatSupport(20,-180,54,  0,0,-90);
floatSupport(20,180,54,  0,0,-90);
//wingMainNACA_V(40,75,-120, 90,10,180);
//mirror([0,1,0])
//wingHolderSingle(20,-100,-130,  180,180,180, length=120);

//wingMainNACA_V(40,-125,-120, 90,10,180);
//wingHolderSingle(20,-100,-130,  180,180,180, length=120);
//wingChassis(35,0,0);

//back wing
//wingChassis(-365,0,0);
floatSupportWing(-380,0,-10);
floatSupportWing(-380,0,-10, 0,0,180);
//floatSupport(-360,-180,5,  0,0,-90);
//floatSupport(-360,180,5,  0,0,-90);




fuselage_engine_support(-200,0,-15);
fuselage_front(-200,0,-10);
fuselage_back(-310,0,-10);

//fuselage_front(-200,0,0);
//fuselage_back(-300,0,0);
//engine wing
engine2212_wing(-200,-5,110 );
engine2212_wing(-200,5,110, my=1);
engine2212_mount(-200,-5,110,isMetal=true);
engine2212_mount(-200,5,110,isMetal=true, my=1);
