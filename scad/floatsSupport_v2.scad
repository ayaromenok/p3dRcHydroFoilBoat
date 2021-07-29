include <../../lib/lib2.scad>
include <../../dotSCAD/src/ring_extrude.scad>
//include <../../dotSCAD/src/rotate_p.scad>;
//include <../../dotSCAD/src/cross_sections.scad>;
//include <../../dotSCAD/src/polysections.scad>;


//floatHiSpeed_front_v3_top(sx=0.5,sy=0.5,sz=0.5);
 floatHiSpeed_front_v3(0,0,400,    0,90,-90);
module floatHiSpeed_front_v3(px=0,py=0,pz=0, rx=0,ry=0,rz=0, sx=1,sy=1,sz=1){
    translate([(px),(py),pz])
    rotate([rx,ry,rz])
    scale([sx,sy,sz]){   
        shape_pts =[[20,0], [-4,-70],[10,-80],[-60,-84],[-60,84], [10,80],[-4,70]];
        difference(){
            intersection(){
                
                union(){
                    ring_extrude(shape_pts, radius = 380, angle = 40, scale = 0.5, twist=-20, $fn=700);
                    ring_extrude(shape_pts, radius = 380, angle = 40, scale = 0.5, twist=20, $fn=700);
                
                    rotate_extrude(angle=40,convexity = 10, $fn = 200)
                    translate([380, 0, 0])
                    polygon( shape_pts);
                }//union
                translate([310,250,0])
                rotate([-90,0,0])
                rotate([0,90,0])
                linear_extrude(height=100)
                polygon(points=[[0,40],[250,80],[250,-80],[0,-40]]);
            }//intersection
            //yCube(100,300,200, 255,150,0);        
            //yCube(100,200,200, 73,-50,0);
        }//difference
        
    }//transform
}//module

module floatHiSpeed_front_v3_top(px=0,py=0,pz=0, rx=0,ry=0,rz=0, sx=1,sy=1,sz=1){
    translate([(px),(py),pz])
    rotate([rx,ry,rz])
    scale([sx,sy,sz]){   
        //translate([0,0,40])     
        //scale([1,1,1.3])
        //    difference(){
        //        intersection(){
                
                    yCyl(80,50,     0,0,0,  0,0,90, $fn=100, sy=2.5);
                    yCyl(40,200,    100,-40,-30, 0,80,20, sy=2);
                    
         /*           translate([-1,0,210])
                    rotate([0,90,-90])
                    rotate_extrude(angle=40,convexity = 10, $fn = 200)
                    translate([300, 0, 0])
                    polygon( points=[[20,0], [4,-80],[-60,-84],[-60,84], [4,80]]);
        */ 
        //       }//intersection
         /*       translate([0,0,1.5])
                intersection(){
                    yCyl(79,120, 0,0,-50,  0,0,90, $fn=100, sy=2.5);

                    translate([0,0,210])
                    rotate([0,90,-90])
                    rotate_extrude(angle=40,convexity = 10, $fn = 200)
                    translate([300, 0, 0])
                    polygon( points=[[20,0], [4,-80],[-60,-84],[-60,84], [4,80]]);
                }//intersection
                yCube(200,200,100, 100,0,20);    
            }//difference
       // }//union
       */
    }//transform
}//module