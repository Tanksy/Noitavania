-- default biome functions that get called if we can't find a a specific biome that works for us
-- The level of action ids that are spawned from the chests
CHEST_LEVEL = 4
dofile("data/scripts/director_helpers.lua")
dofile("data/scripts/biome_scripts.lua")
dofile("data/scripts/perks/perk.lua")

RegisterSpawnFunction( 0xffffeedd, "init" )
RegisterSpawnFunction( 0xffCC6600, "spawn_perk" )

function init( x, y, w, h )
	LoadPixelScene( "mods/noitavania/data/scenes/nv_castle/boss_room.png", "", x, y, "", true )
end

function spawn_perk(x, y)
	perk_spawn_random(x, y)
end

function spawn_small_enemies( x, y )
	EntityLoad( "mods/noitavania/data/entities/nv_castleboss.xml", x, y )
end
function spawn_big_enemies( x, y ) end
function spawn_items( x, y ) end
function spawn_props( x, y ) end
function spawn_props2( x, y ) end
function spawn_props3( x, y ) end
function spawn_lamp( x, y ) end
function load_pixel_scene( x, y ) end
function load_pixel_scene2( x, y ) end
function spawn_unique_enemy( x, y ) end
function spawn_unique_enemy2( x, y ) end
function spawn_unique_enemy3( x, y ) end
function spawn_ghostlamp( x, y ) end
function spawn_candles( x, y ) end
function spawn_potions( x, y ) end
function spawn_wands( x, y ) end