use <../lib/icebox.scad>
use <../lib/icebox-cover.scad>

chip_x = 8;
chip_y = 8;
chip_z = 1;
box_size = [6, 10];

icebox(
  chip   = [chip_x, chip_y, chip_z],
  count  = box_size
);

translate([0, 110, 0])
icebox_cover(
  chip   = [chip_x, chip_y, chip_z],
  count  = box_size
);
