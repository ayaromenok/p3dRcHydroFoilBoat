include <../../lib/lib2.scad>
//include <../../lib/lib2/lib2_motor.scad>
//include <../../lib/lib2/lib2_prop.scad>
//include <../../lib/lib2/lib2_servo.scad>


//wingMainNACA(isAdhesion=true);
//wingMainNACA_V(isAdhesion=true, length =100);
//wingChassis();
//wingHolderSingle(isAdhesion=false);
//wingHolderSingle(isAdhesion=true, length=120, rx=180);

function naca_half_thickness(x,t) = 5*t*(0.2969*sqrt(x) - 0.1260*x - 0.3516*pow(x,2) + 0.2843*pow(x,3) - 0.1015*pow(x,4));
function naca_top_coordinates(t,n) = [ for (x=[0:1/(n-1):1]) [x, naca_half_thickness(x,t)]];
function naca_bottom_coordinates(t,n) = [ for (x=[1:-1/(n-1):0]) [x, - naca_half_thickness(x,t)]];
function naca_coordinates(t,n) = concat(naca_top_coordinates(t,n), naca_bottom_coordinates(t,n));

module wingChassis(px=0,py=0,pz=0, rx=0,ry=0,rz=0, chord = 30, length=200, isAdhesion=false){
    translate([(px), (py), pz])
    rotate([rx,ry,rz])
    rotate([90,0,180])
    {
        difference(){
            union(){
                translate([0,-12,length/4+4])
                rotate([15,0,0])        
                    linear_extrude(height=length/2-10, center=true) {                    
                    points = naca_coordinates(t=0.38,n=300);
                        scale([chord,chord,1])
                        polygon(points);
                }//linear_extrude
                translate([0,-12,-length/4-4])
                rotate([-15,0,0])        
                    linear_extrude(height=length/2-10, center=true) {                    
                    points = naca_coordinates(t=0.38,n=300);
                        scale([chord,chord,1])
                        polygon(points);
                }//linear_extrude    
                
                yMinkCubeSphere(35,chord*0.38,30,    5, chord/2);        
                yMinkCubeCyl(chord,30,28,    13,     chord/2, -24,length/2-15,       90, sx=3);
                yMinkCubeCyl(chord,30,28,    13,     chord/2, -24,-length/2+15,      90, sx=3);
            }//union
            for (i=[5:20:25]){     
                yCyl(1.8,20,    i,0,10,     90);
                yCyl(1.8,20,    i,0,-10,    90);     
            }//for
    
            for (i=[5:20:40]){                     
                yCyl(0.8,20,    i,-15,-95,    0);     
                yCyl(0.8,20,    i,-35,-95,     0);
        
                yCyl(0.8,20,    i,-15,95,    0);     
                yCyl(0.8,20,    i,-35,95,     0);
            }//for
        }//difference        
    }//transform    
}//module     

module wingMainNACA_V(px=0,py=0,pz=0, rx=0,ry=0,rz=0, chord = 40, length=100, isAdhesion=false, isHoles=true){
    translate([(px), (py), pz])
    rotate([rx,ry,rz]){
        difference(){
            union(){
                difference(){
                rotate([15,0,0])
                linear_extrude(height=length/2+4.5, center=true) {                    
                    points = naca_coordinates(t=0.12,n=300);
                        scale([chord,chord,1])
                        polygon(points);
                }//linear_extrude
                yCube(50,20,10, 25,-10,length/4+5.01);
                }//difference
                difference(){
                    translate([0,0,length/2])
                    rotate([-15,0,0])
                    linear_extrude(height=length/2+4.5, center=true) {                    
                        points = naca_coordinates(t=0.12,n=300);
                        scale([chord,chord,1])
                            polygon(points);
                }//linear_extrude
                yCube(50,20,10, 25,-10,length/4-5.01);
                }//difference
            }//union
            
            yCube(50,20,10, 25,10,-length/4-4.5);
            yCube(50,20,10, 25,10,length*0.75+4.5);
            
            if(isHoles){
                yCyl(1.8,30,    6,0,length/4,  90,0,0);
                yCyl(1.8,30,    26,0,length/4,  90,0,0);
            
                yCone(4,7,    6,-7.1,length/4,  -90,0,0);
                yCone(4,7,    26,-7,length/4,  -90,0,0);
            }//isHoles
        }//difference
        
    }//transform
    if (isAdhesion){
            yTube(10,8,0.4,   10,7,-length/4+0.7,  0,0,0,  sx=2);              
            yTube(10,8,0.4,   30,7,-length/4+0.7,  0,0,0,  sx=2);  
            yCube(10,3,0.4,     -2.5,7,-length/4+0.7,  0,0,0 );
            yCube(10,3,0.4,     42.5,7,-length/4+0.7,  0,0,0 );
        }//isAdhesion
}//module            

module wingMainNACA(px=0,py=0,pz=0, rx=0,ry=0,rz=0, chord = 40, length=100, isAdhesion=false){
    translate([(px), (py), pz])
    rotate([rx,ry,rz]){
        difference(){
            linear_extrude(height=length, center=true) {                    
                points = naca_coordinates(t=0.12,n=300);
                    scale([chord,chord,1])
                    polygon(points);
            }//linear_extrude
            yCyl(1.8,20,    10,0,10,  90,0,0);
            yCyl(1.8,20,    30,0,10,  90,0,0);
            yCyl(1.8,20,    10,0,-10,  90,0,0);
            yCyl(1.8,20,    30,0,-10,  90,0,0);
            
            yCone(3,7,    10,0,10,  90,0,0);
            yCone(3,7,    30,-1,10,  90,0,0);
            yCone(3,7,    10,0,-10,  90,0,0);
            yCone(3,7,    30,-1,-10,  90,0,0);            
        }//difference

    }//transform
    if (isAdhesion){
            yTube(10,8,0.4,   10,0,-length/2+0.2,  0,0,0,  sx=2);              
            yTube(10,8,0.4,   30,0,-length/2+0.2,  0,0,0,  sx=2);  
            yCube(10,3,0.4,     -2.5,0,-length/2+0.2,  0,0,0 );
            yCube(10,3,0.4,     42.5,0,-length/2+0.2,  0,0,0 );
        }//isAdhesion
}//module            

module wingHolderSingle(px=0,py=0,pz=0, rx=0,ry=0,rz=0, length=120, chord=40, isAdhesion=false, angle=8){
    translate([(px), (py), pz])
    rotate([rx,ry,rz]){
        difference(){
            union(){
                translate([chord/2,0,length/2])
                rotate([0,0,180])
                linear_extrude(height=length, center=true) {                    
                    points = naca_coordinates(t=0.12,n=300);
                        scale([chord,chord,1])
                        polygon(points);
                }        
        
                translate([chord/2,0,0])
                rotate([0,0,180])
                linear_extrude(height=10, center=true) {                    
                    points = naca_coordinates(t=0.18,n=300);
                        scale([chord,chord,1])
                        polygon(points);
                }
            }//union
            wingMainNACA_V(20,-25,8,   90,angle,180, isHoles=false);
            yCube(chord*2, chord,20, 1,0,-11, 0,-angle,0);
            //holles
            translate([5,0,0])
            rotate([0,-angle,0]){
                yCyl(0.9,20,    10,0,0);
                yCyl(0.9,20,   -10,0,0);
            }//translate                     
            yCyl(1.8,20,    10,0,length-5,   90);
            yCyl(1.8,20,    10,0,length-25,   90);
            yCyl(1.8,20,    -10,0,length-5,   90);
            yCyl(1.8,20,    -10,0,length-25,  90);
        }//difference        
        if(isAdhesion){
            yCyl(5,0.7, 24,0,length-0.35);
            yCyl(5,0.7, -24,0,length-0.35);
            yCyl(5,0.7, 10,7,length-0.35);
            yCyl(5,0.7, 10,-7,length-0.35);
            }//isAdhesion
    }//transform
}//module            

