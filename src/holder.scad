$fn = 50;
thickness = 3;
distance = 15.5;
holder_position = 20;
honder_height = 6;

// 本体
module body(){

	// 板
	translate([0, 0, thickness / 2]){

		cube([50, 50, thickness], center = true);

	}
	
	// polygon

}

// ネジ穴
module screw_hole(){

	for(ty = [-distance:distance*2:distance]){

		translate([ty, -10, -5]){

			cylinder(h = 10, r = 2.1);

		}
	
	}

}

// 空洞
module cavity(){

	// ホルダー本体
	translate([0, holder_position, honder_height + 2]){

		cube([71, 17.5, 15 - 4], center = true);

	}

	// 頂上部分
	translate([0, holder_position, honder_height + 7.5]){

 		rotate([45, 0, 0]){

			cube([71, 17 - 4.6, 17 - 4.6], center = true);

		}

	}

}

// スリット
module slit(){

	for(tx = [-30:6:30]){

		translate([tx, holder_position, 10]){

			cube([1.5, 15, 50], center = true);

		}

	}

}

difference(){

	body();
	screw_hole();
	cavity();
	slit();

}

