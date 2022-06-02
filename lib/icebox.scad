$fs = 0.1;

module squircle(size = [1, 1, 1], r = 0.5, center = false) {
  x = size[0] - r * 2;
  y = size[1] - r * 2;
  z = size[2];
  
  translate(center ? [-(x / 2), -(y / 2), 0] : [r, r, 0])
  hull() {
    translate([0, 0, 0]) cylinder(z, r = r);
    translate([x, 0, 0]) cylinder(z, r = r);
    translate([0, y, 0]) cylinder(z, r = r);
    translate([x, y, 0]) cylinder(z, r = r);
  }
}

module icebox(title = ["ICEBox", 8], subtitle = ["Chip box", 6], 
              chip = [8, 8, 1], count = [1, 1], padsz = 15) {

  // chip box size
  box_x = chip[0];
  box_y = chip[1];
  box_z = chip[2];
  box_margin  = 1;
  box_padding = 4;
    
  // bottom pad size
  size_x = ((chip[0] + box_margin) * count[0]) + box_padding * 2 - box_margin;
  size_y = ((chip[1] + box_margin) * count[1]) + box_padding * 2 - box_margin;
  size_z = box_z + 1;
  
  // title size
  title_x = size_x - box_padding;
  title_y = size_y + (padsz - title[1]) / 2;
  
  // bottom pad
  squircle([size_x + padsz, size_y, 3], 6);

  // chip tray
  difference() {
    translate([1, 1, 3]) squircle([size_x - 2 + padsz, size_y - 2, 1], 6);
    
    for(x = [0 : count[0] - 1]) for(y = [0 : count[1] - 1]) {
      translate([box_padding + box_x * x + (box_margin * x), box_padding + box_y * y + (box_margin * y), 0]) 
      linear_extrude(5)
      square([box_x, box_y]);
    }
    
    // title
    rotate([0, 0, 270])
    translate([-title_x, title_y, 0])
    linear_extrude(5)
    text(title[0], title[1], font = "Liberation Sans:style=Bold", valign = "bottom");
    
    // subtitle
    rotate([0, 0, 270])
    translate([-title_x, title_y - title[1] - 2, 0])
    linear_extrude(5)
    text(subtitle[0], subtitle[1], font = "Liberation Sans", valign = "bottom");
  }
}
