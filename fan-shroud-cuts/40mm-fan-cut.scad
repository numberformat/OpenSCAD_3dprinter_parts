//import("ramps-enclosure.STL");

module p_fan40_cuts(height=3) {
  $fn=40;  
  cylinder(d=37, h=height, center=true);  
  translate([16,16,0]) cylinder(d=3.5, h=height, center=true);
  translate([-16,-16,,0]) cylinder(d=3.5, h=height, center=true);
  translate([-16,16,0]) cylinder(d=3.5, h=height, center=true);
  translate([16,-16,0]) cylinder(d=3.5, h=height, center=true);
}

module grill40(height=3) {
  
  for(i=[1:4]) {
    translate([i*7.2-18,0,0]) cube([3,40,height+0.1], center=true);    
  }
}

module fan40_cuts(height=20) {
  difference() {
    p_fan40_cuts();  
    grill40();
  }
}


fan40_cuts(height=20);      
