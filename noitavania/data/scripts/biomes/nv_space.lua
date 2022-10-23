-- default biome functions that get called if we can't find a a specific biome that works for us
CHEST_LEVEL = 3
dofile_once("data/scripts/director_helpers.lua")
dofile_once("data/scripts/director_helpers_design.lua")
dofile_once("data/scripts/biome_scripts.lua")

-- RegisterSpawnFunction( 0xffffeedd, "init" )

--TODO:
--	*	Replace Hiisi dudes with space-suit wearing variants.
g_small_enemies =
{
	total_prob = 0,
	-- this is air, so nothing spawns at 0.6
	{
		prob   		= 0.5,
		min_count	= 0,
		max_count	= 0,    
		entity 	= ""
	},
	-- add skullflys after this step
	{
		prob   		= 0.1,
		min_count	= 1,
		max_count	= 1,    
		entity 	= "mods/noitavania/data/entities/bluemancer.xml"
	},
	{
		prob   		= 0.07,
		min_count	= 1,
		max_count	= 1,    
		entity 	= "mods/noitavania/data/entities/gigashooter.xml"
	},
	{
		prob   		= 0.02,
		min_count	= 1,
		max_count	= 1,    
		entity 	= "mods/noitavania/data/entities/chaoticpolyshooter.xml"
	},
	{
		prob   		= 0.05,
		min_count	= 1,
		max_count	= 1,    
		entity 	= "data/entities/animals/drone_lasership.xml"
	},
	{
		prob   		= 0.1,
		min_count	= 1,
		max_count	= 2,
		entities 	= {
			"data/entities/animals/scavenger_grenade.xml",
			"data/entities/animals/scavenger_smg.xml",
		}
	},
	{
		prob   		= 0.1,
		min_count	= 1,
		max_count	= 2,    
		entities 	= {
			{
				min_count	= 1,
				max_count	= 2,
				entity	= "data/entities/animals/scavenger_grenade.xml",
			},
			{
				min_count	= 0,
				max_count	= 2,
				entity	= "data/entities/animals/scavenger_smg.xml",
			},
		}
	},
	{
		prob   		= 0.03,
		min_count	= 1,
		max_count	= 1,    
		entity 	= "data/entities/animals/scavenger_heal.xml"
	},
	{
		prob   		= 0.04,
		min_count	= 1,
		max_count	= 1,    
		entities 	=  {
			"data/entities/animals/scavenger_clusterbomb.xml",
			{
				min_count	= 1,
				max_count 	= 3,
				entity = "data/entities/animals/scavenger_grenade.xml",
			},
			{
				min_count	= 1,
				max_count 	= 3,
				entity = "data/entities/animals/scavenger_smg.xml",
			},
			{
				min_count	= 1,
				max_count 	= 1,
				entity = "data/entities/animals/scavenger_heal.xml",
			},
		}
	},
	{
		prob   		= 0.04,
		min_count	= 1,
		max_count	= 1,    
		entities 	= {
			{
				min_count	= 1,
				max_count 	= 3,
				entity = "data/entities/animals/scavenger_smg.xml",
			},
			{
				min_count	= 1,
				max_count 	= 3,
				entity = "data/entities/animals/scavenger_grenade.xml",
			},
			"data/entities/animals/scavenger_leader.xml",
		}
	},
	{
		prob   		= 0.1,
		min_count	= 1,
		max_count	= 2,    
		entity 	= "data/entities/animals/vault/drone_physics.xml"
	},
	--lol
	{
		prob   		= 0.002,
		min_count	= 1,
		max_count	= 1,    
		entity 	= "data/entities/animals/ultimate_killer.xml"
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
	-- add skullflys after this step
	{
		prob   		= 5,
		min_count	= 1,
		max_count	= 1,    
		entity 	= "data/entities/items/wand_level_03.xml"
	},
	{
		prob   		= 3,
		min_count	= 1,
		max_count	= 1,    
		entity 	= "data/entities/items/wand_level_04.xml"
	},
	{
		prob   		= 1,
		min_count	= 1,
		max_count	= 1,    
		entity 	= "data/entities/items/wand_level_05.xml"
	},
}

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

-- this is a special function tweaked for spawning things in coal mines
function spawn_items(x, y)
	local r = ProceduralRandom( x-11.631, y+10.2257 )
end

-- actual functions that get called from the wang generator

function spawn_small_enemies(x, y)
	spawn(g_small_enemies,x,y)
end

function spawn_big_enemies(x, y) end

function spawn_moon( x, y )
	EntityLoad( "data/entities/buildings/moon_altar.xml", x, y )
end

function load_pixel_scene( x, y ) end