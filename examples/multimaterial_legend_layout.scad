include <../includes.scad>

/* in this example we'll use some openSCAD to generate files for printing inset
   legends with a multimaterial printer.
*/

$fn=32;

legends = [
    ["1", "2", "3", "4", "5", "6", "7", "8", "9", "0"],
    ["Q", "P", "Y", "C", "B", "L", "W", "U", "Z", "V"],
    ["", "", "", "", "F", "D", "", "", "", ""],
    ["~", "<", "J", "G", "\"", ":", "M", "K", ">", "X"],
    ["Ctrl", "|", "{", "-", "", "", "+", "}", "?", "Ctrl"]
];

for(y = [0:1:9]){
    for (x = [0:1:4]) {
      if (legends[x][y] != "") {
        translate_u(y,-x) legend(legends[x][y]) oem_row(x, 0) {
          // swap the debug()s to render opposite part
          debug() key(true);
          /* debug() */ dished() {
            legends($inset_legend_depth);
          }
        }
      }
    }
}
