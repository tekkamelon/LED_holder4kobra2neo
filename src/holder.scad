$fn = 50;
distance = 15.5;
holder_position = 20;
honder_height = 10.5;

// 本体
module body(){

	// 板
	cube([50, 50, 3], center = true);
	
	// ホルダー本体
	translate([0, holder_position, honder_height]){

		cube([70, 24, 24], center = true);

	}

	translate([0, holder_position, honder_height + 12]){

 		rotate([45, 0, 0]){

			cube([70, 17, 17], center = true);

		}

	}

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

	 translate([0, holder_position, 10.5]){

 		rotate([0, 90, 0]){
 
 			cylinder(h = 70, r = 17.5/2, center = true);
 
  		}

	}

}

// スリット
module slit(){

	for(tx = [-30:5:30]){

		translate([tx, holder_position, 10]){

			cube([1.5, 15, 30], center = true);

		}

	}

}

difference(){

	body();
	screw_hole();
	cavity();
	slit();

}

