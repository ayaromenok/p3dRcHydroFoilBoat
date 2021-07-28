
include <hydrofoil.scad>
include <floatsHiSpeed_v2.scad>
include <dual2212MotorMount.scad>
include <fuselage_v2.scad>
include <floatsSupport.scad>

floatHiSpeed_v2_assmebly(0,0,39.5, 0,0,-90);
//float holder
floatHiSpeed_holder(0,0,-66, 0,90,90);
floatHiSpeed_holder(-300,0,-66, 0,90,90);
yCyl(2.5,330,   -150,0,-165,  0,90,0);

//engine wing
fuselage_engine_support(-200,0,-15);
engine2212_wing(-200,-5,110 );
engine2212_wing(-200,5,110, my=1);
engine2212_mount(-200,-5,110,isMetal=true);
engine2212_mount(-200,5,110,isMetal=true, my=1);


//front hydro-wing
floatSupportWingFront_v3(0,0,-20, mx=1);
floatSupportWingFront_v3(0,0,-20, rz=180, mx=0);
floatSupport(20,-200,53,  7,00,-90);
floatSupport(20,200,49,  7,0,-90);
wingMainNACA_multy_V_v2(7,-230,-164, 0,-7,0);
wingMainNACA_multy_V_v2(7,230,-164, 0,-7,0, 0,1,0);
//wingMainNACA_V(20,187,-133, 90,10,180, length=160,chord=60);
//wingHolderSingle(0,226,-145,  180,190,180, length=120);

//wingMainNACA_V(20,-265,-133, 90,10,180, length=160,chord=60);
//wingHolderSingle(0,-226,-145,  180,180,180, length=120);

//back hydro-wing
wingHolderBack(-385, rx=180);
wingMainNACA_V(-400,-40,-129,rx=90,ry=10, rz=180, isAdhesion=false, length =160, chord=60);
wingHolderSingle(-425,0,-143,isAdhesion=false);

//fuselage
//fuselage_front_back_support(-200,0,2.5);
fuselage_front(-200,0,-10);
fuselage_back(-310,0,-10);


