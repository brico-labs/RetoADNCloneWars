
include <sequence-data.scad>;

// configuration
stl_path = "../stl/";
stl_convexity = 5;
stl_translation = [7,0,-3];
twist_turn = 35;
twist_height = 33;
twist_gap = 2;


// pair generation
for(pair = [1 : len(pair_data) / 2])
  generate_twist(pair - 1);


// magical functions

module build_twist (pair, stl_file_1, stl_color_1, stl_file_2, stl_color_2) {

  // pair 1
  translate([0, 0, (twist_height + twist_gap) * pair])  
    color(stl_color_1)  
      rotate([90, 0, (twist_turn * pair)]) translate(stl_translation)
        import(stl_file_1, convexity = stl_convexity);

  // pair 2
  translate([0, 0, ((twist_height + twist_gap) * pair) + 22])  
    color(stl_color_2)  
      rotate([90, 180, twist_turn * pair]) translate(stl_translation)
        import(stl_file_2, convexity = stl_convexity);
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



