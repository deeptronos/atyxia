/// @func scriptFireDamagerProjectile(spawnX, spawnY, targX, targY, damage, speed, lifetime, scale_x, scale_y)
/// @arg spawnX
/// @arg spawnY
/// @arg targX
/// @arg targY
/// @arg damage
/// @arg speed
/// @arg lifetime
/// @arg scale_x The X scale parameter, in terms of the 16x16 original sprite/hitbox size
/// @arg scale_y The X scale parameter, in terms of the 16x16 original sprite/hitbox size
var dCaller = object_index;
var dLayer = layer;

var sX = argument0;
var sY = argument1;
var targX = argument2;
var targY = argument3;
var dDamage = argument4;
var dSpeed = argument5;
var dLifetime = argument6;
var dScale_x = argument7;
var dScale_y = argument8;

var dDir = point_direction(sX, sY, targX, targY);

var damager = instance_create_layer(sX, sY, dLayer, objectOrthoDamagerProjectile);
with(damager){
	damage = dDamage;
	damagerSpeed = dSpeed;
	dir = dDir;
	lifetime = dLifetime;
	scale_x = dScale_x;
	scale_y = dScale_y;
	parent = dCaller;
}
