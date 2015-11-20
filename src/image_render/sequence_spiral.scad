
include <sequence-data.scad>;

// configuration
stl_path = "../../stl/";
stl_convexity = 5;
stl_translation = [7,0,-3];
twist_turn = 35;
twist_height = 33;
twist_gap = 0.5;
helix_angle = 3;
helix_radius = 0;

// pair generation

frame = floor($t*35);


// Measure this value with the PNG output image size
image_vertical_size = 760;

N_neighbour_pairs_rendered = 12; // must be an even number
N_prus_per_page = 9;
current_first = N_prus_per_page*frame;

vertical_offset = (twist_height+twist_gap)*current_first;

rotate([0,180,0]) // comment/uncomment for even/odd arrangement
translate([0,0,-vertical_offset])
    for(pair = [current_first-N_neighbour_pairs_rendered/2 : current_first+N_neighbour_pairs_rendered/2])
        generate_twist(pair - 1);

echo(str("Type in animation max:", len(pair_data) - 1));

// magical functions

module build_twist (pair, stl_file_1, stl_color_1, stl_file_2, stl_color_2) {

  // pair 1
  translate([
			cos(helix_angle * pair) * helix_radius, 
			sin(helix_angle * pair) * helix_radius, 
			(twist_height + twist_gap) * pair])  
    color(stl_color_1)  
      rotate([90, 0, (twist_turn * pair)]) translate(stl_translation)
        import(stl_file_1, convexity = stl_convexity);

  // pair 2
  translate([
			cos(helix_angle * pair) * helix_radius, 
			sin(helix_angle * pair) * helix_radius, 
			((twist_height + twist_gap) * pair) + 22])  
    color(stl_color_2)  
      rotate([90, 180, twist_turn * pair]) translate(stl_translation)
        import(stl_file_2, convexity = stl_convexity);
    
  // helix
  //rotate([90, 0, (twist_turn * pair)])// translate(stl_translation)
  //  translate([0,0,0]) cube([10,20,30]);
  //color([1,1,1,0.9]) linear_extrude(height = twist_height, convexity = 10, twist = -twist_turn, $fn=100)
  //  translate([0,2,85]) square([22,3]);
  if(pair >= 0) {
      color([1,1,1,0.5]) hull() {
          rotate([90, 0, (twist_turn * pair)])
            translate([85,(twist_height + twist_gap) * pair,-3]) cube([3,22,6]);
          rotate([90, 0, (twist_turn * (pair+1))])
            translate([85,(twist_height + twist_gap) * (pair+1),-3]) cube([3,22,6]);
      }
      color([1,1,1,0.5]) hull() {
          rotate([90, 0, 180+(twist_turn * pair)])
            translate([85,(twist_height + twist_gap) * pair,-3]) cube([3,22,6]);
          rotate([90, 0, 180+(twist_turn * (pair+1))])
            translate([85,(twist_height + twist_gap) * (pair+1),-3]) cube([3,22,6]);
      }
  }
}

module generate_twist(pair) {

  echo(str("Generating pair ", pair, "..."));

  build_twist(
    pair = pair, 
    stl_file_1 = str(stl_path, pair_data[pair * 2][0], ".stl"), 
    stl_color_1 = pair_data[pair * 2][1], 
    stl_file_2 = str(stl_path, pair_data[(pair * 2) + 1][0], ".stl"), 
    stl_color_2 = pair_data[(pair * 2) + 1][1]
    );
}


//$vpr = viewport rotation angles in degrees
//$vpt = viewport translation
//$vpd = viewport camera distance

$vpr = [110, 0, 20];
$vpt = [0, 0, 0];
$vpd = image_vertical_size*sin(110);

echo($vpr);
echo($vpt);
echo($vpd);
