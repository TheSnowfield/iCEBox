## iCEBox
This is a tray that can store your beloved chips in.

![iCEBox](https://img.shields.io/static/v1?label=OpenSCAD&message=2021.01&colorA=f9d72c&colorB=green&style=plastic)
![iCEBoxVer](https://img.shields.io/static/v1?label=iCEBox&message=2.0&color=green&style=plastic)

## Make your own
Simply to use as this,
```scad
use <../lib/icebox.scad>
use <../lib/icebox-cover.scad>

// declare your chip package size
// 8.0mm * 8.0mm * 1.0mm
chip_x = 8;
chip_y = 8;
chip_z = 1;

// how many columns and rows
// 6 x 10 boxes
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

```

and your iCEBox will come out! :P  
<image src="./res/stl-preview.png" width="300px">

Enjoy!  
I guess you're can't wait to print it XD.

## LICENSE
Licensed under the MIT license with ❤.
