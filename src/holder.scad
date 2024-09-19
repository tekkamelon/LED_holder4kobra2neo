// 空洞部分
module cavity(){
	translate([15.5, -10, -5]){

		cylinder(h = 10, r = 4);

	}

	translate([-15.5, -10, -5]){

		cylinder(h = 10, r = 4);

	}
}

difference(){

	cube([50, 50, 3], center = true);

	cavity();

}

