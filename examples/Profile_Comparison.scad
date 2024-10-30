include <../includes.scad>

//$fn=16;
$font_size=2.5;
$font_face="bold";

profile_set=[/*"dcs","cherry","oem","taihao","dsa",*/"dsx"/*,"dss","sa","g20","hipro","grid","hexagon","octagon"*/];

profile_set_legend=[/*"DCS", "CHERRY", "OEM", "TAIHAO", "DSA", */"DSX"/*, "DSS", "SA", "G20", "HIPRO", "GRID", "HEXAGON", "OCTAGON"*/];

for (i = [0 : len(profile_set) - 1]) {
    translate_u(1.5*i,0) {
        legend(profile_set_legend[i], [0,-0.7]) {
            for (j = [0 : 5]) {
                translate_u(0, -j) {
                    key_profile(profile_set[i],j){
                        legend(str("ROW ",j), [0,0.7]) {
                            key();
                        }
                    }
                }
            }
        }
    }
}
