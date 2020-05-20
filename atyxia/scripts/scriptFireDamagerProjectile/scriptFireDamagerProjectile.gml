/// @func scriptFireDamagerProjectile(spawnX, spawnY, targX, targY, damage, speed, lifetime, scale)
/// @arg spawnX
/// @arg spawnY
/// @arg targX
/// @arg targY
/// @arg damage
/// @arg speed
/// @arg lifetime
/// @arg scale The scale parameter, in terms of the 16x16 original sprite size
var dCaller = object_index;

var sX = argument0;
var sY = argument1;
var targX = argument2;
var targY = argument3;
var dDamage = argument4;
var dSpeed = argument5;
var dLifetime = argument6;
var dScale = argument7;

var dDir = point_direction(sX, sY, targX, targY);

var damager = instance_create_layer(sX, sY, "Instances", objectOrthoDamagerProjectile);
with(damager){
	damage = dDamage;
	damagerSpeed = dSpeed;
	dir = dDir;
	lifetime = dLifetime;
	scale = dScale;
	parent = dCaller;
}