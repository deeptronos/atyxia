fix_balloon_rope_physics_joint = physics_fixture_create();

physics_fixture_set_circle_shape(fix_balloon_rope_physics_joint , 4);

physics_fixture_set_density(fix_balloon_rope_physics_joint , 10);

my_fix = physics_fixture_bind(fix_balloon_rope_physics_joint , self);