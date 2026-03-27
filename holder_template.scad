r_round_corners = 5;//4.5;// radius

point1 = [21, 23];
point2 = [21, -33];
point3 = [-9-1, -33];
point4 = [-9-1, -13.5];
point5 = [0, -18.5];
point6 = [10, -12.5];
point7 = [10, 13];
point8 = [-9-1, 13];
point9 = [-9-1, 23];

point1offset = [point1[0]-r_round_corners, point1[1]-r_round_corners];
point2offset = [point2[0]-r_round_corners, point2[1]+r_round_corners];
point3offset = [point3[0]+r_round_corners, point3[1]+r_round_corners];
point4offset = [point4[0]+r_round_corners, point4[1]+r_round_corners-2];
point5offset = [point5[0], point5[1]+r_round_corners];
point6offset = [point6[0]-r_round_corners, point6[1]+r_round_corners-3];
point7offset = [point7[0]-r_round_corners, point7[1]-r_round_corners];
point8offset = [point8[0]+r_round_corners, point8[1]-r_round_corners];
point9offset = [point9[0]+r_round_corners, point9[1]-r_round_corners];


big_holder_points_round = [
  point1offset,
  point2offset,
  point3offset,
  point4offset, 
  point5offset,
  point6offset,
  point7offset,
  point8offset,
  point9offset,
];

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

laser_hole_points_round = [
  point4offset, 
  point5offset,
  point6offset,
  point7offset,
  point8offset,
];

solid_plate_points = [
  point1,
  point2,
  point3,
  point9,
];

solid_plate_points_round = [
  point1offset,
  point2offset,
  point3offset,
  point9offset,
];

//translate([0, 0, -2])
//solid_plate();
//
//color("red")
//solid_plate_round();

translate([0, 0, -5])
color("pink")
big_holder_template();

disks_points_hole();

translate([0, 0, 3])
#offset(r=r_round_corners, $fn=32)
laser_hole_template_round();

module disks_points_hole() {
  for (point=laser_hole_points_round) {
    echo(point);
    translate(point)
    circle(r=2, $fn=32);
  }
}

module laser_hole_template_round() {
  color("green")
  rotate([0, 0, 0])
  polygon(laser_hole_points_round);
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
