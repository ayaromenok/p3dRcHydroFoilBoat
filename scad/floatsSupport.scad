include <../../lib/lib2.scad>


//2print
//floatSupport(ry=180);
//floatSupportWing();
//floatSupport();

        
module floatSupportWing(px=0,py=0,pz=0, rx=0,ry=0,rz=0){
    translate([(px),(py),pz])
    rotate([rx,ry,rz])  
    {
        difference(){
            union(){
                yCube(40,40,10, 0,20,0);
                yMinkCubeSphere(15,150,10,  4,  0,100,0, sx=2);
                yMinkCubeSphere(36,36,10,  4,  0,180,0);
            }//union
            //main float
            yCyl(5,10,  33.5/2,37,5, 0,0,0);
            yCyl(1.5,30,  33.5/2,37,0, 0,0,0);
            yCyl(5,10,  -33.5/2,37,5, 0,0,0);
            yCyl(1.5,30,  -33.5/2,37,5, 0,0,0);          
            //support float
            yCyl(1.8,20,    10,170,0,    0,0);     
            yCyl(1.8,20,    -10,170,0,    0,0);  
            yCyl(1.8,20,    10,190,0,    0,0);     
            yCyl(1.8,20,    -10,190,0,    0,0);  
        }//difference          
        
    }//transform
}//module
    
module floatSupport(px=0,py=0,pz=0, rx=0,ry=0,rz=0){
    translate([(px),(py),pz])
    rotate([rx,ry,rz])  
    {
        difference(){
            rotate([0,90,0])
            scale([0.5,0.3,0.5]){
                union(){
                    floatHiSpeed_front_v2();//132
                    floatHiSpeed_front_top_v2(132,0,0,  0,180,0);
                    floatHiSpeed_center_v2();
                    yCube(23,200,80,    49,-100,0);
                }//union
            }//scale
        
            for (i=[-50:20:20]){                     
                yCyl(0.8,20,    20,i,-25,    0,90);     
                yCyl(0.8,20,    -20,i,-25,    0,90);  
                
                yCyl(0.8,20,    10,i,-25,    0,0);     
                yCyl(0.8,20,    -10,i,-25,    0,0);     
            }//for
        }//difference        
    }//transform
}//module



module floatHiSpeed_front_v2(px=0,py=0,pz=0, rx=0,ry=0,rz=0){
    translate([(px),(py),pz])
    rotate([rx,ry,rz])    
    {
        scale([1.2,1,1])
        union(){
            
                intersection(){
                    yCyl(40,60, 80,0,0,  0,90,0, $fn=100, sy=5);
            
                    translate([-310,0,0])
                    rotate_extrude(angle=40,convexity = 10, $fn = 200)
                    translate([400, 0, 0])
                
                    polygon( points=[[0,30],[20,0],[0,-30], [4,-40],[-40,-44],[-40,44], [4,40]]);
                }//intersection
            
            //nervure from front            
            //4th (last)        
            difference(){
                union(){
                    translate([90,0,0])
                    rotate([90,0,0])
                    linear_extrude(1)
                        polygon( points=[[0,30],[20,0],[0,-30], [4,-40],[-40,-40],[-40,40], [4,40]]);
                    yCube(6,3,80,  53,1,0);    
                }//union
                yCyl(1.5,6,  53,0,27, 90,90,0);
                yCyl(1.5,6,  53,0,-27, 90,90,0);
            }//difference
        
            
        
            //    
            difference(){
                yCyl(40,4, 52,0,0,  0,90,0, $fn=100, sy=5);
                yCyl(37,6, 52,0,0,  0,90,0, $fn=100, sy=5.35);
                yCube(10,200,100,  52,-100,0);
            }//difference
            
        }//union
    }//transform
}//module


module floatHiSpeed_front_top_v2(px=0,py=0,pz=0, rx=0,ry=0,rz=0){
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

module floatHiSpeed_center_v2(px=0,py=0,pz=0, rx=0,ry=0,rz=0){
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
