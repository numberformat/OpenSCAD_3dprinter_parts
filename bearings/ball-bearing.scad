/**
 * This is a standard 608 Bearing. It's not designed to be printed. Use
 * it as a mock object in your designs.
 * 
 * Neeraj Verma April 2020
 */

module 3dpp_ball_bearing(
  inner_diameter = 8, 
  outer_diameter=22, 
  inner_size = 2.5, 
  outer_size = 2.5,
  width=7,
  bearing_size = 2.8,
  dust_covers=false) 
{
  $fn=50;
  rotate_extrude() 
  {
    difference() 
    {
      union()
      {
        translate([inner_size/2+inner_diameter/2,0,0]) 
          square([inner_size,width], center = true);
        
        translate([inner_size/2+outer_diameter/2,0,0]) 
          square([outer_size,width], center = true);

        if(dust_covers) translate([inner_diameter/2+inner_size,width/2-1.2,0]) 
          square([4.5,1]);

        if(dust_covers) mirror([0,1,0]) translate([inner_diameter/2+inner_size,width/2-1.2,0]) 
          square([4.5,1]);

      }  
      translate([inner_size/2+inner_diameter/2+bearing_size/2+inner_size-.4,0,0]) 
        circle( bearing_size);
    }
  }

  if(!dust_covers) {
  for ( ball = [0:45:360] )
  {
    rotate([0,0,ball]) 
    {
        translate([inner_size/2+inner_diameter/2+inner_size+0.6,0,0]) 
          sphere( r=bearing_size );
    }
  }        
    
  }

}

/**
 * The following module will help you cut holes for the axle.
 * Pass in an optional length to specify depth of the cut.
 **/
module 3dpp_ball_bearing_cut(length=10) {
  cylinder(d=8, h=length, center=true);
}

3dpp_ball_bearing(dust_covers=true);
//#3dpp_ball_bearing_cut(20);

