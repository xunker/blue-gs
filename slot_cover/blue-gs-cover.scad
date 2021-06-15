face_length = 56.55;
face_width = 14.85;
face_thickness = 2.6;
face_inset = (face_width - 14.65)/2; // amount the sides will slope inward, per side

rear_length = 51.0;
rear_width = 9.5;
rear_thickness = 4.5 - face_thickness;

screw_spacing = 47;
screw_d = 3.1;
screw_head_d = screw_d * 1.85;
screw_head_t = face_thickness * 0.4;
slope_screw_heads = false;

notch_width = 7.5;
notch_length = 39;
notch_x_offset = 4.5; // from centreline

total_thickness = face_thickness + rear_thickness;

ff = 0.01;

$fn = 64;

// inset is how far in the sides will slop, per side
module rounded_top_rectangle(width, length, height, inset=0, rad=6) {
  hull() {
    // rounded sides
    // translate([rad,rad,0]) cylinder(r=rad, h=height-rad);
    // translate([width-rad,rad,0]) cylinder(r=rad, h=height-rad);
    // translate([width-rad,length-rad,0]) cylinder(r=rad, h=height-rad);
    // translate([rad,length-rad,0]) cylinder(r=rad, h=height-rad);
    translate([rad,rad,0]) cylinder(r=rad, h=ff);
    translate([width-rad,rad,0]) cylinder(r=rad, h=ff);
    translate([width-rad,length-rad,0]) cylinder(r=rad, h=ff);
    translate([rad,length-rad,0]) cylinder(r=rad, h=ff);

    // rounded top
    translate([rad+inset,rad+inset,height-rad]) sphere(r=rad);
    translate([width-(rad+inset),(rad+inset),height-rad]) sphere(r=rad);
    translate([width-(rad+inset),length-(rad+inset),height-rad]) sphere(r=rad);
    translate([(rad+inset),length-(rad+inset),height-rad]) sphere(r=rad);

  }
}

module rounded_rectangle(width, length, height, inset=0, rad=6, fn=32) {
  hull() {
    // rounded sides
    translate([rad,rad,0]) cylinder(r=rad, h=height);
    translate([width-rad,rad,0]) cylinder(r=rad, h=height);
    translate([width-rad,length-rad,0]) cylinder(r=rad, h=height);
    translate([rad,length-rad,0]) cylinder(r=rad, h=height);
  }
}

module face() {
  intersection() {
    cube([face_width, face_length, face_thickness]);

    rounded_top_rectangle(face_width, face_length, face_thickness, inset=face_inset, rad=face_thickness/3);

  }
}

module rear() {
  rounded_rectangle(rear_width, rear_length, rear_thickness, rad=1);
}

module blank_cover() {
  difference() {
    union() {
    translate([(face_width-rear_width)/2, (face_length-rear_length)/2, 0]) rear();
    translate([0, 0, rear_thickness]) face();
    }
    translate([face_width/2, face_length/2, -ff]) for (sign=[1,-1]) {
      translate([0, (screw_spacing/2)*sign, 0]) {
        cylinder(d=screw_d, h=total_thickness+(ff*2));
        translate([0, 0, total_thickness-screw_head_t]) {
          if (slope_screw_heads) {
            cylinder(d1=screw_d, d2=screw_head_d, h=screw_head_t+(ff*2));
          } else {
            cylinder(d=screw_head_d, h=screw_head_t+(ff*2));
          }
        }
      }
    }
  }
}

difference() {
  blank_cover();
  translate([((face_width-notch_width)/2) + notch_x_offset, (face_length-notch_length)/2, -ff]) {
    flared_width = (face_width-notch_width)*1.5;
    flared_length = notch_length * 1.0;

    rounded_rectangle(notch_width, notch_length, total_thickness/2, rad=1);
    translate([0, 0, (total_thickness/2)-ff]) hull() {
      rounded_rectangle(notch_width, notch_length, ff, rad=1);
      translate([(notch_width-flared_width)/2, (notch_length-flared_length)/2, (total_thickness/2)+ff])
        rounded_rectangle(flared_width, flared_length, ff, rad=1);
    }
  }
}
