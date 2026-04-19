r_round_corners = 3;//4.5;// radius

/*
    left     right
       _______ 
proof |       |
ceil   -----  |
            | |
            | |
floor |\   /  |
      | \ /   |
      |_______|
foot
right hole for nut 10 mm
*/
point_proof_left = [-10, 23];
point_proof_right = [21, 23];
point_foot_left = [-10, -33];
point_foot_right = [21, -33];
point_floor_left = [-10, -13.5-3];
point_floor_middle = [0, -18.5-3];
point_floor_right = [10, -12.5-3];
point_ceil_left = [-10, 13];
point_ceil_right = [10, 13];



point_proof_left_offset = [point_proof_left[0]+r_round_corners, point_proof_left[1]-r_round_corners];
point_proof_right_offset = [point_proof_right[0]-r_round_corners, point_proof_right[1]-r_round_corners];

point_foot_right_offset = [point_foot_right[0]-r_round_corners, point_foot_right[1]+r_round_corners];
point_foot_left_offset = [point_foot_left[0]+r_round_corners, point_foot_left[1]+r_round_corners];

point_floor_left_offset = [point_floor_left[0]+r_round_corners, point_floor_left[1]+r_round_corners-2];
point_floor_middle_offset = [point_floor_middle[0], point_floor_middle[1]+r_round_corners];
point_floor_right_offset = [point_floor_right[0]-r_round_corners, point_floor_right[1]+r_round_corners-3];

point_ceil_right_offset = [point_ceil_right[0]-r_round_corners, point_ceil_right[1]-r_round_corners];
point_ceil_left_offset = [point_ceil_left[0]+r_round_corners, point_ceil_left[1]-r_round_corners];



big_holder_points_round = [
  point_proof_right_offset,
  point_foot_right_offset,
  point_foot_left_offset,
  point_floor_left_offset, 
  point_floor_middle_offset,
  point_floor_right_offset,
  point_ceil_right_offset,
  point_ceil_left_offset,
  point_proof_left_offset,
];

big_holder_points = [
  point_proof_right  ,
  point_foot_right,
  point_foot_left,
  point_floor_left,
  point_floor_middle,
  point_floor_right,
  point_ceil_right,
  point_ceil_left,
  point_proof_left,
];

laser_hole_points = [
  point_ceil_right,
  point_ceil_left,
  point_floor_left,
  point_floor_middle,
  point_floor_right,
];

laser_hole_points_round = [
  point_floor_left_offset, 
  point_floor_middle_offset,
  point_floor_right_offset,
  point_ceil_right_offset,
  point_ceil_left_offset,
];

solid_plate_points = [
  point_proof_right,
  point_foot_right,
  point_foot_left,
  point_proof_left,
];

solid_plate_points_round = [
  point_proof_left_offset,
  point_proof_right_offset,
  point_foot_right_offset,
  point_foot_left_offset,
];

left_proof_points_round = [
  point_proof_left_offset,
  point_proof_right_offset,
 [point_ceil_right_offset[0],
  point_ceil_right_offset[1]+2*r_round_corners],
 [point_ceil_left_offset[0],
  point_ceil_left_offset[1]+2*r_round_corners],
//  point_ceil_left_offset[1]+9.5],
//  point_ceil_right_offset[1]+9.5],
];

left_floor_points = [
  [point_foot_left[0]+2.1,
  point_foot_left[1]+2.5],
  [point_floor_left[0]+2.1,
  point_floor_left[1]-3],
 [point_floor_middle[0],
  point_floor_middle[1]-3.41],
 [point_foot_right_offset[0],
  point_foot_right_offset[1]-1]
];

template_set();
//template_round();
//solid_plate_round();
//laser_hole_template_round();
//polygon(left_proof_points_round);

module template_set() {
  union() {
    template_round();

    translate([0, 0, 0])
    offset(r=r_round_corners, $fn=32)
    polygon(left_proof_points_round);
    
    translate([0, 1, 0])
    offset(r=2, $fn=32)
    polygon(left_floor_points);
    
  }
}

module template_round() {
  difference() {
    translate([0.1, 0, 0])
    solid_plate_round();
    laser_hole_template_round();
    translate([-10, 0])
    square([20, 55], center=true);
  }
}

module laser_hole_template_round() {
  color("green")
  offset(r=r_round_corners, $fn=32)
  polygon(laser_hole_points_round);
}


//translate([0, 0, -2])
//solid_plate();
//
//color("red")
//solid_plate_round();

//translate([0, 0, -5])
//color("pink")
//big_holder_template();
//
//disks_points_hole();
//
//translate([0, 0, 3])
//#offset(r=r_round_corners, $fn=32)
//laser_hole_template_round();




module disks_points_hole() {
  for (point=laser_hole_points_round) {
    echo(point);
    translate(point)
    circle(r=2, $fn=32);
  }
}

module solid_plate() {
  polygon(solid_plate_points);  
}

module solid_plate_round() {
  offset(r=r_round_corners, $fn=32)
  polygon(solid_plate_points_round);  
}


module disks_solid_points() {
  for (point=solid_plate_points) {
    echo(point);
    translate(point)
    circle(r=r_round_corners, $fn=32);
  }
}

module disks_points_offset() {
  for (point=big_holder_points_round) {
    echo(point);
    translate(point)
    circle(r=r_round_corners, $fn=32);
  }
}

module big_holder_template_round() {
  polygon(big_holder_points_round);
}

module disks_points() {
  for (point=big_holder_points) {
    echo(point);
    translate(point)
    circle(r=r_round_corners, $fn=32);
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
