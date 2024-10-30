include <../includes.scad>

/*
    Generate any number of replacement keys plated together with the specified properties 
    Each column in the legends and properties array corresponds to one key. 
    Add additional columns for additional keys. 
    The size and legend positioning is consistent with the layout module, 
    and will match the look of the legends in the full layout
*/

$fn=360;
$inset_legend_depth=0.4;
$stem_slop=0.2;
$stem_inner_slop=0;

legends = [
    ["V" ,"","" ],   //Main legends
    ["","" ,"" ],   //Uppercase (split) legends
    ["","" ,"" ],   //Lowercase (split) legends
    ["" ,"Space" ,"Shift▲" ],//Smol legends
    ["-" ,"",""],   //Front legends
    ["" ,"" ,""],  //Smol front legends
    ["" ,"0" ,""]  //front legend for vertical >1u keys
];

sizes = [
    $font_size,
    5,
    5,
    3,
    5,
    3,
    5
];

properties = [
    ["oem","oem","oem","oem"], //key profile
    [1,3,2,4], //row
    [1,1,1.25,1], //key size (width)
    [1,2,1,1]  //key size (height)
];

for (x=[0:len(legends[0])-1]){
    translate_u(x*properties[2][x],0){
        legend(legends[0][x],position=[0,0],size=sizes[0]){  // main legend
            legend(legends[1][x],position=[0,0.8],size=sizes[1]){ // top (uppercase) legend
                legend(legends[2][x],position=[0,-0.8],size=sizes[2]){ // bottom (lowercase) legend
                    legend(legends[3][x],position=[0,0],size=sizes[3]){ // small legends
                        front_legend(legends[4][x],position=[0,-0.35],size=sizes[4]){ // front legends
                            front_legend(legends[5][x],position=[0,-0.6],size=sizes[5]){ // front small legends
                                front_legend(legends[6][x],position=[0,-0.1],size=sizes[6]){ // front vertical legends
                                    key_profile(properties[0][x],properties[1][x]){ // profile and row
                                        u(properties[2][x]){
                                            uh(properties[3][x]){
                                                key();
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