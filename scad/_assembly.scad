
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
wingMainNACA_V(20,167,-128, 90,10,180, length=160,chord=60);
wingHolderSingle(0,206,-140,  180,180,180, length=120);

wingMainNACA_V(20,-245,-128, 90,10,180, length=160,chord=60);
wingHolderSingle(0,-206,-140,  180,180,180, length=120);

//back wing
floatSupportWing(-380,0,-10);
floatSupportWing(-380,0,-10, 0,0,180);
floatSupportConnector_L(-390,200,-15, -90,0,-90);
floatSupportConnector_L(-370,-200,-15, -90,0,90);
wingMainNACA_V(-360,177,-132,rx=90, rz=180, isAdhesion=false, length =100);
wingHolderSingle(-380,202,-135,isAdhesion=false);
wingMainNACA_V(-360,-227,-132,rx=90, rz=180, isAdhesion=false, length =100);
wingHolderSingle(-380,-202,-135,isAdhesion=false);


fuselage_engine_support(-200,0,-15);
fuselage_front(-200,0,-10);
fuselage_back(-310,0,-10);
fuselage_front_top(-200,0,50, 180,0,0);

//fuselage_front(-200,0,0);
//fuselage_back(-300,0,0);
//engine wing
engine2212_wing(-200,-5,110 );
engine2212_wing(-200,5,110, my=1);
engine2212_mount(-200,-5,110,isMetal=true);
engine2212_mount(-200,5,110,isMetal=true, my=1);
