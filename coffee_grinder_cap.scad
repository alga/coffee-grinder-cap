$fn=100;

R = 66.7/2;
H = 9.6;


module coffee_grinder_cap() {
    difference () {
        cylinder(r=R, h=H, $fn=200);
        translate([0, 0, 4.6]) cylinder(r=R-2.8, h=H);
        translate([0, 0, 2]) cylinder(r=45.8/2, h=H);
        translate([0, 0, 2]) ring();
        translate([0, 0, 2.0]) cylinder(r1=45.8/2, r2=51.8/2, h=3.5);
        translate([0, 0, 4.6]) dents();
        translate([0, 0, -0.1]) linear_extrude(height=0.6, convexity=10)
            mirror([1, 0, 0]) {
                translate([0, 14, 0]) 
                    text("höchstens", size=5, halign="center");
                translate([0, 7, 0]) 
                    text("halb füllen", size=5, halign="center");
                translate([0, -8, 0])
                    text("alga design", size=7, halign="center");
            }
    }   
    // Outer grip
    for (alpha=[0:10:360]) {
        rotate([0, 0, alpha]) 
            translate([R, 0, 0]) 
                cylinder(r=1.8/2, h=H, $fn=12);
    }
}

coffee_grinder_cap();

module ring() {
    difference() {
        cylinder(r=57.8/2, h=5);
        translate([0, 0, -1]) cylinder(r=57.8/2-2.4, h=7);
    }
}

module dents() {
    rr=1.8/2;
    r1 = R-1.6-rr;
    r2 = R-1.2-rr;
    beta = 15;
    for (alpha=[0:30:360]) {
   // for (alpha=[0:30:0]) {
            rotate([0, 0, alpha]) {
                hull () {
                    translate([r1, 0, 0]) 
                        cylinder(r=rr, h=H);
                    translate([r2 * cos(beta), r2*sin(beta), 0]) 
                        cylinder(r=rr, h=H);
                }
                hull () {
                    translate([r1, 0, 0]) 
                        cylinder(r=rr, h=H);
                    translate([r1-5, -5, 0]) 
                        cylinder(r=rr, h=H);
                }
                hull () {
                    translate([r2 * cos(beta), r2*sin(beta), 0]) 
                        cylinder(r=rr, h=H);
                    translate([(r2-4)* cos(beta), (r2+8)*sin(beta), 0]) 
                        cylinder(r=rr, h=H);
                }
            }
    }
}
//dents();

//mirror([1,0,0]) linear_extrude(height=3) text("a");