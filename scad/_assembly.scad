
include <hydrofoil.scad>
include <floatsHiSpeed_v2.scad>
include <dual2212MotorMount.scad>
include <fuselage_v2.scad>
include <floatsSupport.scad>

floatHiSpeed_v2_assmebly(0,0,39.5, 0,0,-90);


//engine wing
fuselage_engine_support(0,0,-15);
engine2212_wing(0,-5,110 );
engine2212_wing(0,5,110, my=1);
engine2212_mount(0,-5,110,isMetal=true);
engine2212_mount(0,5,110,isMetal=true, my=1);

//front hydro-wing
//floatSupportWingFront(pz=-15.5);
//floatSupportWingFront(pz=-15.5,rz=180,mx=1);
floatSupport(20,-200,54,  0,0,-90);
floatSupport(20,200,54,  0,0,-90);
wingMainNACA_V(20,187,-128, 90,10,180, length=160,chord=60);
wingHolderSingle(0,226,-140,  180,180,180, length=120);

wingMainNACA_V(20,-265,-128, 90,10,180, length=160,chord=60);
wingHolderSingle(0,-226,-140,  180,180,180, length=120);

//back wing
wingHolderBack(-385, rx=180);
wingMainNACA_V(-400,-40,-129,rx=90,ry=10, rz=180, isAdhesion=false, length =160, chord=60);
wingHolderSingle(-425,0,-143,isAdhesion=false);

//wing level line
//yCube(600,10,10,    -200,0,-154);


fuselage_front_back_support(-200,0,2.5);
fuselage_front(-205,0,5);
fuselage_back(-315,0,5);
//fuselage_front_top(-200,0,50, 180,0,0);

