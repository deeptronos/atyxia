
z = objectOrthoGameplayPlayer.z;

my_balloon = instance_create_layer(x, y,"ilayer_instances", objectBalloonAnchor);

in_hand = my_balloon;

image_alpha=sprite_height/255; //piggyback alpha channel to encode sprite height