use <squircle.scad>
$fs = 0.1;

module icebox_cover(chip = [8, 8, 1], count = [1, 1]) {

  assert(chip[0] > 0, "chip package width could not be 0.");
  assert(chip[1] > 0, "chip package height could not be 0.");
  assert(chip[2] > 0, "chip package thickness could not be 0.");

  assert(count[0] > 0, "row could not be 0.");
  assert(count[1] > 0, "column could not be 0.");

  // chip box size
  chip_x = chip[0];
  chip_y = chip[1];
  chip_margin  = 1;
  chip_padding = 4;

  // top cover size
  size_fixed_z = 1;
  size_x = ((chip[0] + chip_margin) * count[0]) + chip_padding * 2 - chip_margin;
  size_y = ((chip[1] + chip_margin) * count[1]) + chip_padding * 2 - chip_margin;
  size_z = size_fixed_z;

  // body
  translate([-0.5, -0.5, 0])
  squircle([size_x + 1, size_y + 1, size_z], 2);

  // internal chip cover
  translate([chip_padding / 2 + 0.4, chip_padding / 2 + 0.4, size_z])
  squircle([size_x - chip_padding - 0.8, size_y - chip_padding - 0.8, 2.5], 1);

  // outside chip fasteners
  translate([0.2, 0.2, size_z])
  squircle_outline([size_x - 0.4, size_y - 0.4, 2.5], 0.8, 1);
}
