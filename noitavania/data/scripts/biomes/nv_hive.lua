-- default biome functions that get called if we can't find a a specific biome that works for us
CHEST_LEVEL = 5
dofile_once("data/scripts/director_helpers.lua")
dofile_once("data/scripts/director_helpers_design.lua")
dofile_once("data/scripts/biome_scripts.lua")

RegisterSpawnFunction( 0xffd0d0b4, "spawn_larva" )

g_small_enemies =
{
	total_prob = 0,
	-- this is air, so nothing spawns at 0.6
	{
		prob   		= 0.3,
		min_count	= 0,
		max_count	= 0,    
		entity 	= ""
	},
	{
		prob = 0.5,
		min_count = 1,
		max_count = 3,    
		entity = "data/entities/animals/nv_bee.xml"
	},
	{
		prob = 0.4,
		min_count = 1,
		max_count = 1,
		entities = 
		{
			"data/entities/animals/nv_bee.xml",
			"data/entities/animals/nv_bee.xml",
			"data/entities/animals/nv_bee_stinger.xml",
			"data/entities/animals/nv_bee_stinger.xml",
		},
	},
	{
		prob = 0.3,
		min_count = 1,
		max_count = 1,
		entities = 
		{
			"data/entities/animals/nv_hivemaggot_big.xml",
		},
	},
}

g_big_enemies =
{
	total_prob = 0,
	{
		prob = 0.75,
		min_count = 1,
		max_count = 1,
		entity = "data/entities/buildings/nv_beenest.xml"
	}
}

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
	{
		prob   		= 1,
		min_count	= 1,
		max_count	= 1,    
		entity 	= "data/entities/items/wand_level_05.xml"
	}
}

function spawn_items(x, y)
	local r = ProceduralRandom( x-11.631, y+10.2257 )
	
	if (r < 0.45) then
		LoadPixelScene( "data/biome_impl/wand_altar.png", "data/biome_impl/wand_altar_visual.png", x-15, y-17, "", true )
	end
end

function spawn_small_enemies(x, y)
	spawn(g_small_enemies,x,y)
end

function spawn_big_enemies(x, y) 
	spawn(g_big_enemies,x,y)
end

function spawn_larva(x, y)
	EntityLoad( "data/entities/animals/nv_hivemaggot.xml", x, y )
end