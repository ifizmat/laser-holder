
//screw_holes();
//cut_holder();
//screw_hole();
//nut_m4_hole();
//laser();
holder();
//gutter();
//gutter2();

module laser() {
  cylinder(d=9, h=65, $fn=64, center=true);
}

module holder() {
  difference() {
    translate([5, 5+1, 0])
    cube([50, 30, 50], center=true);
    cut_holder();
  }
}

module cut_holder() {
    cube([20, 20, 52], center=true);
    translate([4.2, 0, 0])
    gutter2();
    screw_holes();
//    translate([-6, 0, 0])
//    nut_m4_hole();
}

module gutter() {
  difference() {
    rotate([0, 0, 45])
    cube([20, 20, 52], center=true);
    translate([0, 18, 0])
    cube([20, 20, 53], center=true);
  }
}

module gutter2() {
  cylinder(d=23, h=53, center=true, $fn=6); 
}

module screw_holes() {
// up hole
  translate([-5, 0, 0])
  screw_hole();
// right hole
  translate([0, 6, 0])
  rotate([0, 0, 90])
  screw_hole();
// down hole
  translate([15, 0, 0])
  screw_hole();
 
}
module screw_hole() {
  rotate([0, 90, 0])
  cylinder(d=4.5, h=31, $fn=64, center=true);
  nut_m4_hole();
}

module nut_m4_hole() {
  //cylinder(d=8, h=20, $fn=64, center=true);
  rotate([0, 90, 0])
  cylinder(d=8.2, h=18, $fn=6, center=true);
}
