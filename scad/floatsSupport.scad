include <../../lib/lib2.scad>


//2print
//floatSupport(pz=-56,ry=180);
//floatHiSpeed_front_v2sup(ry=90);
//floatSupportWing();
//floatSupportWingFront_v3(rz=-45, ry=180);
//floatSupportWingFront_v3();
//floatSupportWingFront(rz=45);
//floatSupportWingFront(rz=45,mx=1);
//floatSupport();

//floatHiSpeed_front_v2sup();
//floatSupportConnector_L(rx=90);
//floatSupport_top(ry=180,rx=-15);
module floatSupport_top(px=0,py=0,pz=0, rx=0,ry=0,rz=0){
    translate([(px),(py),pz])
    rotate([rx,ry,rz])  
    {
        difference(){
            rotate([0,90,0])
            scale([0.9,0.5,0.6]){                
                    scale([1.2,1.2,1])
                    floatHiSpeed_front_v2sup(px=-18);//132
            }//scale
            yCube(100,200,100,  0,50,-123.7);               
            yCube(50,150,50,  0,50,-34, 15,0,0);               
            
            difference(){
                yCyl(22,80, 00,-1,-40,  0,0,0, $fn=40, sy=5.4);
                yCube(30,50,40, 26,105,-65, 17,10,30);
                yCube(30,50,40, -26,105,-65, 17,-10,-30);
            }//difference    
        }//difference    
        
    }//transform
}//module

module floatSupportConnector_L(px=0,py=0,pz=0, rx=0,ry=0,rz=0){
    translate([(px),(py),pz])
    rotate([rx,ry,rz])  
    {
        difference(){
            minkowski(){
                yPoly(p=[[0,0],[32,0],[32,4],[4,4],[4,24],[0,24]], szz=24);
                ySphere(2);
            }
         for (i=[2:20:42]){
                yCyl(0.8,20,    0,i,2, 0,90,0);
                yCyl(0.8,20,    0,i,22, 0,90,0);
                
                yCyl(0.8,20,    i+8,0,2, 0,90,90);
                yCyl(0.8,20,    i+8,0,22, 0,90,90);
            }//for   
        }
    }//transform
}//module

module floatSupportWingFront_v3(px=0,py=0,pz=0, rx=0,ry=0,rz=0, mx=0,my=0,mz=0){
    translate([(px),(py),pz])
    rotate([rx,ry,rz])
    mirror([mx,my,mz])  
    {
        difference(){
            union(){
                yCube(80,40,16, 0,20,8);
                yMinkCubeSphere(13.1,220,12,  5,  20,106,10, 0,0,0, sx=1.5);
                yMinkCubeSphere(13.1,220,12,  5,  -20,106,10, 0,0,0, sx=1.5);
                yMinkCubeSphere(56,36,20,  4,  0,200,6);
                yCube(80,40,8, 0,200,0);
            }//union
            
            //support float
            for (i=[-30:20:30]){
                yCyl(1.5,30,    i,190,5,    0,0);     
                yCyl(1.5,30,    i,210,-5,    0,0);  
                yCyl(3.5,30,    i,190,15,    0,0); 
                yCyl(3.5,30,    i,210,15,    0,0);       
                yCone(3.5,5,    i,190,-2.4,    180,0);     
                yCone(3.5,5,    i,210,-2.4,    180,0);           
                //to fuselage/etc    
                yCyl(0.8,20,    i,10,11);
                yCyl(0.8,20,    i,30,11);
            }//for
            
            //main float
            yCyl(1.5,30,  37,37,0, 0,0,0);
            yCyl(5,30,  37,37,23, 0,0,0);
            yCone(5,5,  37,37,6, 0,180,0);            
            
            yCyl(1.5,30,  3,37,0, 0,0,0);
            yCyl(5,30,  3,37,23, 0,0,0);
            yCone(5,5,  3,37,6, 0,180,0);
            
            yCyl(1.5,30,  -3,37,5, 0,0,0);
            yCyl(5,30,  -3,37,23, 0,0,0);
            yCone(5,5,  -3,37,6, 0,180,0);
            
            yCyl(1.5,30,  -37,37,0, 0,0,0);          
            yCyl(5,30,  -37,37,23, 0,0,0);
            yCone(5,5,  -37,37,6, 0,180,0);
            
            
            //cuts: central section
            //yCyl(11,100,    0,20,50, sx=2.1);
            //yCube(48,40,40, 0,0,10);             
            yCube(100,20,30,    0,-10,15);
            //cuts: around support float
            yCube(100,20,50,    0,210,20, 45,0,0);
            yCube(50,50,20,    0,200,-15, 0,0,0);
        }//difference 
        
        
    }//transform
}//module
module floatSupportWingFront(px=0,py=0,pz=0, rx=0,ry=0,rz=0, mx=0,my=0,mz=0){
    translate([(px),(py),pz])
    rotate([rx,ry,rz])  
    mirror([mx,my,mz])
    {
        difference(){
            union(){
                floatSupportWing();
                yCube(83,40,10, 0,20,0);
                yMinkCubeSphere(36,16,22,  4,  20,32,12);
            }//union        
            
            //main float
            yCyl(5,30,  37,37,15, 0,0,0);
            yCyl(1.5,30,  37,37,0, 0,0,0);
            yCyl(5,30,  3,37,15, 0,0,0);
            yCyl(1.5,30,  3,37,0, 0,0,0);
            yCyl(5,30,  -3,37,15, 0,0,0);
            yCyl(1.5,30,  -3,37,5, 0,0,0);          
            yCyl(5,10,  -37,37,05, 0,0,0);
            yCyl(1.5,30,  -37,37,0, 0,0,0);
            //to fuselage/etc
            for (i=[-30:20:30]){
                yCyl(0.8,10,    i,10,2);
                yCyl(0.8,10,    i,30,2);
            }//for   
        }//difference    
    
    }//transform
}//module
        
module floatSupportWing(px=0,py=0,pz=0, rx=0,ry=0,rz=0, mx=0,my=0,mz=0){
    translate([(px),(py),pz])
    rotate([rx,ry,rz])
    mirror([mx,my,mz])  
    {
        difference(){
            union(){
                yCube(40,40,10, 0,20,0);
                yMinkCubeSphere(10.1,170,12,  5,  10,110,20, 0,0,8, sx=2.5);
                yMinkCubeSphere(36,36,10,  4,  0,200,0);
                yMinkCubeSphere(36,12,20,  4,  0,190,10);
            }//union
            //main float
            yCyl(5,10,  33.5/2,37,5, 0,0,0);
            yCyl(1.5,30,  33.5/2,37,0, 0,0,0);
            yCyl(5,10,  -33.5/2,37,5, 0,0,0);
            yCyl(1.5,30,  -33.5/2,37,5, 0,0,0);          
            //support float
            yCyl(1.8,20,    10,210,0,    0,0);     
            yCyl(1.8,20,    -10,210,0,    0,0);  
            yCyl(3.8,30,    10,210,15,    0,0);     
            yCyl(3.8,30,    -10,210,15,    0,0);  
            yCyl(1.8,20,    10,190,5,    0,0);     
            yCyl(1.8,20,    -10,190,5,    0,0);  
            yCyl(3.8,30,    10,190,15,    0,0);     
            yCyl(3.8,30,    -10,190,15,    0,0);  
        }//difference                  
    }//transform
}//module
    
module floatSupport(px=0,py=0,pz=0, rx=0,ry=0,rz=0){
    translate([(px),(py),pz])
    rotate([rx,ry,rz])  
    {
        difference(){
            rotate([0,90,0])
            scale([0.9,0.5,0.6]){
                union(){
                    scale([1.2,1.2,1])
                    floatHiSpeed_front_v2sup(px=-18);//132
                    //floatHiSpeed_front_top_v2(132,0,0,  0,180,0);
                    scale([1,0.8,1])
                    floatHiSpeed_center_v2sup(22);                    
                }//union
            }//scale
            yCube(100,200,100,  0,50,-23.7);   
            for (i=[-70:20:0]){                     
                yCyl(0.8,20,    20,i,-80,    0,90);     
                yCyl(0.8,20,    -20,i,-80,    0,90);  
                
                yCyl(0.8,20,    10,i,-80,    0,0);     
                yCyl(0.8,20,    -10,i,-80,    0,0);     
            }//for                    
        }//difference     
    }//transform
}//module



module floatHiSpeed_front_v2sup(px=0,py=0,pz=0, rx=0,ry=0,rz=0){
    translate([(px),(py),pz])
    rotate([rx,ry,rz])    
    {
     //scale([0.9,0.5,0.6])
        scale([1.4,1,1])        
            difference(){
                intersection(){
                    yCyl(40,80, 80,0,0,  0,90,0, $fn=100, sy=5);
            
                    translate([-310,0,0])
                    rotate_extrude(angle=40,convexity = 10, $fn = 200)
                    translate([400, 0, 0])
                
                    polygon( points=[[0,30],[20,0],[0,-30], [4,-40],[-40,-44],[-40,44], [4,40]]);                 
                }//intersection                
                //yCube(50,210,100,   36.6,100,0);
                //yCube(50,210,100,   87.1,100,0);
                //yCyl(37,30, 53,0,0,  0,90,0, $fn=100, sy=5);
            }//difference
            //yCyl(38,20, 80,0,0,  0,90,0, $fn=100, sy=5);
        //yCube(50,10,100,   62,00,0);
    }//transform
}//module


module floatHiSpeed_front_top_v2sup(px=0,py=0,pz=0, rx=0,ry=0,rz=0){
    translate([(px),(py),pz])
    rotate([rx,ry,rz])    
    {
        difference(){
            intersection(){
                yCyl(40,23, 83,0,0,  0,90,0, $fn=100, sy=5);
            
                translate([-710,0,0])
                rotate_extrude(angle=40,convexity = 10, $fn = 200)
                translate([800, 0, 0])                
                    polygon( points=[[0,40],[10,0],[0,-40],[-40,-44],[-40,44]]);
            }//intersection
            
            yCube(50,50,100,    1000,18,0);
        }//difference
    }//transform
}//module

module floatHiSpeed_center_v2sup(px=0,py=0,pz=0, rx=0,ry=0,rz=0){
    translate([(px),(py),pz])
    rotate([rx,ry,rz]){
        scale([1.2,1,1])    
        {
                
                        translate([90,0,0])
                        rotate([90,0,0])
                        linear_extrude(200)
                        polygon( points=[[0,30],[20,0],[0,-30], [4,-40],[-40,-40],[-40,40], [4,40]]);
                
        }//scale        
    }//transform
}//module
