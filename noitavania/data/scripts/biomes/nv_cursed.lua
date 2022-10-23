-- default biome functions that get called if we can't find a a specific biome that works for us
-- The level of action ids that are spawned from the chests
CHEST_LEVEL = 4
dofile_once("data/scripts/director_helpers.lua")
dofile_once("data/scripts/biome_scripts.lua")
dofile_once("data/scripts/lib/utilities.lua")

------------ SMALL ENEMIES ----------------------------------------------------

g_small_enemies =
{
	total_prob = 0,
	-- this is air, so nothing spawns at 0.6
	{
		prob   		= 0.1,
		min_count	= 1,
		max_count	= 2,
		entity 	= "data/entities/animals/enlightened_alchemist.xml"
	},
	{
		prob   		= 0.07,
		min_count	= 1,
		max_count	= 2,
		entity 	= "data/entities/animals/necrobot_super.xml"
	},
	{
		prob   		= 0.05,
		min_count	= 1,
		max_count	= 1,
		entity 	= "data/entities/animals/necromancer_shop.xml"
	},
	{
		prob   		= 0.01,
		min_count	= 1,
		max_count	= 1,
		entity 	= "data/entities/animals/necromancer_super.xml"
	},
	{
		prob   		= 0.1,
		min_count	= 1,
		max_count	= 3,
		entity 	= "data/entities/animals/failed_alchemist_b.xml"
	},
	{
		prob   		= 0.1,
		min_count	= 1,
		max_count	= 3,
		entity 	= "data/entities/animals/necromancer.xml"
	},
}

-- actual functions that get called from the wang generator

function spawn_small_enemies(x, y)
	spawn(g_small_enemies,x,y)
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