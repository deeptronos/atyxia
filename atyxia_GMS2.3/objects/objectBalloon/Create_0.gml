depth_offset = 7
z = 0 + depth_offset

fix_balloon = physics_fixture_create();	//	Create a "fixture", a necessary part of creating physics for an object
	//	Set fixture shape to polygon and make the polygon a rough outline of the balloon
physics_fixture_set_polygon_shape(fix_balloon);
physics_fixture_add_point(fix_balloon, -4, -6);
physics_fixture_add_point(fix_balloon, -22, -39);
physics_fixture_add_point(fix_balloon,-16, -57);
physics_fixture_add_point(fix_balloon, -3, -64);
physics_fixture_add_point(fix_balloon, 4, -64);
physics_fixture_add_point(fix_balloon, 17, -57);
physics_fixture_add_point(fix_balloon, 23, -39);
physics_fixture_add_point(fix_balloon, 5, -6);
	// ^ Never mind, I set it using the physics editor GUI lol

physics_fixture_set_density(fix_balloon, 0.1);	// Give the fixture a low density property

my_fix = physics_fixture_bind(fix_balloon, self);	//	Bind the fixture to this object
	//	Default values for the balloon object to know the anchor location. These are updated when an anchor creates the balloon
anchor_x = x;
anchor_y = y;

my_rope_joints = [];	//	Make an empty array, to be filled by the anchor creating the balloon

image_alpha = sprite_height/255;