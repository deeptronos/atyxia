depth_offset = 7
z = 0 + depth_offset

fix_anchor = physics_fixture_create();	//	Create a "fixture", a necessary part of creating physics for an object
	//	Set the fixture shape to a circle with a radius of 8
physics_fixture_set_circle_shape(fix_anchor, 8);
physics_fixture_set_density(fix_anchor, 10);	// Give the fixture a density property idk

my_fix = physics_fixture_bind(fix_anchor, self);	//	Bind the fixture to this object

rope_length = 1;	//	Default rope length
rope_resolution = 2; // Amount of ropes created to form this one rope (Ie, "line segments" in the "line" that is our rope)

my_balloon = instance_create_layer(x, y - rope_length, "ilayer_instances", objectBalloon);

my_rope_physics_objects = [self.id]; //	If the rope is a line, each joint is a point connecting a line segment of that line
										//	We're also making this, the anchor, the first object in that line
										
for(var i = 0; (i + 1) < rope_resolution; i++){	//	Make an amount of "points" to connect these line segments
	var distance = (rope_length/rope_resolution) * (i+1);
	//show_debug_message(string(distance));
	my_rope_physics_objects[i + 1] = instance_create_layer(x, y - (distance),"ilayer_instances", objectBalloonRopePhysicsJoint);
	//show_debug_message("rope physics object created " + string(i) + " times");
}

my_rope_physics_objects[array_length_1d(my_rope_physics_objects)] = my_balloon;	// add Balloon as the final joint to connect to

var prev_rope_physics_object = my_rope_physics_objects[0];	//	Setting the "previous" joint to be the first one, since it's used to connect to the next one or something

for(var i = 0; i < array_length_1d(my_rope_physics_objects) - 1; i++){
	show_debug_message("rope creation loop ran: " + string(i)+ " times");
	//my_balloon.my_rope_joints[i] = physics_joint_rope_create(my_rope_physics_objects[i], my_rope_physics_objects[i+1], my_rope_physics_objects[i].x, my_rope_physics_objects[i].y, my_rope_physics_objects[i+1].x, my_rope_physics_objects[i+1].y, rope_length/rope_resolution, false);
	my_balloon.my_rope_joints[i] = physics_joint_rope_create(prev_rope_physics_object, my_rope_physics_objects[i], prev_rope_physics_object.x, prev_rope_physics_object.y, my_rope_physics_objects[i].x, my_rope_physics_objects[i].y, rope_length/rope_resolution, false);
	show_debug_message("my_balloon.my_rope_joints[i] : " + string(my_balloon.my_rope_joints[i]) + ", prev_rope_physics_object: " + string(prev_rope_physics_object));
	show_debug_message("max rope length of this joint: " + string(physics_joint_get_value(my_balloon.my_rope_joints[i], phy_joint_max_length)));
	prev_rope_physics_object = my_balloon.my_rope_joints[i];
}
show_debug_message("(my_balloon.my_rope_joints: " + string(my_balloon.my_rope_joints));


with(my_balloon){
	
	anchor_x = other.x;
	anchor_y = other.y;
	
	z = other.depth - GCD;
}