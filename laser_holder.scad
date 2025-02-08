

laser();
//holder();

module laser() {
  cylinder(d=9, h=65, $fn=64, center=true);
}

module holder() {
  difference() {
    translate([5, 5+1, 0])
    cube([50, 30, 50], center=true);
    cube([20, 20, 52], center=true);
  }
}
