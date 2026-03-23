// Lasers twin base for figures Lissagous.
// 23.06.2025
$fn = 64;


//twin_lasers_base_set();
// support
//vertical_print();
//support_set();
//mirror([1, 0, 0])
//support_set();
//screw_m1_4inch_hole_proof();

//hard();
//holes();
hard_set();

module hard_set() {
  difference() {
    rotate([0, 0, 90])
    hard();
    rotate([0, 0, 90])
    holes();
  }
}

module hard() {
  cube([33, 60, 2.8], true);
  translate([0, -60/2, 0])
  cylinder(h=2.8, d=33, center=true);
  translate([0, 60/2, 0])
  cylinder(h=2.8, d=33, center=true);
}

module support_set() {
  for(pos=[-2:1:2]) {
    translate([1.7, pos*31.5, -11])
    support();
  }
}

module support() {
  hull() {
    translate([2, 0, -33/2/3])
    rotate([90, 0, 0])
    linear_extrude(2, center=true)
    polygon([[0, 0], [0, 33/3], [10, 0]]);
    cylinder(d=0.5, h=33/3, $fn=64, center=true);
  }
}


module vertical_print() {
  rotate([0, 90, 0])
  twin_lasers_base_set();
  
}
module twin_lasers_base_set() {
  difference() {
    base();
    holes();
  }
}

module twin_lasers_base_set_proof() {
  difference() {
    base();
    holes_proof();
//    holes();
  }
}


module base() {
  cube([33, 120, 2.8], true);
  translate([0, -120/2, 0])
  cylinder(h=2.8, d=33, center=true);
  translate([0, 120/2, 0])
  cylinder(h=2.8, d=33, center=true);
}

module holes_proof() {
  screw_m1_4inch_hole_proof();
  translate([0, -120/2, 0])
  screw_m1_4inch_hole_proof();
  translate([0, -60/2, 0])
  screw_m1_4inch_hole_proof();
  translate([0, 60/2, 0])
  screw_m1_4inch_hole_proof();
  translate([0, 120/2, 0])
  screw_m1_4inch_hole_proof();
}

module holes() {
  cylinder(h=4, d=6.5, center=true);
  translate([0, -120/2, 0])
  cylinder(h=4, d=6.5, center=true);
  translate([0, -60/2, 0])
  cylinder(h=4, d=6.5, center=true);
  translate([0, 60/2, 0])
  cylinder(h=4, d=6.5, center=true);
  translate([0, 120/2, 0])
  cylinder(h=4, d=6.5, center=true);
}

module screw_m1_4inch_hole_proof() {
  rotate([0, 270, 0])
  hull(){
    translate([0, 0, 5.3])
    rotate([0, 90, 0])
    cylinder(d=0.5, h=31, $fn=64, center=true);
    
    rotate([0, 90, 0])
    cylinder(d=6.5, h=31, $fn=64, center=true);
  }
}