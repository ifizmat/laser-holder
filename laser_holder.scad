//translate([-7.5, 3.3, 0])
//// https://github.com/ridercz/GoProScad
//import("M6_mount.stl");

//translate([0, 6.5, 15.5])
//translate([0, -10, 0])
//gopro_foot();
//gopro_foot_trapez();
//gopro_foot_trapez2();
//translate([0, 6.5, 15.5])
//rotate([0, -65, 0])
//gopro_leg_m6();
//gopro_leg();

//screw_m5_hole_proof();

//translate([0, 0, 15.5])
//rotate([90, 0, 0])
//cylinder(d=15, h=3.2, $fn=64, center=true);
//translate([0, 6.5, 15.5])
//rotate([90, 0, 0])
//cylinder(d=15, h=3.2, $fn=64, center=true);
//translate([0, 12, 34])
//gopro_base();

//translate([0, 18, 68])
//rotate([0, 90, 180])
//mini_holder();

//cut_mini_holder();
//camera_screw_hole();
//screw_holes();
//cut_holder();
//screw_hole_proof();
//translate([20, 0, 0])
//#screw_hole();
//rotate([0, 90, 0])
//cylinder(d=6.5, h=31, $fn=4, center=true);

//nut_m4_hole();
//laser();
translate([0, 0, 55])
holder();

big_holder();

//translate([0, 0, 55])
//cut_big_holder();
//
//cut_big_holder2();

//gutter();
//gutter2();

module laser() {
  cylinder(d=9, h=65, $fn=64, center=true);
}


module big_holder() {
  difference() {
    translate([5, 5+1, 0])
    cube([50+6, 30, 50], center=true);
    cut_big_holder2();
  }
}

module cut_big_holder() {
  translate([-3, 0, 0])  
  cube([20, 20, 52], center=true);
  translate([4.2, 0, 0])
  translate([3, 0, 0])  
  gutter2();
  translate([-3, 0, 0])
  screw_holes();
}

module cut_big_holder2() {
  hull() {
    translate([-10-3+5/2, 10-5/2, 0])
    cylinder(d=5, h=52, $fn=64, center=true);
    mirror([1, 0, 0])
    translate([-10-3+5/2, 10-5/2, 0])
    cylinder(d=5, h=52, $fn=64, center=true);
    mirror([0, 1, 0])
    translate([-10-3+5/2, 10-5/2, 0])
    cylinder(d=5, h=52, $fn=64, center=true);
    mirror([1, 0, 0])
    mirror([0, 1, 0])
    translate([-10-3+5/2, 10-5/2, 0])
    cylinder(d=5, h=52, $fn=64, center=true);

    translate([-3, 0, 0])
    cube([20-5/2, 20-5/2, 52], center=true);
  }
  translate([-3, -5/2, 0])  
  cube([20, 20-5/2, 52], center=true);
  translate([4.2, 0, 0])
  translate([3, 0, 0])  
  gutter2();
  big_screw_holes();
}

module big_screw_holes() {
// up hole 
  translate([-3, 0, 0])
  translate([-5, 0, 0])
 #screw_hole_proof();
//  screw_hole();
// right hole
  translate([0, 6, 0])
  rotate([0, 0, 90])
  screw_hole_proof();
//  screw_hole();
// down hole
  translate([15, 0, 0])
  screw_hole_proof();
//  screw_hole();
 
}

module mini_holder() {
  difference() {
    translate([5, 5+1, 0])
    cube([50, 30, 50], center=true);
    cut_mini_holder();
  }
}

module cut_mini_holder() {
  cut_holder();
// Cut for mini holder
  translate([5, 6, -20])
  cube([51, 31, 20], center=true);
  translate([5, 6, 20])
  cube([51, 31, 20], center=true);
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
 #screw_hole_proof();
//  screw_hole();
// right hole
  translate([0, 6, 0])
  rotate([0, 0, 90])
  screw_hole_proof();
//  screw_hole();
// down hole
  translate([15, 0, 0])
  screw_hole_proof();
//  screw_hole();
 
}

module screw_hole() {
  rotate([0, 90, 0])
  cylinder(d=4.5, h=31, $fn=64, center=true);
  nut_m4_hole();
}

module screw_hole_proof() {
  hull(){
    translate([0, 0, 3.8])
    rotate([0, 90, 0])
    cylinder(d=0.5, h=31, $fn=64, center=true);
    
    rotate([0, 90, 0])
    cylinder(d=4.5, h=31, $fn=64, center=true);
  }
  nut_m4_hole();
}


module screw_m5_hole_proof() {
  hull(){
    translate([0, 0, 3.8])
    rotate([0, 90, 0])
    cylinder(d=0.5, h=31, $fn=64, center=true);
    
    rotate([0, 90, 0])
    cylinder(d=5.5, h=31, $fn=64, center=true);
  }
}

module screw_m6_hole_proof() {
  hull(){
    translate([0, 0, 5])
    rotate([0, 90, 0])
    cylinder(d=0.5, h=31, $fn=64, center=true);
    
    rotate([0, 90, 0])
    cylinder(d=7, h=31, $fn=64, center=true);
  }
}

module nut_m4_hole() {
  //cylinder(d=8, h=20, $fn=64, center=true);
  rotate([0, 90, 0])
  cylinder(d=8.2, h=18, $fn=6, center=true);
}

module camera_screw_hole() {
  rotate([0, 90, 0])
  cylinder(d=6.5, h=31, $fn=64, center=true);
  camera_nut_hole();
}

module camera_nut_hole() {
  //cylinder(d=8, h=20, $fn=64, center=true);
  rotate([0, 90, 0])
  cylinder(d=12.2, h=18, $fn=6, center=true);
}

module gopro_foot() {
  translate([0, 0, 15/2])
  cube([15, 3.2, 15], center=true);
  difference() {
    rotate([90, 0, 0])
    cylinder(d=15, h=3.2, $fn=64, center=true);
    translate([0, -11, 0])    
    rotate([0, 0, 90])
    screw_hole_proof();
  }
  
}

module gopro_foot_trapez() {
  hull() {
    translate([0, 0, 15])
    cube([30, 3, 1], center=true);
    rotate([90, 0, 0])
    cylinder(d=15, h=2, $fn=64, center=true);
  }
}

module gopro_foot_trapez2() {
  difference() {
    gopro_foot_trapez();
    translate([0, -11, 0])    
    rotate([65, 0, 90])
    screw_m5_hole_proof();
  }
}

module gopro_base() {
  difference() {
    cube([30, 30, 5], center=true);
    translate([0, 6, 12])
    rotate([0, 90, 0])
    screw_hole_proof();
  }
}

module gopro_base_m6() {
  difference() {
    cube([30, 30, 5], center=true);
    translate([0, 6, 12])
    rotate([0, 90, 0])
    screw_m6_hole_proof();
  }
}

module gopro_leg() {
  translate([0, 6.9, 17.5])
  gopro_base();
  gopro_foot_trapez2();
  translate([0, -6.5, 0])    
  gopro_foot_trapez2();
}

module gopro_leg_m6() {
  translate([0, 6.9, 17.5])
  gopro_base_m6();
  translate([0, -0.8, 0])    
  gopro_foot_trapez2();
  translate([0, -6.5, 0])    
  gopro_foot_trapez2();
}
