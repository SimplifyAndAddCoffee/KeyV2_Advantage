include <../includes.scad>

keypad_pattern = [
  ["■", ""]
];

$font_size = 2.5;
$key_length = 1.25;

$fn=360;
$inset_legend_depth=0.4;
$stem_slop=0.2;
$stem_inner_slop=0;

oem_row(2){

for (x=[0:len(keypad_pattern)-1]) {
  translate_u(x,0) {
    legend(keypad_pattern[x][0], [-0.5,-0.6]) {
    legend(keypad_pattern[x][0], [-0.5,0]) {
    legend(keypad_pattern[x][0], [-0.5,0.6]) {
    legend(keypad_pattern[x][0], [0,-0.6]) {
    legend(keypad_pattern[x][0], [0,0]) {
    legend(keypad_pattern[x][0], [0,0.6]) {
    legend(keypad_pattern[x][0], [0.5,-0.6]) {
    legend(keypad_pattern[x][0], [0.5,0]) {
    legend(keypad_pattern[x][0], [0.5,0.6]) {
    legend(keypad_pattern[x][0], [0,1.2]) {
            key();
        }
      }
    }
}}}}}}}}}}
