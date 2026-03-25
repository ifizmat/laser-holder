r_round_corners = 2; // radius
//translate([-7.5, 0.1, -26])
//// https://github.com/ridercz/GoProScad
//import("M6_mount.stl");

point1 = [21, 23];
point2 = [21, -33];
point3 = [-9, -33];
point4 = [-9, -13.5];
point5 = [0, -18.5];
point6 = [10, -12.5];
point7 = [10, 13];
point8 = [-9, 13];
point9 = [-9, 23];
big_holder_points = [
  point1,
  point2,
  point3,
  point4,
  point5,
  point6,
  point7,
  point8,
  point9,
];

laser_hole_points = [
  point7,
  point8,
  point4,
  point5,
  point6,
];

//translate([0, 0, -27])
//rotate([0, 0, -90])
//big_holder();
offset(r=r_round_corners, $fn=32)
big_holder_template();
color("red")
big_holder_template();
//disks_points();
//laser_hole_template();

module disks_points() {
  for (point=big_holder_points) {
    echo(point);
    translate(point)
    circle(d=d_round_corners, $fn=32);
  }
}

module big_holder_template() {
  color("red")
  rotate([0, 0, 0])
  polygon(big_holder_points);
}

module laser_hole_template() {
  color("green")
  rotate([0, 0, 0])
  polygon(laser_hole_points);
}

//cut_big_holder2();
//hole_strong_block_set();
//round_block();

//cut_big_holder2();
//general_view();

module hole_strong_block_set() {
  hole_strong_block();
  translate([0, 0, -16])
  hole_strong_block();
  translate([0, 0, 16])
  hole_strong_block();
}

module hole_strong_block() {
  translate([0, 14, 0])
  screw_hole_proof2();
  translate([0, 14, 0])
  screw_hole_proof2();
  translate([37, 14, 0])
  nut_m4_hole();
}


module big_holder() {
  difference() {
    translate([5, 5+1, 0])
    //cube([50+6, 30, 50], center=true);
    round_block();
    cut_big_holder2();
  }
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
  hole_strong_block_set();
}

module screw_hole_proof2() {
  hull(){
    translate([0, 0, 3.8])
    rotate([0, 90, 0])
    cylinder(d=0.5, h=81, $fn=64, center=true);
    
    rotate([0, 90, 0])
    cylinder(d=4.5, h=81, $fn=64, center=true);
  }
}

module round_block() {
  ro = 8;
  hull() {
    cube([50+6-ro, 30-ro, 50], center=true);
    translate([(50+6)/2-ro/2, 30/2-ro/2, 0])
    cylinder(d=8, h=50, $fn=64, center=true);
    mirror([1, 0, 0])
    translate([(50+6)/2-ro/2, 30/2-ro/2, 0])
    cylinder(d=8, h=50, $fn=64, center=true);
    mirror([0, 1, 0])
    translate([(50+6)/2-ro/2, 30/2-ro/2, 0])
    cylinder(d=8, h=50, $fn=64, center=true);
    mirror([1, 0, 0])
    mirror([0, 1, 0])
    translate([(50+6)/2-ro/2, 30/2-ro/2, 0])
    cylinder(d=8, h=50, $fn=64, center=true);
  }
   //test size
//   translate([0, 0, -30])
//   cube([50+6, 30, 5], center=true);
  
}

module general_view() {
  color("gray")
  translate([0, -1, 31])
  rotate([0, 90, 0])
  laser();
  translate([0, 0, 37])
  rotate([0, 90, 0])
  big_holder();
  translate([0, 0, 0])
  rotate([0, 180, 0])
  gopro_leg_m6_center_mini();
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

module laser() {
  cylinder(d=18, h=65, $fn=64, center=true);
}

module test_gopro_leg_m6_center_mini() {
  test_gopro_base_m6_center_mini();
  translate([0, -3.4, 10.8])
  gopro_foot_trapez_mini2();
  translate([0, 3.4, 10.8])
  gopro_foot_trapez_mini2();
}

module test_gopro_base_m6_center_mini() {
  difference() {
    translate([-5, 0, 0])
    
    hull() {
      translate([(30-5)/2, (18-5)/2, 0])
      cylinder(d=5, h=5, $fn=64, center=true);
      mirror([1, 0, 0])
      translate([(30-5)/2, (18-5)/2, 0])
      cylinder(d=5, h=5, $fn=64, center=true);
      mirror([0, 1, 0])
      translate([(30-5)/2, (18-5)/2, 0])
      cylinder(d=5, h=5, $fn=64, center=true);
      mirror([1, 0, 0])
      mirror([0, 1, 0])
      translate([(30-5)/2, (18-5)/2, 0])
      cylinder(d=5, h=5, $fn=64, center=true);
      
      cube([30-5, 18-5, 5], center=true);
    }
    
    translate([-12, 0, 0])
    cylinder(d=4.5, h=31, $fn=64, center=true);
  }
}

module gopro_base_m6_center_mini() {
  difference() {
    translate([-15, 0, 0])
    
    hull() {
      translate([(90+30-5)/2, (18-5)/2, 0])
      cylinder(d=5, h=5, $fn=64, center=true);
      mirror([1, 0, 0])
      translate([(90+30-5)/2, (18-5)/2, 0])
      cylinder(d=5, h=5, $fn=64, center=true);
      mirror([0, 1, 0])
      translate([(90+30-5)/2, (18-5)/2, 0])
      cylinder(d=5, h=5, $fn=64, center=true);
      mirror([1, 0, 0])
      mirror([0, 1, 0])
      translate([(90+30-5)/2, (18-5)/2, 0])
      cylinder(d=5, h=5, $fn=64, center=true);
      
      cube([90+30-5, 18-5, 5], center=true);
    }
    
    translate([30, 0, 0])
    cylinder(d=7, h=31, $fn=64, center=true);
    translate([-12, 0, 0])
    cylinder(d=4.5, h=31, $fn=64, center=true);
    translate([-20, 0, 0])
    cylinder(d=4.5, h=31, $fn=64, center=true);
    translate([-30, 0, 0])
    cylinder(d=4.5, h=31, $fn=64, center=true);
    translate([-40, 0, 0])
    cylinder(d=4.5, h=31, $fn=64, center=true);
    translate([-50, 0, 0])
    cylinder(d=4.5, h=31, $fn=64, center=true);
    translate([-60, 0, 0])
    cylinder(d=4.5, h=31, $fn=64, center=true);
    translate([-70, 0, 0])
    cylinder(d=4.5, h=31, $fn=64, center=true);
  }
}

module gopro_leg_m6_center_mini() {
  gopro_base_m6_center_mini();
  translate([0, -3.4, 10.8])
  gopro_foot_trapez_mini2();
  translate([0, 3.4, 10.8])
  gopro_foot_trapez_mini2();
}

module gopro_foot_trapez_mini() {
  hull() {
    translate([0, 0, -8])
    cube([17, 2.8, 1], center=true);
    rotate([90, 0, 0])
    cylinder(d=14, h=2.5, $fn=64, center=true);
  }
}

module gopro_foot_trapez_mini2() {
  difference() {
    gopro_foot_trapez_mini();
    translate([0, -11, 0])    
    rotate([0, 0, 90])
    screw_m5_hole_proof();
  }
}



module big_screw_holes() {
// up hole center
  translate([-8, 0, 0])
 screw_hole_proof();

// up hole right
  translate([-8, 0, 16])
 screw_hole_proof();

// up hole left
  translate([-8, 0, -16])
  screw_hole_proof();

//  screw_hole();
// right hole
  translate([0, 6, 0])
  rotate([0, 0, 90])
  screw_hole_proof();
//  screw_hole();

// down hole center
  translate([18, 0, 0])
  screw_hole_proof();

// down hole right
  translate([18, 0, 16])
  screw_hole_proof();

// down hole left
  translate([18, 0, -16])
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
    rotate([180, 0, 90])
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

module gopro_base_m6_center() {
  difference() {
    translate([-15, 0, 0])
    cube([90+30, 18, 5], center=true);
    translate([30, 0, 0])
    cylinder(d=7, h=31, $fn=64, center=true);
    translate([-20, 0, 0])
    cylinder(d=4.5, h=31, $fn=64, center=true);
    translate([-30, 0, 0])
    cylinder(d=4.5, h=31, $fn=64, center=true);
    translate([-40, 0, 0])
    cylinder(d=4.5, h=31, $fn=64, center=true);
    translate([-50, 0, 0])
    cylinder(d=4.5, h=31, $fn=64, center=true);
    translate([-60, 0, 0])
    cylinder(d=4.5, h=31, $fn=64, center=true);
    translate([-70, 0, 0])
    cylinder(d=4.5, h=31, $fn=64, center=true);
  }
}

module gopro_leg_m6_center() {
  gopro_base_m6_center();
//  translate([-10, -2.9, -17.8])
  translate([0, -2.9, -17.8])
  gopro_foot_trapez2();
//  translate([-10, -2.9, -17.8])
  translate([0, 2.9, -17.8])
  gopro_foot_trapez2();
}

//translate([0, 6.5, 15.5])
//translate([0, -10, 0])
//gopro_foot();
//gopro_foot_trapez();
//gopro_foot_trapez2();

//translate([0, 6.5, 15.5])
//rotate([0, -65, 0])
//translate([0, 3.5, -17.5])
//gopro_leg_m6();
//gopro_leg();

//gopro_base_m6_center();
//rotate([180, 0, 0])
//gopro_leg_m6_center();

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
//screw_hole();
//rotate([0, 90, 0])
//cylinder(d=6.5, h=31, $fn=4, center=true);

//nut_m4_hole();
//laser();
//translate([0, 0, 55])
//holder();

//translate([-40, 0, 37])
//rotate([0, 90, 0])
//big_holder();

//translate([0, 0, 55])
//cut_big_holder();
//
//cut_big_holder2();

//gutter();
//gutter2();

//gopro_foot_trapez2();
//gopro_foot_trapez_mini2();

//translate([0, 0, -5])
//gopro_leg_m6_center_mini();

//test_gopro_base_m6_center_mini();
//test_gopro_leg_m6_center_mini();

//translate([0, 0, -5])
//gopro_base_m6_center();
//gopro_base_m6_center_mini();
