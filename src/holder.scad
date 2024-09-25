$fn = 50;
thickness = 3;
distance = 15.5;
holder_position = 15.5;
honder_height = 6;

// 本体
module body(){

	// 板
	translate([0, 0, thickness / 2]){

		cube([50, 50, thickness], center = true);

	}

	translate([-70/2, 10.5, 0]){

		cube([70, 25, 25]);

	}

}

// ネジ穴
module screw_hole(){

	for(ty = [-distance:distance * 2:distance]){

		translate([ty, -10, -5]){

			cylinder(h = 10, r = 2.1);

		}
	
	}

}

// 空洞
module cavity(){

	// 座標
	points = [
		
		[0, 0],
		[0, 15.5],
		[12, 15.5],
		[12 / 2 * 3, 15.5 / 2],
		[12, 0]

	];

	translate([70/2, holder_position, thickness]){

		rotate([0, -90, 0]){

			#linear_extrude(70)
				polygon(points);

		}

	}

}

// スリット
module slit(){

	for(tx = [-30:6:30]){

		translate([tx, holder_position * 1.5, 10]){

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

