-- default biome functions that get called if we can't find a a specific biome that works for us
-- The level of action ids that are spawned from the chests
CHEST_LEVEL = 4
dofile("data/scripts/director_helpers.lua")
dofile("data/scripts/biome_scripts.lua")

------------ SMALL ENEMIES ----------------------------------------------------

g_small_enemies =
{
	total_prob = 0,
	-- add skullflys after this step
	{
		prob   		= 0.15,
		min_count	= 1,
		max_count	= 1,    
		entity 	= "data/entities/animals/bigbat.xml"
	},
	{
		prob   		= 0.04,
		min_count	= 1,
		max_count	= 2,    
		entity 	= "data/entities/animals/zombie.xml"
	},
	{
		prob   		= 0.01,
		min_count	= 1,
		max_count	= 1,    
		entity 	= "data/entities/animals/wizard_poly.xml"
	},
	{
		prob   		= 0.02,
		min_count	= 1,
		max_count	= 1,    
		entity 	= "data/entities/animals/wizard_dark.xml"
	},
	{
		prob   		= 0.04,
		min_count	= 1,
		max_count	= 1,    
		entity 	= "data/entities/animals/barfer.xml"
	},
	{
		prob   		= 0.1,
		min_count	= 1,
		max_count	= 2,    
		entity 	= "data/entities/animals/bigzombie.xml"
	},
	{
		prob   		= 0.035,
		min_count	= 1,
		max_count	= 1,    
		entity 	= "data/entities/animals/chest_mimic.xml"
	},
	{
		prob   		= 0.08,
		min_count	= 3,
		max_count	= 8,    
		entity 	= "data/entities/animals/bat.xml"
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

g_props =
{
	total_prob = 0,
	{
		prob   		= 0.1,
		min_count	= 0,
		max_count	= 0,
		offset_y 	= 0,    
		entity 	= ""
	},
	{
		prob   		= 0.1,
		min_count	= 1,
		max_count	= 1,    
		offset_y 	= 0,
		entity 	= "data/entities/props/furniture_bed.xml"
	},
	{
		prob   		= 0.25,
		min_count	= 1,
		max_count	= 1,
		offset_y 	= 0,
		entity 	= "data/entities/props/furniture_castle_chair.xml"
	},
	{
		prob   		= 0.25,
		min_count	= 1,
		max_count	= 1,
		offset_y 	= 0,
		entity 	= "data/entities/props/furniture_castle_table.xml"
	},
	{
		prob   		= 0.1,
		min_count	= 1,
		max_count	= 1,
		offset_y 	= 0,
		entity 	= "data/entities/props/furniture_castle_wardrobe.xml"
	},
	{
		prob   		= 0.175,
		min_count	= 1,
		max_count	= 1,
		offset_y 	= 0,    
		entity 	= "data/entities/props/furniture_castle_divan.xml"
	},
	{
		prob   		= 0.3,
		min_count	= 1,
		max_count	= 1,
		offset_y 	= 0,    
		entity 	= "data/entities/props/furniture_castle_statue.xml"
	},
	{
		prob   		= 0.1,
		min_count	= 1,
		max_count	= 1,
		offset_y 	= 0,
		entity 	= "data/entities/props/furniture_dresser.xml"
	},
	{
		prob   		= 0.1,
		min_count	= 1,
		max_count	= 1,
		offset_y 	= 0,
		entity 	= "data/entities/props/furniture_wardrobe.xml"
	},
	{
		prob   		= 0.2,
		min_count	= 1,
		max_count	= 1,
		offset_y 	= 0,
		entity 	= "data/entities/props/furniture_wood_chair.xml"
	},
	{
		prob   		= 0.2,
		min_count	= 1,
		max_count	= 1,
		offset_y 	= 0,
		entity 	= "data/entities/props/furniture_wood_table.xml"
	}
}

function safe( x, y )
	local result = true
	
	if ( x >= 125 ) and ( x <= 249 ) and ( y >= 5118 ) and ( y <= 5259 ) then
		result = false
	end
	
	return result
end

-- actual functions that get called from the wang generator

function spawn_small_enemies(x, y)
	if safe( x, y ) then
		spawn(g_small_enemies,x,y)
	end
end

function spawn_items(x, y)
	local r = ProceduralRandom( x-11.631, y+10.2257 )
	
	if (r < 0.45) then
		LoadPixelScene( "data/biome_impl/wand_altar.png", "data/biome_impl/wand_altar_visual.png", x-15, y-17, "", true )
	end
end

function spawn_props(x, y)
	spawn(g_props,x,y,0,0)
end

function spawn_potion_altar(x, y) end
function load_pixel_scene(x, y) end
function load_pixel_scene2(x, y) end