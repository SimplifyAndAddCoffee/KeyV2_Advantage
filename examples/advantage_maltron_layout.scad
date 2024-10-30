include <../includes.scad>

$fn=16;
//$fn=360;
$inset_legend_depth=0.4;
$stem_slop=0.2;
$stem_inner_slop=0;

render_part="homerow"; // left/right/main/thumbs/all/homerow/special

module advantage_legendsonly(render_part=render_part){
    difference(){
        union(){
            advantage_maltron_blanks( render_part=render_part ) key();
        }
        union(){
            advantage_maltron_legends( render_part=render_part ) key();
        }
        
    }
}


advantage_maltron_legends( render_part=render_part ) key();
//advantage_legendsonly( render_part=render_part );
//advantage_maltron_blanks( render_part=render_part ) key();

//key();