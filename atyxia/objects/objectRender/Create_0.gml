/// @description Build the room's "map" layer to be drawn in-game

layer_set_visible("Tiles_1", false);

global.theMap = ds_grid_create(MAP_W, MAP_H);

var tileMap = layer_tilemap_get_id("Tiles_1");

for (var tX = 0; tX < MAP_W; tX++){
	for (var tY = 0; tY < MAP_H; tY++){
		//Gets the information (what type of cell) about the current cell (tX & tY), in the current tilemap (tileMap)
		var tileMapData = tilemap_get(tileMap, tX, tY);
		//Format: [Sprite, Z]
		var thisTile = [-1, 0]; //Defaulting to tile -1, ie a blank tile
		thisTile[TILE.SPRITE] = tileMapData;
		thisTile[TILE.Z] = irandom(3);
		global.theMap[# tX, tY] = thisTile
	}
}