include <../../lib/lib2.scad>
include <../../lib/lib2/lib2_motor.scad>
include <../../lib/lib2/lib2_prop.scad>
include <../../lib/lib2/lib2_servo.scad>


//engine2212_wing();
//engine2212_mount(isMetal=true);
//2print
//engine2212_wing(rx=-90,isAdhesion=true);//left
//engine2212_wing(rx=90,my=1,isAdhesion=true);//right
//engine2212_mount(ry=90);//left
//engine2212_mount(ry=90, my=1);//right

function naca_half_thickness(x,t) = 5*t*(0.2969*sqrt(x) - 0.1260*x - 0.3516*pow(x,2) + 0.2843*pow(x,3) - 0.1015*pow(x,4));
function naca_top_coordinates(t,n) = [ for (x=[0:1/(n-1):1]) [x, naca_half_thickness(x,t)]];
function naca_bottom_coordinates(t,n) = [ for (x=[1:-1/(n-1):0]) [x, - naca_half_thickness(x,t)]];
function naca_coordinates(t,n) = concat(naca_top_coordinates(t,n), naca_bottom_coordinates(t,n));

module engine2212_mount(px=0,py=0,pz=0, rx=0,ry=0,rz=0, mx=0,my=0,mz=0, isMetal=false, isAdhesion=false){
    translate([(px), (py), pz])
    rotate([rx,ry,rz])
    mirror([mx,my,mz]){  
        translate([50,218,27])
        rotate([0,90,0]){            
                if (isMetal){
                    blMotor2212(0,0,0 ,0,0,-22.5-10);            
                    prop8060(0,0,25,   0,0,0);      
                }//isMetal    
                difference(){
                    union(){
                        blMotor2212_bot(0,0,0, 0,0,-22.5-10);   
                        yTube(15,12,60, 0,0,-26-20,  0,0,0);
                        yCube(14,5,60,    0,-13,-45);
                    }//union                
                    yCyl(62,40, -0,50,-84,  0,90,0);
                    yCube(20,20,100,    0,-23,-50);
                    //holes - to engine mount            
                    yCyl(1.5,50,    0,0,-20,  90,0,0);
                    yCyl(1.5,50,    0,0,-60,  90,0,0);
                    yCyl(3,30,    0,20,-20,  90,0,0);
                    //
                    //yCube(6.5,6,10, 1.5,-6,-15, 0,0,15);
                    yCube(10,10,28, 0,-10,-40, 0,0,0);
                    //yCube(6,10,18, 8.5,-10,-70, 0,17,0);
                    //yCube(6,10,18, -8.5,-10,-70, 0,-17,0);
                }//difference
            
                
        }//translate        
    }//transform
}//module                

module engine2212_wing(px=0,py=0,pz=0, rx=0,ry=0,rz=0, mx=0,my=0,mz=0, isMetal=false, isAdhesion=false){
    translate([(px), (py), pz])
    rotate([rx,ry,rz])
    mirror([mx,my,mz]){  
        chord=80;
        length=210;
        difference(){
            union(){
                translate([chord/2,length/2,0])
                rotate([75,0,180])
                linear_extrude(height=length, center=true) {                    
                    points = naca_coordinates(t=0.22,n=300);
                    scale([chord,chord,1])
                        polygon(points);
                } //translate        
                
            }//union
            //cable to engine
            yCube(28,length+10,12,   10,length/2,0,  15,0,0);
            //vertical/horizontal geometry
            yCube(chord*2, chord,chord, 0,length+chord/2-5,0);
            yCube(chord*2, chord,chord, 0,-chord/2+5,0);            
            yCube(chord*2, chord,chord, 0,chord/2-5,-chord/2-25);
            
            //holes - to fuselage
            yCyl(1.8,70,    30,15,0);
            yCyl(1.8,70,    -10,15,0);
            yCyl(1.8,70,    30,35,0);
            yCyl(1.8,70,    -10,35,0);
        
            yCyl(3,20,    30,15,-10);
            yCyl(3,20,    -10,15,-10);
            yCyl(3,20,    30,35,-10);
            yCyl(3,20,    -10,35,-10);
            //holes - to engine mount            
            yCyl(0.8,50,    30,length,27,  90,0,0);
            yCyl(0.8,50,    -10,length,27,  90,0,0);
            
        }//difference
        
        if (isMetal){
            translate([50,length+9,27])
            rotate([0,90,0]){            
                blMotor2212(0,0,0 ,0,0,-22.5-10);            
                prop8060(0,0,25,   0,0,0);      
            
                //blMotor2212_bot(0,0,0, 0,0,-22.5-10);   
                //yTube(14,12,20, 0,0,-26,  0,0,0);
            }//translate
        }//isMetal
        if(isAdhesion){
            yCyl(5,0.7,    30,length-5.3,15,  90,0,0);
            yCyl(5,0.7,    -10,length-5.3,17,  90,0,0);
            yCyl(5,0.7,    -40,length-5.3,25,  90,0,0);        
        }//isAdhesion            
    }//transform
}//module                


//engine2212_basket_inch5_assembly();

//2print
//engine2212_basket_inch5_front();
//engine2212_basket_inch5_back();
//engine2212_support(0,0,0, 0,0,45);
//engine2212_basket_inch5_rudder(0,0,0, 0,90,90, isAdhesion=true);

module engine2212_basket_inch5_assembly(px=0,py=0,pz=0, rx=0,ry=0,rz=0, isAdhesion=false){
    translate([(px), (py), pz])
    rotate([rx,ry,rz]){
        rotate([0,-90,0]){
            engine2212_basket_inch5_rudder(0,0,80+26);
            engine2212_basket_inch5_back(0,0,25, 0,0,0, isMetal=true);
            engine2212_basket_inch5_front(isMetal=true);
            engine2212_support(0,0,-30, 0,0,135);
        }
    }//transform
}//module                
        
module engine2212_basket_inch5_rudder(px=0,py=0,pz=0, rx=0,ry=0,rz=0, isAdhesion=false){
    translate([(px), (py), pz])
    rotate([rx,ry,rz]){
        difference(){
            union(){ 
                yCyl(3,115.6,   0,0,0,  0,90,0,  sx=2);  
                yCyl(3,115.6,   0,0,6,  0,90,0,  sx=4);  
                yCyl(2.5,115.6,   0,0,12,  0,90,0,  sx=6);  
                yCyl(2,200.6,   -42.5,0,20,  0,90,0,  sx=8);              
            }//union
            yCyl(0.9,20,    60,0,0,  0,90,0);
            yCyl(0.9,20,    -60,0,0,  0,90,0);
            //to servo
            yCube(2.4,20,5.8,   -34,0,0);
        }//difference
        
        
        if (isAdhesion){
            yTube(10,8,0.8,   (115.6/2-0.4),0,0,  0,90,0,  sx=2);  
            yTube(10,8,0.8,   (115.6/2-0.4),0,15,  0,90,0,  sx=2);  
            yTube(10,8,0.8,   (115.6/2-0.4),0,30,  0,90,0,  sx=2);  
            yCube(12,3,1,     (115.6/2-0.4),0,40,  0,90,0 );
            yCube(12,3,1,     (115.6/2-0.4),0,-10,  0,90,0 );
        }//isAdhesion
    }//transform
}//module        
module engine2212_basket_inch5_back(px=0,py=0,pz=0, rx=0,ry=0,rz=0, isMetal=false){
    translate([(px), (py), pz])
    rotate([rx,ry,rz]){             
        yTube(71.3,68,4); 
        yTube(11.3,10,4);
        difference(){    
            yMinkCubeCyl(22,18,20,8.99, -60,0,20, 0,90,0, sx=2);
            yCube(30,12.8,24.6, -60,0,20);
            yCube(20,10,10, -65,0,10);
            yCyl(0.5,20,    -50,0,6,  0,90,0);
            yCyl(0.5,20,    -50,0,34,  0,90,0);
        }//difference
                
        yTube(4,2,4,    60,0,80, 0,90,0);
        yTube(4,2,4,    -60,0,80, 0,90,0);
        //yCyl(1.5,120,   0,0,80, 0,90,0);
               
        
        yCyl(5,78,  65,0,39,    0,0,0, sy=0.5);
        yCyl(3,82,  62,15,39,    20,-6,10, sx=0.5);
        yCyl(3,82,  62,-15,39,    -20,-6,-10, sx=0.5);
        
        yCyl(3,82,  -62,15,39,    20,1,10, sx=0.5);
        yCyl(3,82,  -62,-15,39,    -20,1,-10, sx=0.5);
        yCyl(4,40,  -60,0,58,    0,0,0, sx=0.6);
        yCyl(4,40,  -65,0,56,    0,0,0, sy=0.6);
        for (i=[0:45:360]){
            rotate([0,0,i])
            yCyl(1,60,  40,0,0,  0,90,0, sx=2);     
            
            rotate([0,0,i])
            yTube(3,1.7,4,  73,0,0);          
        }//for
        if (isMetal){            
            servoSg90(-55,0,20,  0,90,0);
        }//isMetal
    }//transform
}//module
        
module engine2212_support(px=0,py=0,pz=0, rx=0,ry=0,rz=0){
    translate([(px), (py), pz])
    rotate([rx,ry,rz]){
            
            //blMotor2212(0,0,14 ,0,0,22.5);            
            //prop5147_3(0,0,39,   0,0,0);
        
        blMotor2212_bot(0,0,14, 0,0,90);        
        yCube(8,6,4, 16,0,-1 );
        yCube(8,6,4, -16,0,-1 );
        yCube(6,8,4, 0,16,-1 );
        yCube(6,8,4, 0,-16,-1 );
        yCube(13,8,4, 10,10,-1, 0,0,45 );
        
        yTube(23.3,20,6);
        for (i=[0:45:360]){            
            rotate([0,0,i+22.5])
            yTube(3,0.9,30,  23,0,12);        
        }//for
        difference(){
            union(){
                yMinkCubeCyl(30,14,60,4, 36,36,12, 0,90,45);
                yMinkCubeCyl(30,30,5,4, 55.5,55.5,12, 0,90,45);
            }//union
            yCube(20,8,65, 36,36,12, 0,90,45);
            yCube(50,8,10,  35,35,0, 0,0,45);
            
            //connection to chassis
            translate([55,55,12])
            rotate([0,90,45])
                {
                yCyl(1.8,15,  10,10,0 );
                yCyl(1.8,15,  10,-10,0);
                yCyl(1.8,15,  -10,10,0 );
                yCyl(1.8,15,  -10,-10,0);
            }//transform
        }//difference        
    }//transform
}//module


/*
module engine2212_basket_inch5_back(px=0,py=0,pz=0, rx=0,ry=0,rz=0){
    translate([(px), (py), pz])
    rotate([rx,ry,rz]){        
        yTube(71.3,70,4);
        yTube(11.3,10,4);
        for (i=[0:45:360]){
            rotate([0,0,i])
            yCyl(1,60,  40,0,0,  0,90,0, sx=2);     
            
            rotate([0,0,i])
            yTube(3,1.7,16,  73,0,6);          
        }//for
    }//transform
}//module
*/
module engine2212_basket_inch5_front(px=0,py=0,pz=0, rx=0,ry=0,rz=0, isMetal=false){
    translate([(px), (py), pz])
    rotate([rx,ry,rz]){
        if (isMetal){
            blMotor2212(0,0,-15 ,0,0,22.5);
            blMotor2212_bot(0,0,-15, 0,0,22.5);
            prop5147_3(0,0,10,   0,0,0);
        }//isMetal
        
        yTube(71.3,70,6);        
        yTube(21.3,20,6);
        for (i=[0:45:360]){
            rotate([0,0,i])
            yCyl(1.5,50,  45,0,0,  0,90,0, sx=2);                
            
            rotate([0,0,i+22.5])
            yTube(3,1.7,6,  23,0,0);
            
            rotate([0,0,i])
            yTube(3,0.9,26,  73,0,10);
        }//for
    }//transform
}//module
