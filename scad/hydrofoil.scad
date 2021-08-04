include <../../lib/lib2.scad>
//include <../../lib/lib2/lib2_motor.scad>
//include <../../lib/lib2/lib2_prop.scad>
//include <../../lib/lib2/lib2_servo.scad>



//2print
//wingMainNACA_half(length=80, chord=60,rx=180, isAdhesion=true);//right
//wingMainNACA_half(length=80, chord=60,rx=180, my=1,isAdhesion=true);//left
//wingMainNACA(isAdhesion=true);
//wingMainNACA_V(isAdhesion=true, length =100);
//wingMainNACA_V(isAdhesion=true, length = 160, chord=60);
//wingChassis();
//wingHolderSingle(isAdhesion=false, py=100,rx=90);
//wingHolderSingle(isAdhesion=true, length=140, rx=180);
//wingMainNACA_half(0,-30,34,    180,0,0, length=60, isAdhesion=true);
//wingHolderBack();
//wingMainNACA_multy_V(isAdhesion=true);


function naca_half_thickness(x,t) = 5*t*(0.2969*sqrt(x) - 0.1260*x - 0.3516*pow(x,2) + 0.2843*pow(x,3) - 0.1015*pow(x,4));
function naca_top_coordinates(t,n) = [ for (x=[0:1/(n-1):1]) [x, naca_half_thickness(x,t)]];
function naca_bottom_coordinates(t,n) = [ for (x=[1:-1/(n-1):0]) [x, - naca_half_thickness(x,t)]];
function naca_coordinates(t,n) = concat(naca_top_coordinates(t,n), naca_bottom_coordinates(t,n));

//wingMainNACA_multy_V_v2();
module wingMainNACA_multy_V_v2(px=0,py=0,pz=0, rx=0,ry=0,rz=0, mx=0,my=0,mz=0){
    translate([(px), (py), pz])
    rotate([rx,ry,rz])
    mirror([mx,my,mz]){
        wingHolderSingle();
        wingMainNACA_V(20,-40,14,    90,5,180, length=160, chord=60);
        //wingMainNACA_half(0,-35,30,    -90,8,180, length=80,chord = 60);
        wingMainNACA_half(-1,-38,60,    -90,11,180, length=80,chord = 60);
        //wingMainNACA_half(0,-35,88.5,    -90,14,180, length=70);
        wingMainNACA_half(-1,38,45,    -90,8,180, length=80,chord = 60, mz=1);
    }//transform    
}//module     


module wingMainNACA_half(px=0,py=0,pz=0, rx=0,ry=0,rz=0, mx=0,my=0,mz=0, chord = 60, length=80, isAdhesion=false, angle=10){
    translate([(px), (py), pz])
    rotate([rx,ry,rz])
    mirror([mx,my,mz]){
        difference(){
            rotate([angle,0,0])
            union(){
                linear_extrude(height=length, center=true) {                    
                    points = naca_coordinates(t=0.07,n=300);
                        scale([chord,chord,1])
                        translate([-0.5,0,0])
                        polygon(points);
                }//linear_extrude
                translate([0,0,-length/2+1])
                linear_extrude(height=4, center=true) {                    
                    points = naca_coordinates(t=0.16,n=300);
                        scale([chord,chord,1])
                        translate([-0.5,0,0])
                        polygon(points);
                }//linear_extrude
                translate([0,0,-length/2+8])
                linear_extrude(height=10, center=true, scale=0.4) {                    
                    points = naca_coordinates(t=0.16,n=300);
                        scale([chord,chord,1])
                        translate([-0.5,0,0])
                        polygon(points);
                }//linear_extrude
            }//union
            translate([0,0,-length/2])
            rotate([90,0,0])
                linear_extrude(height=chord, center=true) {                    
                    points = naca_coordinates(t=0.12,n=300);
                        scale([chord,chord,1])
                        translate([-0.5,0,0])
                        polygon(points);
                }//linear_extrude
            yCube(chord*2, chord*0.48,10,   0,0,-length/2-5);    
            yCyl(0.8,10,    10,(length/2*sin(angle)),-length/2,  0,0,0);    
            yCyl(0.8,20,    -10,(length/2*sin(angle)),-length/2,  0,0,0);
        }//difference
        
        if (isAdhesion){
            yTube(chord/4,chord/4.5,0.7,   chord/4,-(length/2*sin(angle)),length/2-0.2,  0,0,0,  sx=2);              
            yTube(chord/4,chord/4.5,0.7,   -chord/4,-(length/2*sin(angle)),length/2-0.2,  0,0,0,  sx=2);  
            yCube(chord/2,3,0.7,     chord/2,-(length/2*sin(angle)),length/2-0.2,  0,0,0 );
            yCube(chord/2,3,0.7,     -chord/2,-(length/2*sin(angle)),length/2-0.2,  0,0,0 );
        }//isAdhesion
    }//transform    
}//module 

module wingMainNACA_multy_V(px=0,py=0,pz=0, rx=0,ry=0,rz=0, chord = 40, length=100, isAdhesion=false, isHoles=true){
    translate([(px), (py), pz])
    rotate([rx,ry,rz]){
        difference(){
            translate([0,20,25])
            rotate([90,0,0])
                linear_extrude(height=180, center=true) {                    
                    points = naca_coordinates(t=0.12,n=300);
                        scale([chord,chord,1])
                        polygon(points);
                }//linear_extrude
            for (i=[65:20:110]){     
                yCyl(1.8,20,    5, i, 30,     0);
                yCyl(1.8,20,    25,i,30,    0);     
            }//for
        }//difference
        wingMainNACA_V(0,0,0, 0,0,-9);
        wingMainNACA_V(0,-30,0, 0,0,-7);
        wingMainNACA_V(0,-60,0, 0,0,-5);
        if(isAdhesion){
            yCube(chord, 0.81,length/2-0.7, chord/2,30,0.1);
            yCube(chord, 0.81,length/2-0.7, chord/2,70,0.1);
            yCube(chord, 0.81,length/2-0.7, chord/2,110,0.1);
        }//isAdhesion
        //yCube(10,200,10,    0,40,-29.6);
    }//transform    
}//module     



module wingHolderBack(px=0,py=0,pz=0, rx=0,ry=0,rz=0){
    translate([(px), (py), pz])
    rotate([rx,ry,rz]){
        difference(){
            yMinkCubeSphere(51,26,6,   2, -6.5);
            for (i=[-5:20:25]){     
                yCyl(1.8,20,    i,10,0,     0);
                yCyl(1.8,20,    i,-10,0,    0);     
            }//for
        }//difference
        difference(){
            yMinkCubeSphere(28,6,56,   2,   -39,6,25);
            for (i=[-49:20:-10]){     
                yCyl(0.8,20,    i,10,8,    90);
                yCyl(0.8,20,    i,10,18,    90);
                yCyl(0.8,20,    i,10,28,    90);
                yCyl(0.8,20,    i,10,38,    90);    
                yCyl(0.8,20,    i,10,48,    90);     
            }//for        
        }//difference
            
    }//transform
}//module            
        
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

module wingMainNACA_V(px=0,py=0,pz=0, rx=0,ry=0,rz=0, chord = 60, length=120, isAdhesion=false, isHoles=true){
    translate([(px), (py), pz])
    rotate([rx,ry,rz]){
        difference(){
            union(){
                difference(){
                rotate([15,0,0])
                linear_extrude(height=length/2+4.5, center=true) {                    
                    points = naca_coordinates(t=0.08,n=300);
                        scale([chord,chord,1])
                        polygon(points);
                }//linear_extrude
                yCube(150,20,10, 25,-10,length/4+5.01);
                }//difference
                difference(){
                    translate([0,0,length/2])
                    rotate([-15,0,0])
                    linear_extrude(height=length/2+4.5, center=true) {                    
                        points = naca_coordinates(t=0.08,n=300);
                        scale([chord,chord,1])
                            polygon(points);
                }//linear_extrude
                yCube(150,20,10, 25,-10,length/4-5.01);
                }//difference
            }//union
            
            yCube(150,20,10, 25,10,-length/4-4.5);
            yCube(150,20,10, 25,10,length*0.75+4.5);
            
            if(isHoles){
                yCyl(1.8,30,    6,0,length/4,  90,0,0);
                yCyl(1.8,30,    26,0,length/4,  90,0,0);
            
                yCone(4,7,    6,-10.7,length/4,  -90,0,0);
                yCone(4,7,    26,-11,length/4,  -90,0,0);
            }//isHoles
        }//difference
        
        
    }//transform
    if (isAdhesion){
            yTube(10,8,0.4,   chord/8,10,-length/4+0.7,  0,0,0,  sx=2);              
            yTube(10,8,0.4,   chord,10,-length/4+0.7,  0,0,0,  sx=2);  
            yCube(10*2,3,0.4,     -2.5,10,-length/4+0.7,  0,0,0 );
            yCube(10*2,3,0.4,     chord+9,10,-length/4+0.7,  0,0,0 );
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

//wingHolderSingle();
module wingHolderSingle(px=0,py=0,pz=0, rx=0,ry=0,rz=0, length=140, chord=40, isAdhesion=false, angle=5){
    translate([(px), (py), pz])
    rotate([rx,ry,rz]){
        difference(){
            union(){
                translate([0,0,length/2])
                rotate([0,0,180])
                linear_extrude(height=length, center=true) {                    
                    points = naca_coordinates(t=0.12,n=300);
                        scale([chord,chord,1])
                        translate([-0.5,0,0])
                        polygon(points);
                }        
        
                translate([2,0,7])
                rotate([0,0,180])
                linear_extrude(height=15, center=true,scale=0.45) {                    
                    points = naca_coordinates(t=0.24,n=300);
                        scale([chord*1.1,chord*1.1,1])
                        translate([-0.5,0,0])
                        polygon(points);
                }
                yCube(chord,chord*0.12,10,  0,0,length-5);    
            }//union
            wingMainNACA_V(20,-25,10,   90,angle,180, chord=42, isHoles=false);
            yCube(chord*2, chord,20, 1,0,-7.5, 0,-angle,0);
            //holles
            translate([5,0,0])
            rotate([0,-angle,0]){
                yCyl(0.9,20,    10,0,0);
                yCyl(0.9,20,   -10,0,0);
            }//translate
            
            //to float
            //yCyl(1.8,20,    10,0,length-5,   90);
            yCone(2.8,5,    10,0,length-5,   90);
            yCone(2.8,5,    10,0,length-5,   90,0,180);
                
            //yCyl(1.8,20,    -10,0,length-5,   90);
            yCone(2.8,5,    -10,0,length-5,   90);
            yCone(2.8,5,    -10,0,length-5,   90,0,180);
            
           //to wings   
            
            for (i=[-length+30:15:-40]){                 
                yCone(2.8,5,    10,0,length-5+i,   90);
                yCone(2.8,5,    10,0,length-5+i,   90,0,180);                
                
                yCone(2.8,5,    -10,0,length+i+(-10-i/50),   90);
                yCone(2.8,5,    -10,0,length+i+(-10-i/50),   90,0,180);
            }//for            
           
        }//difference 
        //yCone(2.8,5,    -10,2.8,length-5,   90);
        //yCube(100,5,0.1,   0,0,0, 0,-5,0);
        //yCube(100,5,0.1,   0,0,29.5, 0,-8,0);
        //yCube(100,5,0.1,   0,0,59, 0,-11,0);
        if(isAdhesion){
            yCyl(5,0.4, chord/2+4,0,length-0.2);
            yCyl(5,0.4, -chord/2-4,0,length-0.2);
            yCyl(5,0.4, 10,chord*0.24/2+2,length-0.2);
            yCyl(5,0.4, 10,-chord*0.24/2-2,length-0.2);
         }//isAdhesion
         
            
    }//transform
}//module            

