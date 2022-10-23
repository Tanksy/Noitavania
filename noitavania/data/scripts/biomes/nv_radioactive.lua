-- default biome functions that get called if we can't find a a specific biome that works for us
-- The level of action ids that are spawned from the chests
CHEST_LEVEL = 4
dofile_once("data/scripts/director_helpers.lua")
dofile_once("data/scripts/biome_scripts.lua")
dofile_once("data/scripts/lib/utilities.lua")
dofile( "data/scripts/items/generate_shop_item.lua" )

------------ SMALL ENEMIES ----------------------------------------------------

g_small_enemies =
{
	total_prob = 0,
	-- this is air, so nothing spawns at 0.6
	{
		prob   		= 0.3,
		min_count	= 1,
		max_count	= 1,
		entity 	= "data/entities/animals/slimeshooter.xml"
	},
	{
		prob   		= 0.05,
		min_count	= 1,
		max_count	= 1,
		entity 	= "data/entities/animals/acidshooter.xml"
	},
	{
		prob   		= 0.01,
		min_count	= 1,
		max_count	= 1,
		entity 	= "data/entities/animals/giantshooter.xml"
	},
	{
		prob   		= 0.15,
		min_count	= 1,
		max_count	= 1,
		entity 	= "data/entities/animals/scavenger_poison.xml"
	},
	{
		prob   		= 0.03,
		min_count	= 1,
		max_count	= 1,
		entity 	= "data/entities/animals/scavenger_leader.xml"
	}
}

------------ ITEMS ------------------------------------------------------------

g_items =
{
	total_prob = 0,
	-- this is air, so nothing spawns at 0.6
	{
		prob   		= 0,
		min_count	= 0,
		max_count	= 0,    
		entity 	= ""
	},
	-- add skullflys after this step
	{
		prob   		= 5,
		min_count	= 1,
		max_count	= 1,    
		entity 	= "data/entities/items/wand_level_06.xml"
	},
}


-- actual functions that get called from the wang generator

function spawn_small_enemies(x, y)
	spawn(g_small_enemies,x,y)
end

function spawn_items(x, y)
	local r = ProceduralRandom( x-11.631, y+10.2257 )
	
	if (r < 0.45) then
		LoadPixelScene( "data/biome_impl/wand_altar.png", "data/biome_impl/wand_altar_visual.png", x-15, y-17, "", true )
	end
end

function load_altar( x, y )
	LoadPixelScene( "data/biome_impl/altar.png", "data/biome_impl/altar_visual.png", x-92, y-96, "", true )
end

function spawn_lamps( x, y ) end
function spawn_props( x, y ) end