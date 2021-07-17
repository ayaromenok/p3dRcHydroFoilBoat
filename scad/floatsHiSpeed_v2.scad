include <../../lib/lib2.scad>

//2print rotated in Y axis for better print
//floatHiSpeed_front_v2(pz=-60,ry=-90,rz=0);
//floatHiSpeed_front_top_v2(ry=-90,rz=0);
//floatHiSpeed_center_v2(pz=-60,ry=-90,rz=0);
//floatHiSpeed_front_top_v2_1(ry=-90,rz=90);
//floatHiSpeed_front_top_v2_1_2(ry=-90,rz=0);
//floatHiSpeed_center_top_v2_1(ry=-90,rz=0);
//floatHiSpeed_center_top_v2_3(ry=-90,rz=0);
//floatHiSpeed_v2_assmebly();

module floatHiSpeed_v2_assmebly(px=0,py=0,pz=0, rx=0,ry=0,rz=0){
    translate([(px),(py),pz])
    rotate([rx,ry,rz])
        rotate([0,90,0])
    {
        floatHiSpeed_front_v2();//132
        //floatHiSpeed_front_top_v2();
        floatHiSpeed_center_v2();
        floatHiSpeed_center_v2(0,-200,0);
        floatHiSpeed_front_top_v2_1(142,0,0,    0,180);
        floatHiSpeed_front_top_v2_1_2(142,0,0,    0,180);
        floatHiSpeed_center_top_v2_1(142,0,0,    0,180);
        floatHiSpeed_center_top_v2_2(142,-200,0,    0,180);
        floatHiSpeed_center_top_v2_1(142,-200,0,    0,180);
        floatHiSpeed_center_top_v2_3(142,-400,0,    0,180);
    }//transform
}//module


module floatHiSpeed_center_top_v2_3(px=0,py=0,pz=0, rx=0,ry=0,rz=0){
    translate([(px),(py),pz])
    rotate([rx,ry,rz])    
    {
        difference(){
            floatHiSpeed_center_top_v2_2();
            yCube(30,50,100,   90,-25);
        }
    }//transform
}//module


module floatHiSpeed_center_top_v2_1(px=0,py=0,pz=0, rx=0,ry=0,rz=0){
    translate([(px),(py),pz])
    rotate([rx,ry,rz])    
    {
    difference(){        
            yCube(3,116,78,    82,-100,0);
            //connectors            
            yCyl(1.5,26,  80,-47,37, 0,90,0);
            yCyl(1.5,26,  80,-47,-37, 0,90,0);
            yCyl(1.5,26,  80,-103,37, 0,90,0);
            yCyl(1.5,26,  80,-103,-37, 0,90,0);          
            yCyl(1.5,26,  80,-153,37, 0,90,0);
            yCyl(1.5,26,  80,-153,-37, 0,90,0); 
        }//difference
        yTube(3.5,1.5,3,  83,-47,37, 0,90,0);
        yTube(3.5,1.5,3,  83,-47,-37, 0,90,0);
        yTube(3.5,1.5,3,  83,-103,37, 0,90,0);
        yTube(3.5,1.5,3,  83,-103,-37, 0,90,0);          
        yTube(3.5,1.5,3,  83,-153,37, 0,90,0);
        yTube(3.5,1.5,3,  83,-153,-37, 0,90,0); 
        
    }//transform
}//module



module floatHiSpeed_center_top_v2_2(px=0,py=0,pz=0, rx=0,ry=0,rz=0){
    translate([(px),(py),pz])
    rotate([rx,ry,rz])    
    {
    difference(){        
            yCube(3,84,78,    82,0,0);
            //connectors            
            yCyl(1.5,26,  80,37,37, 0,90,0);
            yCyl(1.5,26,  80,37,-37, 0,90,0);
            yCyl(1.5,26,  80,3,37, 0,90,0);
            yCyl(1.5,26,  80,3,-37, 0,90,0);          
            yCyl(1.5,26,  80,-3,37, 0,90,0);
            yCyl(1.5,26,  80,-3,-37, 0,90,0); 
            yCyl(1.5,26,  80,-37,37, 0,90,0);
            yCyl(1.5,26,  80,-37,-37, 0,90,0);          
        
        }//difference
        yTube(3.5,1.5,3,  83,37,37, 0,90,0);
        yTube(3.5,1.5,3,  83,37,-37, 0,90,0);
        yTube(3.5,1.5,3,  83,3,37, 0,90,0);
        yTube(3.5,1.5,3,  83,3,-37, 0,90,0);          
        yTube(3.5,1.5,3,  83,-3,37, 0,90,0);
        yTube(3.5,1.5,3,  83,-3,-37, 0,90,0); 
        yTube(3.5,1.5,3,  83,-37,37, 0,90,0);
        yTube(3.5,1.5,3,  83,-37,-37, 0,90,0);          
        yCube(5,16,70,    85.5,,-0);
        for (i=[-30:20:40]){
            yTube(3.5,0.7,20,    92.5,i,10, 0,90,0);
            yTube(3.5,0.7,20,    92.5,i,-10,0,90,0);
            yCube(20,1,18,    92.5,i,0);
            yCube(20,1,18,    92.5,i,00);
         }//for
         for (i=[-20:20:20]){
            yCube(20.0,18,1,    92.5,i,10);
            yCube(20.0,18,1,    92.5,i,-10);
         }//for    
    }//transform
}//module

module floatHiSpeed_front_top_v2_1(px=0,py=0,pz=0, rx=0,ry=0,rz=0){
    translate([(px),(py),pz])
    rotate([rx,ry,rz])    
    {
        difference(){
            yCyl(40,23, 93,0,0,  0,90,0, $fn=100, sy=5);
            yCyl(39,22, 95,0,0,  0,90,0, $fn=100, sy=5);
            yCube(70,250,100,    78,-83,0);
            yCube(20,250,100,    100,63,0, 0,0,-7);
            //connectors
            yCyl(3.5,26,  98,196,0, 0,90,0);
            yCyl(1.4,26,  80,197,0, 0,90,0);
            yCyl(1.4,26,  80,102,31, 0,90,0);
            yCyl(1.4,26,  80,102,-31, 0,90,0);
            yCyl(1.4,26,  80,47,35, 0,90,0);
            yCyl(1.4,26,  80,47,-35, 0,90,0);          
        
        }//difference
        
        yTube(3.5,1.4,3,  85,197,0, 0,90,0);
        yTube(3.5,1.4,3,  85,102,31, 0,90,0);
        yTube(3.5,1.4,3,  85,102,-31, 0,90,0);
        yTube(3.5,1.4,3,  85,47,35, 0,90,0);
        yTube(3.5,1.4,3,  85,47,-35, 0,90,0);
        
        /*
        yCube(20.0,18,1,    92.5,60,10);
        yCube(20.0,18,1,    92.5,60,-10);
        yCube(20,1,18,    92.5,50,0);
        yCube(20,1,18,    92.5,70,00);
        for (i=[50:20:80]){
            yTube(3.5,0.7,20,    92.5,i,10, 0,90,0);
            yTube(3.5,0.7,20,    92.5,i,-10,0,90,0);
         }//for           
        */
    }//transform
}//module

module floatHiSpeed_front_top_v2_1_2(px=0,py=0,pz=0, rx=0,ry=0,rz=0){
    translate([(px),(py),pz])
    rotate([rx,ry,rz])    
    {
        difference(){        
            yCube(3,84,78,    82,0,0);
            //connectors            
            yCyl(1.5,26,  80,37,35, 0,90,0);
            yCyl(1.5,26,  80,37,-35, 0,90,0);
            yCyl(1.5,26,  80,3,37, 0,90,0);
            yCyl(1.5,26,  80,3,-37, 0,90,0);          
            yCyl(1.5,26,  80,-3,37, 0,90,0);
            yCyl(1.5,26,  80,-3,-37, 0,90,0); 
            yCyl(1.5,26,  80,-37,37, 0,90,0);
            yCyl(1.5,26,  80,-37,-37, 0,90,0);          
        
        }//difference
        yTube(3.5,1.5,3,  83,37,35, 0,90,0);
        yTube(3.5,1.5,3,  83,37,-35, 0,90,0);
        yTube(3.5,1.5,3,  83,3,37, 0,90,0);
        yTube(3.5,1.5,3,  83,3,-37, 0,90,0);          
        yTube(3.5,1.5,3,  83,-3,37, 0,90,0);
        yTube(3.5,1.5,3,  83,-3,-37, 0,90,0); 
        yTube(3.5,1.5,3,  83,-37,37, 0,90,0);
        yTube(3.5,1.5,3,  83,-37,-37, 0,90,0);          
        
        yCube(5,16,70,    85.5,0,00);
        
        for (i=[-30:20:40]){
            yTube(3.5,0.7,20,    92.5,i,10, 0,90,0);
            yTube(3.5,0.7,20,    92.5,i,-10,0,90,0);
            yCube(20,1,18,    92.5,i,0);
            yCube(20,1,18,    92.5,i,00);
         }//for
         for (i=[-20:20:20]){
            yCube(20.0,18,1,    92.5,i,10);
            yCube(20.0,18,1,    92.5,i,-10);
         }//for           
    }//transform
}//module

module floatHiSpeed_front_v2(px=0,py=0,pz=0, rx=0,ry=0,rz=0){
    translate([(px),(py),pz])
    rotate([rx,ry,rz])    
    {
        scale([1.2,1,1])
        union(){
            difference(){
                intersection(){
                    yCyl(40,60, 80,0,0,  0,90,0, $fn=100, sy=5);
            
                    translate([-310,0,0])
                    rotate_extrude(angle=40,convexity = 10, $fn = 200)
                    translate([400, 0, 0])
                
                    polygon( points=[[0,30],[20,0],[0,-30], [4,-40],[-40,-44],[-40,44], [4,40]]);
                }//intersection
                translate([-1.50,0])
                intersection(){
                    yCyl(38.9,60, 80,0,0,  0,90,0, $fn=100, sy=5.1);
            
                    translate([-310,0,0])
                    rotate_extrude(angle=40,convexity = 10, $fn = 200)
                    translate([400, 0, 0])                
                        polygon( points=[[0,30],[20,0],[0,-30], [4,-40],[-40,-44],[-40,44], [4,40]]);
                }//intersection
            }//difference
        
            //nervure from front
            //1st 
            translate([76,150,0])
            rotate([90,0,0])
            linear_extrude(1)
                polygon( points=[[-13,26],[6,0], [-13,-26],[-26,-26],[-26,26]]);
            //2nd(middle)
            translate([76,100,0])
            rotate([90,0,0])
            linear_extrude(1)
                polygon( points=[[0,30],[20,0],[0,-30], [0,-34],[-26,-34],[-26,34], [0,34]]);
            //3rd
            translate([86,50,0])
            rotate([90,0,0])
            linear_extrude(1)
                polygon( points=[[0,30],[20,0],[0,-30], [4,-38],[-36,-38],[-36,38], [4,38]]);
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
        
            //connectors from front 
            yTube(2.5,0.7,6,  53,197,0, 0,90,0);
            
            yTube(2.5,0.7,6,  53,102,31, 0,90,0);
            yTube(2.5,0.7,6,  53,102,-31, 0,90,0);
            
            yTube(2.5,0.7,6,  53,47,35, 0,90,0);
            yTube(2.5,0.7,6,  53,47,-35, 0,90,0);
            
            yTube(2.5,0.7,6,  53,37,35, 0,90,0);
            yTube(2.5,0.7,6,  53,37,-35, 0,90,0);
        
            yTube(2.5,0.7,6,  53,3,37, 0,90,0);
            yTube(2.5,0.7,6,  53,3,-37, 0,90,0);
        
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
            
            yCube(50,50,100,    80,18,0);
            //connectors
            yCyl(1.2,26,  80,197,0, 0,90,0);
            yCyl(2.5,26,  87,197,0, 0,90,0);
            
            yCyl(1.2,26,  80,102,31, 0,90,0);
            yCyl(1.2,26,  80,102,-31, 0,90,0);
            yCyl(2.5,26,  87,102,31, 0,90,0);
            yCyl(2.5,26,  87,102,-31, 0,90,0);
            
            yCyl(1.2,26,  80,47,35, 0,90,0);
            yCyl(1.2,26,  80,47,-35, 0,90,0);
            yCyl(2.5,26,  87,47,35, 0,90,0);
            yCyl(2.5,26,  87,47,-35, 0,90,0);
        
            //lighters            
          /*  
            translate([0,140,0])
            scale([1,1.2,1])
            rotate([45,0,0])
                yCone(30,17,    79,0,0, 0,90,0,  $fn=4);                         
            
            translate([0,90,0])
            scale([1,1,1])
            rotate([45,0,0])
                yCone(40,24,    82,0,0, 0,90,0,  $fn=4);
            */
            yCyl(10,10, 73,185,0,    90,0,0, 0.4,,$fn=3);
            yCyl(16,10, 73,175,0,    90,0,0, 0.4,,$fn=3);    
            yCyl(21,10, 73,165,0,    90,0,0, 0.4,,$fn=3);    
            yCyl(26,10, 73,155,0,    90,0,0, 0.4,,$fn=3);    
            
            yCyl(32,10, 73,144,0,    90,0,0, 0.4,,$fn=3);                
            yCyl(36,10, 73,134,0,    90,0,0, 0.4,,$fn=3);
            yCyl(41,10, 72.5,124,0,    90,0,0, 0.4,,$fn=3);
            yCyl(44,10, 72.5,114,0,    90,0,0, 0.4,,$fn=3);
            yCyl(47,9, 72.5,104.5,0,    90,0,0, 0.4,,$fn=3);
            
            yCyl(52,10, 72.5,94,0,    90,0,0, 0.4,,$fn=3);
            yCyl(53,10, 72.5,84,0,    90,0,0, 0.4,,$fn=3);
            yCyl(53,12, 72.5,74,0,    90,0,0, 0.4,,$fn=3);
            yCyl(54,18, 72.5,59,0,    90,0,0, 0.4,,$fn=3);       
            
            for (i=[10:20:80]){
                yCyl(0.9,30,    90,i,10, 0,90,0);
                yCyl(0.9,30,    90,i,-10,0,90,0);
            }//for
        }//difference
      
           
    }//transform
}//module

module floatHiSpeed_center_v2(px=0,py=0,pz=0, rx=0,ry=0,rz=0){
    translate([(px),(py),pz])
    rotate([rx,ry,rz]){
        scale([1.2,1,1])    
        union(){
            difference(){
                union(){
                    difference(){
                        translate([90,0,0])
                        rotate([90,0,0])
                        linear_extrude(200)
                        polygon( points=[[0,30],[20,0],[0,-30], [4,-40],[-40,-40],[-40,40], [4,40]]);
                
                        translate([45+43.8,-1.5,0])
                        rotate([90,0,0])
                        linear_extrude(195.6)
                            polygon( points=[[0,30],[20,0],[0,-30], [4,-38.9],[-40,-38.9],[-40,38.9], [4,38.9]]);
                    }//difference
                    yCube(6,3,70,  53,-3,0);    
                    yCube(6,3,70,  53,-198,0);    
                    yCube(4,200,4,  52,-100,37);    
                    yCube(4,200,4,  52,-100,-37);    
                }//union
                
                yCyl(0.8,6,  53,-3,27, 90,90,0);
                yCyl(0.8,6,  53,-3,-27, 90,90,0);
                yCyl(1.5,6,  53,-198,27, 90,90,0);
                yCyl(1.5,6,  53,-198,-27, 90,90,0);
                
                //connectors from front ot back            
                yCyl(0.7,16,  53,-3,37, 0,90,0);
                yCyl(0.7,16,  53,-3,-37, 0,90,0);
            
                yCyl(0.7,16,  53,-37.9,37, 0,90,0);
                yCyl(0.7,16,  53,-37.9,-37, 0,90,0);
            
                yCyl(0.7,16,  53,-47.9,37, 0,90,0);
                yCyl(0.7,16,  53,-47.9,-37, 0,90,0);
            
                yCyl(0.7,16,  53,-103,37, 0,90,0);
                yCyl(0.7,16,  53,-103,-37, 0,90,0);
            
                yCyl(0.7,16,  53,-153,37, 0,90,0);
                yCyl(0.7,16,  53,-153,-37, 0,90,0);
            
                yCyl(0.7,16,  53,-163,37, 0,90,0);
                yCyl(0.7,16,  53,-163,-37, 0,90,0);
            
                yCyl(0.7,16,  53,-197,37, 0,90,0);
                yCyl(0.7,16,  53,-197,-37, 0,90,0);
            }//difference
            
            //nervure from front
            //2st 
            translate([90,-50,0])
            rotate([90,0,0])
            linear_extrude(1)
                polygon( points=[[0,30],[20,0],[0,-30], [4,-40],[-40,-40],[-40,40], [4,40]]);
            translate([90,-100,0])
            rotate([90,0,0])
            linear_extrude(1)
                polygon( points=[[0,30],[20,0],[0,-30], [4,-40],[-40,-40],[-40,40], [4,40]]);
            translate([90,-150,0])
            rotate([90,0,0])
            linear_extrude(1)
                polygon( points=[[0,30],[20,0],[0,-30], [4,-40],[-40,-40],[-40,40], [4,40]]);
            
            
        }//union
    }//transform
}//module
