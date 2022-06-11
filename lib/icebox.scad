use <squircle.scad>
$fs = 0.1;

module icebox(chip = [8, 8, 1], count = [1, 1]) {

  assert(chip[0] > 0, "chip package width could not be 0.");
  assert(chip[1] > 0, "chip package height could not be 0.");
  assert(chip[2] > 0, "chip package thickness could not be 0.");

  assert(count[0] > 0, "row could not be 0.");
  assert(count[1] > 0, "column could not be 0.");

  // chip box size
  chip_x = chip[0];
  chip_y = chip[1];
  chip_z = chip[2];
  chip_margin  = 1;
  chip_padding = 4;

  // bottom pad size
  size_fixed_z = 3;
  size_x = ((chip[0] + chip_margin) * count[0]) + chip_padding * 2 - chip_margin;
  size_y = ((chip[1] + chip_margin) * count[1]) + chip_padding * 2 - chip_margin;
  size_z = chip_z + size_fixed_z;

  // chip tray
  difference() {

    // body
    translate([0, 0, 0])
    squircle([size_x, size_y, size_z], 2);

    // grids
    for(x = [0 : count[0] - 1]) for(y = [0 : count[1] - 1]) {
      translate([chip_padding + chip_x * x + (chip_margin * x), chip_padding + chip_y * y + (chip_margin * y), size_fixed_z])
      cube([chip_x, chip_y, chip_z + 1]);
    }
  }
  
  // outside chip fasteners
  translate([chip_padding / 2 - 0.5, chip_padding / 2 - 0.5, size_z])
  squircle_outline([size_x - chip_padding + 1, size_y - chip_padding + 1, 1.5], 0.8, 1);
}
