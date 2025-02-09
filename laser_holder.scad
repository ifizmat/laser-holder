

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