include <../includes.scad>

/* in this example we'll use some openSCAD to generate files for printing inset
   legends with a multimaterial printer.
*/

$fn=16;
blank_keys=false;

large_size=7;
med_size=5;
small_size=3;
upper_pos=[-0.5,-0.8];
lower_pos=[-0.5,0.8];

legends = [
    ["", "", "", "", "", "", "", "", "", ""],
    ["Q", "P", "Y", "C", "B", "L", "W", "U", "Z", "V"],
    ["A", "N", "I", "S", "F", "D", "T", "H", "O", "R"],
    ["", "", "J", "G", "", "", "M", "K", "", "X"],
    ["", "", "", "", "", "", "", "", "", ""]
];

upper_legends = [
    ["!", "@", "#", "$", "%", "^", "&", "*", "(", ")"],
    ["", "", "", "", "", "", "", "", "", ""],
    ["", "", "", "", "", "", "", "", "", ""],
    ["~", "<", "", "", "\"", ":", "", "", ">", ""],
    ["", "|", "{", "_", "", "", "+", "}", "?", ""]
];

lower_legends = [
    ["1", "2", "3", "4", "5", "6", "7", "8", "9", "0"],
    ["", "", "", "", "", "", "", "", "", ""],
    ["", "", "", "", "", "", "", "", "", ""],
    ["`", "\,", "", "", "\'", ";", "", "", ".", ""],
    ["", "\\", "[", "-", "", "", "=", "]", "/", ""]
];

front_legends = [
    ["", "", "", "", "", "", "", "=", "/", "*"],
    ["", "", "↑", "", "", "", "7", "8", "9", "-"],
    ["", "←", "↓", "→", "", "", "4", "5", "6", "+"],
    ["", "", "", "", "", "", "1", "2", "3", ""],
    ["", "", "", "", "", "", "", "", ".", ""]
];
small_legends = [
    ["", "", "", "", "", "", "", "", "", ""],
    ["", "", "", "", "", "", "", "", "", ""],
    ["", "", "", "", "", "", "", "", "", ""],
    ["", "", "", "", "", "", "", "", "", ""],
    ["Ctrl", "", "", "", "", "", "", "", "", "Ctrl"]
];
small_front_legends = [
    ["", "", "", "", "", "", "Nm Lk", "", "", ""],
    ["", "", "", "", "", "", "", "", "", ""],
    ["", "", "", "", "", "", "", "", "", ""],
    ["", "", "", "", "", "", "", "", "", "Enter"],
    ["", "Insert", "", "", "", "", "", "", "", "Enter"]
];

for (y = [0:1:9]) {
  for (x = [0:1:4]) {
    hasLegend = legends[x][y] != "" || upper_legends[x][y] != "" || lower_legends[x][y] != "" || front_legends[x][y] != "" || small_legends[x][y] != "" || small_front_legends[x][y] != "";
    
    if (hasLegend || blank_keys) {
      translate_u(y, -x) {
        legend(legends[x][y], [0, 0], $font_size=large_size) {
          legend(upper_legends[x][y], upper_pos, $font_size=med_size) {
            legend(lower_legends[x][y], lower_pos, $font_size=med_size) {
              front_legend(front_legends[x][y], $font_size=med_size) {
                legend(small_legends[x][y], [0, 0], $font_size=small_size) {
                  front_legend(small_front_legends[x][y], $font_size=small_size) {
                    if (x == 2 && (y >= 0 && y <= 3 || y >= 6 && y <= 9)) {
                      dsa_row(x, 0) {
                        debug() key(true);
                        /*debug()*/ dished() {
                          legends($inset_legend_depth);
                        }
                      }
                    } else if (x == 0 && (y == 2 || y == 7)) {
                      oem_row(x+1, 0) {
                        debug() key(true);
                        /*debug()*/ dished() {
                          legends($inset_legend_depth);
                        }
                      }
                    } else {
                      oem_row(x, 0) {
                        debug() key(true);
                        /*debug()*/ dished() {
                          legends($inset_legend_depth);
                        }
                      }
                    }
                  }
                }
              }
            }
          }
        }   
      }
    }
  }
}
