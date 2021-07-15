include <../../lib/lib2.scad>
//include <../../lib/lib2/lib2_motor.scad>
//include <../../lib/lib2/lib2_prop.scad>
//include <../../lib/lib2/lib2_servo.scad>

//fuselage_front(ry=-90);
//fuselage_back(ry=90);
//fuselage_back(-100);

          
module fuselage_front(px=0,py=0,pz=0, rx=0,ry=0,rz=0, mx=0,my=0,mz=0, isMetal=false, isAdhesion=false){
    translate([(px), (py), pz])
    rotate([rx,ry,rz])
    mirror([mx,my,mz]){  
        //center/bottom
        difference(){
            difference(){
                yPoly(p=[[40,0],[50,30],[-50,30],[-40,0]],szz=120, px=0,py=0,pz=0, rx=90,ry=0, rz=90);
                yPoly(p=[[39,0],[49,30],[-49,30],[-39,0]],szz=122, px=-1,py=0,pz=3, rx=90,ry=0, rz=90);
            }//difference
            yCube(40,130,40, 135,0,20, 0,-17.5);
            //yCube(40,90,40, -13.3,0,20, 0,22.5);
            //connector to chassis
            for (i=[10:20:40]){
                yCyl(1.5,20,    i,10,0);
                yCyl(1.5,20,    i,-10,0);
            }//for
        }//difference
        
        //front
        difference(){
            translate([120,0,0])
            rotate([0,-35,0])
            difference(){
                yPoly(p=[[40,0],[50,30],[-50,30],[-40,0]],szz=60, px=0,py=0,pz=0, rx=90,ry=0, rz=90);
                yPoly(p=[[39,0],[49,30],[-49,30],[-39,0]],szz=62, px=-1,py=0,pz=1, rx=90,ry=0, rz=90);
            }//difference
            yCube(70,130,40, 137,0,50);
            yCube(40,130,40, 96,0,10, 0,-17.5);
        }//difference
        
        /*
        //back
        difference(){
            translate([-42.43,0,42.43])
            rotate([0,45,0])
            difference(){
                yPoly(p=[[30,0],[40,30],[-40,30],[-30,0]],szz=60, px=0,py=0,pz=0, rx=90,ry=0, rz=90);
                yPoly(p=[[29,0],[39,30],[-39,30],[-29,0]],szz=62, px=-1,py=0,pz=1, rx=90,ry=0, rz=90);
            }//difference
            yCube(70,90,40, -17,0,50);
            yCube(40,90,40, 25.8,0,10, 0,22.5);
            
        }//difference
        */
        //top
        translate([40,0,60])
        rotate([0,180,0])
        difference(){
            /*difference(){
                yPoly(p=[[40,0],[50,30],[-50,30],[-40,0]],szz=40, px=0,py=0,pz=0, rx=90,ry=0, rz=90);
                yPoly(p=[[39,0],[49,30],[-49,30],[-39,0]],szz=42, px=-1,py=0,pz=3, rx=90,ry=0, rz=90);
            }//difference*/
            yPoly(p=[[40,0],[50,30],[45,30],[35,5],[-35,5],[-45,30],[-50,30],[-40,0],],szz=40, px=0,py=0,pz=0, rx=90,ry=0, rz=90);
            //connector to wings/engines        
            for (i=[-30:20:30]){
                yCyl(0.8,20,    20,i,0);
                //yCyl(0.8,20,    50,i,0);
            }//for    
            //connector to chassis
            for (i=[10:20:40]){
                yCyl(5,20,    i,10,0);
                yCyl(5,20,    i,-10,0);
            }//for
        }//difference
        
        //battery holder
        battery_holder(70,18,0, 0,0,90);
        battery_holder(70,-22,0, 0,0,90);
        yCube(50,4,2,   25,20,9);
        yCube(50,4,2,   25,-20,9);
        yCube(4,4,8,   2,20,4.5);
        yCube(4,4,8,   2,-20,4.5);
        //nervure
        yPoly(p=[[40,0],[50,30],[45,30],[35,5],[-35,5],[-45,30],[-50,30],[-40,0],],szz=6, px=0,py=0,pz=0, rx=90,ry=0, rz=90);
         
        //top connector
        difference(){
            yCube(116,4,4,   58,46,28);
            for (i=[50:20:110]){
                yCyl(0.8,20,    i,46,28);                
            }//for
        }//difference
        difference(){
            yCube(116,4,4,   58,-46,28);
            for (i=[50:20:110]){
                yCyl(0.8,20,    i,-46,28);                
            }//for
        }//difference
    }//transform
}//module                

module fuselage_back(px=0,py=0,pz=0, rx=0,ry=0,rz=0, mx=0,my=0,mz=0, isMetal=false, isAdhesion=false){
    translate([(px), (py), pz])
    rotate([rx,ry,rz])
    mirror([mx,my,mz]){  
        //center/bottom
        difference(){
            difference(){
                yPoly(p=[[40,0],[50,30],[-50,30],[-40,0]],szz=100, px=0,py=0,pz=0, rx=90,ry=0, rz=90);
                yPoly(p=[[39,0],[49,30],[-49,30],[-39,0]],szz=102, px=-1,py=0,pz=3, rx=90,ry=0, rz=90);
            }//difference
            //yCube(40,110,40, 115,0,20, 0,-17.5);
            yCube(40,110,40, -13.3,0,20, 0,22.5);
            //connector to chassis
            for (i=[70:20:140]){
                yCyl(1.5,20,    i,10,0);
                yCyl(1.5,20,    i,-10,0);
            }//for
        }//difference
               
        //back
        difference(){
            translate([-42.43,0,42.43])
            rotate([0,45,0])
            difference(){
                yPoly(p=[[40,0],[50,30],[-50,30],[-40,0]],szz=60, px=0,py=0,pz=0, rx=90,ry=0, rz=90);
                yPoly(p=[[39,0],[49,30],[-49,30],[-39,0]],szz=62, px=-1,py=0,pz=1, rx=90,ry=0, rz=90);
            }//difference
            yCube(70,110,40, -17,0,50);
            yCube(40,110,40, 25.8,0,10, 0,22.5);
            
        }//difference
        
        translate([100,0,60])
        rotate([0,180,0])
        difference(){
            difference(){
                yPoly(p=[[40,0],[50,30],[-50,30],[-40,0]],szz=40, px=0,py=0,pz=0, rx=90,ry=0, rz=90);
                yPoly(p=[[39,0],[49,30],[-49,30],[-39,0]],szz=42, px=-1,py=0,pz=3, rx=90,ry=0, rz=90);
            }//difference
            //connector to wings/engines        
            for (i=[-30:20:30]){
                yCyl(0.8,20,    20,i,0);
                //yCyl(0.8,20,    50,i,0);
            }//for    
            //connector to chassis
            for (i=[10:20:40]){
                yCyl(5,20,    i,10,0);
                yCyl(5,20,    i,-10,0);
            }//for
        }//difference
         //battery holder
        battery_holder(80,18,0, 0,0,90);
        battery_holder(80,-22,0, 0,0,90);
        yCube(60,4,2,   30,20,9);
        yCube(60,4,2,   30,-20,9);
        yCube(4,4,8,   2,20,4.5);
        yCube(4,4,8,   2,-20,4.5);
        //nervure
        yPoly(p=[[40,0],[50,30],[45,30],[35,5],[-35,5],[-45,30],[-50,30],[-40,0],],szz=6, px=94,py=0,pz=0, rx=90,ry=0, rz=90);
         
        //top connector
        difference(){
            yCube(96,4,4,   52,46,28);
            for (i=[10:20:110]){
                yCyl(0.8,20,    i,46,28);                
            }//for
        }//difference
        difference(){
            yCube(96,4,4,   52,-46,28);
            for (i=[10:20:110]){
                yCyl(0.8,20,    i,-46,28);                
            }//for
        }//difference
    }//transform
}//module                


module battery_holder(px=0,py=0,pz=0, rx=0,ry=0,rz=0, mx=0,my=0,mz=0, isMetal=false, isAdhesion=false){
    translate([(px), (py), pz])
    rotate([rx,ry,rz])
    mirror([mx,my,mz]){  
    yPoly(p=[[20,0],[20,10],[-20,10],[-20,0], [-15,0],[-15,7], [15,7],[15,0]],szz=4, px=0,py=0,pz=0, rx=90,ry=0, rz=90);
    }//transform
}//module      