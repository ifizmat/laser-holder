// Lasers twin base for figures Lissagous.
// 23.06.2025
$fn = 64;


twin_lasers_base_set();

module twin_lasers_base_set() {
  difference() {
    base();
    holes();
  }
}

module base() {
  cube([33, 120, 2.8], true);
  translate([0, -120/2, 0])
  cylinder(h=2.8, d=33, center=true);
  translate([0, 120/2, 0])
  cylinder(h=2.8, d=33, center=true);
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