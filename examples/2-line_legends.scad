include <../includes.scad>

/* here's how to use the legends() command.
   The first argument is the legend itself, which can also be a whole string.
   The second argument is the "position" of the legend relative to center.
   Legends currently have to all be inset or outset at the same time, but you
   can have as many of them as you want.
   The numbers used are some magic constant, so just fudge them until it looks good.
*/

/* $outset_legends = true; */
legends = [
  ["Caps", "Lock"]
];

$font_size = 3;
$key_length = 1.25;
dcs_row(1){

for (x=[0:len(legends)-1]) {
  translate_u(x,0) {
    legend(legends[x][0], [0,-0.5]) {
      legend(legends[x][1], [0,0.5]) {
            key();
          }
        }
      }
    }
}
