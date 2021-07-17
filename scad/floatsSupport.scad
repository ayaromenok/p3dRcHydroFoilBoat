include <../../lib/lib2.scad>
include<floatsHiSpeed_v2.scad>

//2print
//floatSupport(ry=180);

module floatSupport(px=0,py=0,pz=0, rx=0,ry=0,rz=0){
    translate([(px),(py),pz])
    rotate([rx,ry,rz])  
    {
        difference(){
            rotate([0,90,0])
            scale([0.5,0.3,0.5]){
                floatHiSpeed_front_v2();//132
                floatHiSpeed_front_top_v2(132,0,0,  0,180,0);
                floatHiSpeed_center_v2();
                yCube(28,244,80,    51.5,-78,0);
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

