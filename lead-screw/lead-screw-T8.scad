/**
 * T8 lead screw.
 * By: Neeraj Verma Mar 2020
 */

outer_diameter=22.2;
flange_height=3.55;
hole_diameter=3.5;
screw_height=15.2;
screw_diameter=10;

module leadscrew_T8() {
    $fn=35;

    module body() {
        difference() {
            cylinder(d=screw_diameter,h=screw_height);        
        }
        difference() {
            translate([0,0,1.5]) cylinder(d=outer_diameter,h=flange_height);
            translate([8,0,0]) cylinder(d=hole_diameter,h=10);
            translate([-8,0,0]) cylinder(d=hole_diameter,h=10);
            translate([0,8,0]) cylinder(d=hole_diameter,h=10);
            translate([0,-8,0]) cylinder(d=hole_diameter,h=10);        
        }
    }

    difference() {
        body();
        translate([0,0,-0.1]) cylinder(d=8,h=16);                
    }
}

leadscrew_T8();