use <../lib/icebox.scad>
use <../lib/icebox-cover.scad>

chip_x = 26;
chip_y = 18;
chip_z = 4;
box_size = [2, 5];

icebox(
  chip   = [chip_x, chip_y, chip_z],
  count  = box_size
);

translate([0, 110, 0])
icebox_cover(
  chip   = [chip_x, chip_y, chip_z],
  count  = box_size
);
