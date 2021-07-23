include <../../lib/lib2.scad>
//include <../../lib/lib2/lib2_motor.scad>
//include <../../lib/lib2/lib2_prop.scad>
//include <../../lib/lib2/lib2_servo.scad>


//fuselage_engine_support();
//fuselage_front(0,0,10);
//fuselage_front_top(0,0,70, 180,0,0);
//fuselage_front_top(0,0,70, 0,0,0);
//fuselage_back(-110,0,10,isRPi=true);
//jetson_nano_sup(38,0,20, 0,0,90);  

module fuselage_front_top(px=0,py=0,pz=0, rx=0,ry=0,rz=0, mx=0,my=0,mz=0, isMetal=false, isAdhesion=false){
    translate([(px), (py), pz])
    rotate([rx,ry,rz])
    mirror([mx,my,mz]){  
        //center/bottom
        difference(){
            union(){
                difference(){
                    yPoly(p=[[50,0],[60,30],[-60,30],[-50,0]],szz=120, px=0,py=0,pz=0, rx=90,ry=0, rz=90);
                    yPoly(p=[[49,0],[59,30],[-59,30],[-49,0]],szz=122, px=-1,py=0,pz=1, rx=90,ry=0, rz=90);
                }//difference
                yCyl(6.5,60, 75,53.5,23.5,  0,90,0, $fn=3, sx=2.0);
                yCyl(6.5,60, 75,-53.5,23.5,  0,90,0, $fn=3, sx=2.0);
            }//union
            yCube(40,130,40, 135,0,20, 0,-17.5);     
            //for fuselage connectors
            /*for (i=[-30:20:30]){
                yCyl(1.5,20,    30,i,0);
                yCyl(1.5,20,    10,i,0);
                //yCyl(0.8,20,    -30,i,0);
            }//for          
            */
            scale([1.5,1,1]){                
                yCyl(10.3,10,    0,20,0, sx=1.4);
                yCyl(10.3,10,    0,-20,0, sx=1.4);
            }//scale
            //bottom connectors
            for (i=[50:20:90]){
                yCyl(1.5,50,    i,56,28);
                yCyl(3.0,20,    i,56,15);                
                yCyl(1.5,50,    i,-56,28);
                yCyl(3.0,20,    i,-56,15);                
            }//for
            //for magnets 3x1mm            
            yCyl(1.8,2,    60,56,29.5);          
            yCyl(1.8,2,    100,56,29.5);
            yCyl(1.8,2,    60,-56,29.5);          
            yCyl(1.8,2,    100,-56,29.5);
        }//difference
        
        //front
        difference(){
            translate([120,0,0])
            rotate([0,-35,0])
            difference(){
                yPoly(p=[[50,0],[60,30],[-60,30],[-50,0]],szz=60, px=0,py=0,pz=0, rx=90,ry=0, rz=90);
                yPoly(p=[[49,0],[59,30],[-59,30],[-49,0]],szz=62, px=-1,py=0,pz=2, rx=90,ry=0, rz=90);
            }//difference
            yCube(70,130,40, 137,0,50);
            yCube(40,130,40, 96,0,10, 0,-17.5);
        }//difference    
    }//transform
}//module                    
module fuselage_engine_support(px=0,py=0,pz=0, rx=0,ry=0,rz=0, mx=0,my=0,mz=0, isMetal=false, isAdhesion=false){
    translate([(px), (py), pz])
    rotate([rx,ry,rz])
    mirror([mx,my,mz]){  
        //bottom
        difference(){
            yCube(80,80,10, 0,0,0);
             //connection to main float
            yCyl(5,10,  37,37,5, 0,0,0);
            yCyl(1.5,30,  37,37,0, 0,0,0);
            yCyl(5,10,  3,37,5, 0,0,0);
            yCyl(1.5,30,  3,37,0, 0,0,0);
            yCyl(5,10,  -3,37,5, 0,0,0);
            yCyl(1.5,30,  -3,37,0, 0,0,0);          
            yCyl(5,10,  -37,37,5, 0,0,0);
            yCyl(1.5,30,  -37,37,0, 0,0,0);
            
            yCyl(5,10,  37,-37,5, 0,0,0);
            yCyl(1.5,30,  37,-37,0, 0,0,0);
            yCyl(5,10,  3,-37,5, 0,0,0);
            yCyl(1.5,30,  3,-37,0, 0,0,0);
            yCyl(5,10,  -3,-37,5, 0,0,0);
            yCyl(1.5,30,  -3,-37,0, 0,0,0);          
            yCyl(5,10,  -37,-37,5, 0,0,0);
            yCyl(1.5,30,  -37,-37,0, 0,0,0);
            //for fuselage connectors
            for (i=[-30:20:30]){
                yCyl(0.8,20,    30,i,11);
                yCyl(0.8,20,    10,i,11);
                yCyl(0.8,20,    -10,i,11);
                yCyl(0.8,20,    -30,i,11);
            }//for        
        }//difference
        
        difference(){
            scale([1.5,1,1]){
                union(){
                    yCyl(10,100,    0,20,50, sx=1.4);
                    yCyl(10,100,    0,-20,50, sx=1.4);
                    yCone(30,40, 0,20,80, 180,0,45,$fn=4);
                    yCone(30,40, 0,-20,80, 180,0,45,$fn=4);
                }//union
            }//scale
             for (i=[-30:20:30]){
                yCyl(0.8,20,    20,i,100);
                yCyl(0.8,20,    -20,i,100);
            }//for
            //yCube(27,40,50, 0,0,80);
            scale([0.6,1.4,1])
            yCone(30,40, 0,0,81, 180,0,45,$fn=4);
        }//difference
        
    }//transform
}//module                


          
module fuselage_front(px=0,py=0,pz=0, rx=0,ry=0,rz=0, mx=0,my=0,mz=0, isMetal=false, isAdhesion=false){
    translate([(px), (py), pz])
    rotate([rx,ry,rz])
    mirror([mx,my,mz]){  
        //center/bottom
        difference(){
            difference(){
                yPoly(p=[[50,0],[60,30],[-60,30],[-50,0]],szz=120, px=0,py=0,pz=0, rx=90,ry=0, rz=90);
                yPoly(p=[[49,0],[59,30],[-59,30],[-49,0]],szz=122, px=-1,py=0,pz=3, rx=90,ry=0, rz=90);
            }//difference
            yCube(40,130,40, 135,0,20, 0,-17.5);     
            //for fuselage connectors
            for (i=[-30:20:30]){
                yCyl(1.5,20,    30,i,0);
                yCyl(1.5,20,    10,i,0);
                //yCyl(0.8,20,    -30,i,0);
            }//for          
            scale([1.5,1,1]){                
                yCyl(10.3,10,    0,20,0, sx=1.4);
                yCyl(10.3,10,    0,-20,0, sx=1.4);
            }//scale
        }//difference
        
        //front
        difference(){
            translate([120,0,0])
            rotate([0,-35,0])
            difference(){
                yPoly(p=[[50,0],[60,30],[-60,30],[-50,0]],szz=60, px=0,py=0,pz=0, rx=90,ry=0, rz=90);
                yPoly(p=[[49,0],[59,30],[-59,30],[-49,0]],szz=62, px=-1,py=0,pz=2, rx=90,ry=0, rz=90);
            }//difference
            yCube(70,130,40, 137,0,50);
            yCube(40,130,40, 96,0,10, 0,-17.5);
        }//difference
        
        //battery holder
        battery_holder(45,18,0, 0,0,90);
        battery_holder(45,-22,0, 0,0,90);
        battery_holder(95,18,0, 0,0,90);
        battery_holder(95,-22,0, 0,0,90);
        
        //nervure
        //yPoly(p=[[40,0],[50,30],[45,30],[35,5],[-35,5],[-45,30],[-50,30],[-40,0],],szz=6, px=0,py=0,pz=0, rx=90,ry=0, rz=90);
         
        //top connector
        difference(){
            //yCube(116,4,4,   58,46,28);
            yCyl(4,110, 58,56,28,  0,90,0, $fn=3);
            for (i=[50:20:110]){
                yCyl(0.8,20,    i,56,28);                
            }//for
            //for magnets 3x1mm
            yCyl(1.8,2,    20,56,29.5); 
            yCyl(1.8,2,    60,56,29.5);          
            yCyl(1.8,2,    100,56,29.5);
        }//difference
        
        difference(){
            yCyl(4,110, 58,-56,28,  0,90,0, $fn=3);
            for (i=[50:20:110]){
                yCyl(0.8,20,    i,-56,28);                
            }//for
            //for magnets 3x1mm
            yCyl(1.8,2,    20,-56,29.5);          
            yCyl(1.8,2,    60,-56,29.5);          
            yCyl(1.8,2,    100,-56,29.5);
        }//difference
    }//transform
}//module                

module fuselage_back(px=0,py=0,pz=0, rx=0,ry=0,rz=0, mx=0,my=0,mz=0, isMetal=false, isAdhesion=false, isRPi=false, isJetson=true){
    translate([(px), (py), pz])
    rotate([rx,ry,rz])
    mirror([mx,my,mz]){  
        //center/bottom
        difference(){
            difference(){
                yPoly(p=[[50,0],[60,30],[-60,30],[-50,0]],szz=110, px=0,py=0,pz=0, rx=90,ry=0, rz=90);
                yPoly(p=[[49,0],[59,30],[-59,30],[-49,0]],szz=112, px=-1,py=0,pz=3, rx=90,ry=0, rz=90);
            }//difference
            //yCube(40,110,40, 115,0,20, 0,-17.5);
            yCube(40,120,40, -13.3,0,20, 0,22.5);
                   //for fuselage connectors
            for (i=[-30:20:30]){
                yCyl(1.5,20,    80,i,0);
                yCyl(1.5,20,    100,i,0);
                //yCyl(0.8,20,    -30,i,0);
            }//for 
            translate([10,0,0])
            scale([1.5,1,1]){                
                yCyl(10.3,10,    66,20,0, sx=1.4);
                yCyl(10.3,10,    66,-20,0, sx=1.4);
            }//scale
        }//difference
               
        //back
        difference(){
            translate([-42.43,0,42.43])
            rotate([0,45,0])
            difference(){
                yPoly(p=[[50,0],[60,30],[-60,30],[-50,0]],szz=60, px=0,py=0,pz=0, rx=90,ry=0, rz=90);
                yPoly(p=[[49,0],[59,30],[-59,30],[-49,0]],szz=62, px=-1,py=0,pz=2, rx=90,ry=0, rz=90);
            }//difference
            yCube(70,120,40, -17,0,50);
            yCube(40,120,40, 25.8,0,10, 0,22.5);
            
        }//difference
        
  
         //battery holder
        battery_holder(35,18,0, 0,0,90);
        battery_holder(35,-22,0, 0,0,90);
        if (isJetson){
            jetson_nano_sup(45,0,5, 0,0,90);  
        }//isJetson
        if(isRPi){
            raspberrypi_sup(55,0,5, 0,0,90);
        }//isRPi
        difference(){
            //yCube(116,4,4,   58,46,28);
            yCyl(4,90, 54,56,28,  0,90,0, $fn=3);
            for (i=[30:20:110]){
                yCyl(0.8,20,    i,56,28);                
            }//for
            //for magnets 3x1mm
            yCyl(1.8,2,    20,56,29.5); 
            yCyl(1.8,2,    60,56,29.5);                      
        }//difference
        
        difference(){
            yCyl(4,90, 54,-56,28,  0,90,0, $fn=3);
            for (i=[30:20:110]){
                yCyl(0.8,20,    i,-56,28);                
            }//for
            //for magnets 3x1mm
            yCyl(1.8,2,    20,-56,29.5);          
            yCyl(1.8,2,    60,-56,29.5);         
        }//difference
    }//transform
}//module                

module jetson_nano(px=0,py=0,pz=0, rx=0,ry=0,rz=0, mx=0,my=0,mz=0, isMetal=false, isAdhesion=false){
    translate([(px), (py), pz])
    rotate([rx,ry,rz])
    mirror([mx,my,mz]){  
        difference(){
            yCube(100,79,30);
            yCyl(1.5,35,    46,-35.5,0);    
            yCyl(1.5,35,    46-86,-35.5,0);    
            yCyl(1.5,35,    46,-35.5+58,0);    
            yCyl(1.5,35,    46-86,-35.5+58,0);    
        }//difference
    }//transform
}//module      

module jetson_nano_sup(px=0,py=0,pz=0, rx=0,ry=0,rz=0, mx=0,my=0,mz=0, isMetal=false, isAdhesion=false){
    translate([(px), (py), pz])
    rotate([rx,ry,rz])
    mirror([mx,my,mz]){                
            yTube(3.3,0.8,10,    46,-35.5,0);    
            yTube(3.5,0.8,10,    (46-86),-35.5,0);    
            yTube(3.5,0.8,10,    46,-35.5+58,0);    
            yTube(3.5,0.8,10,    46-86,-35.5+58,0);            
    }//transform
}//module      

//raspberrypi_sup();
module raspberrypi_sup(px=0,py=0,pz=0, rx=0,ry=0,rz=0, mx=0,my=0,mz=0, isMetal=false, isAdhesion=false){
    translate([(px), (py), pz])
    rotate([rx,ry,rz])
    mirror([mx,my,mz]){
            translate([((85-58)/2),0,0]){
                yTube(3.3,0.8,10,    29,-56/2+3.5,0);    
                yTube(3.5,0.8,10,    -29,-56/2+3.5,0);    
                yTube(3.5,0.8,10,    29,56/2-3.5,0);    
                //yTube(3.5,0.8,10,    -29,56/2-3.5,0);            
            }//translate
    }//transform
}//module
module battery_holder(px=0,py=0,pz=0, rx=0,ry=0,rz=0, mx=0,my=0,mz=0, isMetal=false, isAdhesion=false){
    translate([(px), (py), pz])
    rotate([rx,ry,rz])
    mirror([mx,my,mz]){  
    yPoly(p=[[20,0],[20,10],[-20,10],[-20,0], [-15,0],[-15,7], [15,7],[15,0]],szz=4, px=0,py=0,pz=0, rx=90,ry=0, rz=90);
    }//transform
}//module      