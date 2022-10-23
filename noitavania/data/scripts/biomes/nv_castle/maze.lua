-- default biome functions that get called if we can't find a a specific biome that works for us
-- The level of action ids that are spawned from the chests
CHEST_LEVEL = 3
dofile("data/scripts/director_helpers.lua")
dofile("data/scripts/biome_scripts.lua")

------------ SMALL ENEMIES ----------------------------------------------------

g_small_enemies =
{
	total_prob = 0,
	-- add skullflys after this step
	{
		prob   		= 0.065,
		min_count	= 1,
		max_count	= 1,    
		entity 	= "data/entities/animals/bigbat.xml"
	},
	{
		prob   		= 0.08,
		min_count	= 1,
		max_count	= 1,    
		entity 	= "data/entities/animals/bigzombie.xml"
	},
	{
		prob   		= 0.1,
		min_count	= 1,
		max_count	= 1,    
		entity 	= "data/entities/animals/chest_mimic.xml"
	},
	{
		prob   		= 0.08,
		min_count	= 2,
		max_count	= 7,    
		entity 	= "data/entities/animals/bat.xml"
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
	
	if (r > 0.5) then
		EntityLoad( "mods/noitavania/data/entities/items/nv_torch.xml", x, y )
	end
		
end

function load_pixel_scene(x, y) end
function load_pixel_scene2(x, y) end