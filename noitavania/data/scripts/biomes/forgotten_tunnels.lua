-- default biome functions that get called if we can't find a a specific biome that works for us
-- The level of action ids that are spawned from the chests
CHEST_LEVEL = 3
dofile_once("data/scripts/director_helpers.lua")
dofile_once("data/scripts/biome_scripts.lua")

RegisterSpawnFunction( 0xffC8C800, "spawn_bones" )
RegisterSpawnFunction( 0xffDC0060, "spawn_props" )


------------ SMALL ENEMIES ----------------------------------------------------

g_small_enemies =
{
	total_prob = 0,
	-- this is air, so nothing spawns at 0.6
	{
		prob   		= 0.4,
		min_count	= 0,
		max_count	= 0,    
		entity 	= ""
	},
	-- add skullflys after this step
	{
		prob   		= 0.2,
		min_count	= 1,
		max_count	= 3,    
		entity 	= "data/entities/animals/iceskull.xml"
	},
	{
		prob   		= 0.2,
		min_count	= 1,
		max_count	= 2,    
		entity 	= "data/entities/animals/thunderskull.xml"
	},
	{
		prob   		= 0.1,
		min_count	= 1,
		max_count	= 2,    
		entity 	= "data/entities/animals/giant.xml"
	},
	{
		prob   		= 0.2,
		min_count	= 3,
		max_count	= 6,    
		entity 	= "mods/noitavania/data/entities/iceleg.xml"
	},
	{
		prob   		= 0.05,
		min_count	= 1,
		max_count	= 1,    
		entity 	= "mods/noitavania/data/entities/icezombie.xml"
	},
}

------------ BIG ENEMIES ------------------------------------------------------

g_big_enemies =
{
	total_prob = 0,
	-- this is air, so nothing spawns at 0.6
	{
		prob   		= 0.3,
		min_count	= 0,
		max_count	= 0,    
		entity 	= ""
	},
	-- add skullflys after this step
	{
		prob   		= 0.04,
		min_count	= 1,
		max_count	= 1,    
		entity 	= "data/entities/animals/enlightened_alchemist.xml"
	},
	{
		prob   		= 0.02,
		min_count	= 1,
		max_count	= 1,    
		entity 	= "data/entities/animals/failed_alchemist.xml"
	},
	{
		prob   		= 0.1,
		min_count	= 1,
		max_count	= 1,    
		entity 	= "data/entities/animals/failed_alchemist_b.xml"
	},
	{
		prob   		= 0.08,
		min_count	= 1,
		max_count	= 1,    
		entity 	= "data/entities/animals/thundermage.xml"
	},
	{
		prob   		= 0.04,
		min_count	= 1,
		max_count	= 1,    
		entity 	= "data/entities/animals/firemage.xml"
	},
	{
		prob   		= 0.04,
		min_count	= 1,
		max_count	= 1,    
		entity 	= "data/entities/animals/wizard_tele.xml"
	},
	{
		prob   		= 0.04,
		min_count	= 1,
		max_count	= 1,    
		entity 	= "data/entities/animals/wizard_dark.xml"
	},
	{
		prob   		= 0.04,
		min_count	= 1,
		max_count	= 1,    
		entity 	= "data/entities/animals/wizard_swapper.xml"
	},
	{
		prob   		= 0.04,
		min_count	= 1,
		max_count	= 1,    
		entity 	= "data/entities/animals/wizard_neutral.xml"
	},
	{
		prob   		= 0.04,
		min_count	= 1,
		max_count	= 1,    
		entity 	= "data/entities/animals/wizard_hearty.xml"
	},
	{
		prob   		= 0.04,
		min_count	= 1,
		max_count	= 1,    
		entity 	= "data/entities/animals/wizard_twitchy.xml"
	},
	{
		prob   		= 0.04,
		min_count	= 1,
		max_count	= 1,    
		entity 	= "data/entities/animals/wizard_weaken.xml"
	},
	{
		prob   		= 0.04,
		min_count	= 1,
		max_count	= 1,    
		entity 	= "data/entities/animals/wizard_wither.xml"
	},
	{
		prob   		= 0.04,
		min_count	= 1,
		max_count	= 1,    
		entity 	= "data/entities/animals/barfer.xml"
	},
	{
		prob   		= 0.02,
		min_count	= 2,
		max_count	= 2,    
		entity 	= "mods/noitavania/data/entities/icezombie.xml"
	},
}



---------- UNIQUE ENCOUNTERS ---------------

g_unique_enemy =
{
	total_prob = 0,
	-- this is air, so nothing spawns at 0.6
	{
		prob   		= 0.0,
		min_count	= 0,
		max_count	= 0,    
		entity 	= ""
	},
	-- add skullflys after this step
	{
		prob   		= 1,
		min_count	= 2,
		max_count	= 2,    
		entity 	= "data/entities/animals/enlightened_alchemist.xml"
	},
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
		entity 	= "data/entities/items/wand_level_04.xml"
	},
	{
		prob   		= 5,
		min_count	= 1,
		max_count	= 1,    
		entity 	= "data/entities/items/wand_unshuffle_04.xml"
	},
	{
		prob   		= 2.5,
		min_count	= 1,
		max_count	= 1,    
		entity 	= "data/entities/items/wand_level_04_better.xml"
	},
}

g_bones =
{
	total_prob = 0,
	{
		prob   		= 1,
		min_count	= 1,
		max_count	= 1, 
		entity 	= "",
	},
	{
		prob   		= 0.6,
		min_count	= 1,
		max_count	= 1, 
		entity 	= "data/entities/props/physics_bone_01.xml",
	},
	{
		prob   		= 0.6,
		min_count	= 1,
		max_count	= 1, 
		entity 	= "data/entities/props/physics_bone_02.xml",
	},
	{
		prob   		= 0.6,
		min_count	= 1,
		max_count	= 1, 
		entity 	= "data/entities/props/physics_bone_03.xml",
	},
	{
		prob   		= 0.6,
		min_count	= 1,
		max_count	= 1, 
		entity 	= "data/entities/props/physics_bone_04.xml",
	},
	{
		prob   		= 0.6,
		min_count	= 1,
		max_count	= 1, 
		entity 	= "data/entities/props/physics_bone_05.xml",
	},
	{
		prob   		= 0.6,
		min_count	= 1,
		max_count	= 1, 
		entity 	= "data/entities/props/physics_bone_06.xml",
	},
	{
		prob   		= 0.2,
		min_count	= 1,
		max_count	= 1, 
		entity 	= "data/entities/props/physics_skull_01.xml",
	},
	{
		prob   		= 0.2,
		min_count	= 1,
		max_count	= 1, 
		entity 	= "data/entities/props/physics_skull_02.xml",
	},
	{
		prob   		= 0.2,
		min_count	= 1,
		max_count	= 1, 
		entity 	= "data/entities/props/physics_skull_03.xml",
	},
}
g_props =
{
	total_prob = 0,
	{
		prob   		= 1,
		min_count	= 1,
		max_count	= 1, 
		entity 	= "",
	},
	{
		prob   		= 0.05,
		min_count	= 1,
		max_count	= 1, 
		entity 	= "data/entities/props/physics_campfire.xml",
	},
	{
		prob   		= 0.3,
		min_count	= 1,
		max_count	= 1, 
		entity 	= "data/entities/props/physics_stone_01.xml",
	},
	{
		prob   		= 0.3,
		min_count	= 1,
		max_count	= 1, 
		entity 	= "data/entities/props/physics_stone_02.xml",
	},
	{
		prob   		= 0.3,
		min_count	= 1,
		max_count	= 1, 
		entity 	= "data/entities/props/physics_stone_03.xml",
	},
	{
		prob   		= 0.3,
		min_count	= 1,
		max_count	= 1, 
		entity 	= "data/entities/props/physics_stone_04.xml",
	},
	{
		prob   		= 0.3,
		min_count	= 1,
		max_count	= 1, 
		entity 	= "data/entities/props/physics_stone_04.xml",
	},
	{
		prob   		= 0.3,
		min_count	= 1,
		max_count	= 1, 
		entity 	= "data/entities/props/stonepile.xml",
	},
	{
		prob   		= 0.05,
		min_count	= 1,
		max_count	= 1,    
		entity 	= "data/entities/props/statues/statue_rock_09.xml"
	},
	{
		prob   		= 0.05,
		min_count	= 1,
		max_count	= 1,    
		entity 	= "data/entities/props/statues/statue_rock_10.xml"
	},
	{
		prob   		= 0.05,
		min_count	= 1,
		max_count	= 1,    
		entity 	= "data/entities/props/statues/statue_rock_11.xml"
	},
	{
		prob   		= 0.05,
		min_count	= 1,
		max_count	= 1,    
		entity 	= "data/entities/props/statues/statue_rock_12.xml"
	},
	{
		prob   		= 0.1,
		min_count	= 1,
		max_count	= 3,    
		entity 	= "mods/noitavania/data/entities/iceleg.xml"
	},
}

if GameIsBetaBuild() then
	table.insert(g_big_enemies, 
		{
			prob   		= 0.03,
			min_count	= 1,
			max_count	= 1,    
			entity 	= "data/entities/animals/ethereal_being.xml"
		}
	)
	table.insert(g_big_enemies, 
		{
			prob   		= 0.04,
			min_count	= 1,
			max_count	= 1,    
			entity 	= "data/entities/buildings/snowcrystal.xml"
		}
	)
	table.insert(g_big_enemies, 
		{
			prob   		= 0.02,
			min_count	= 1,
			max_count	= 1,    
			entity 	= "data/entities/animals/thundermage_big.xml"
		}
	)
end

g_ghostlamp =
{
	total_prob = 0,
	-- add skullflys after this step
	{
		prob   		= 1.0,
		min_count	= 1,
		max_count	= 1,  
		offset_y	= 10,
		entity 	= "data/entities/props/physics_chain_torch_ghostly.xml"
	},
}

-- actual functions that get called from the wang generator


function spawn_small_enemies(x, y)
	spawn(g_small_enemies,x,y)
end

function spawn_big_enemies(x, y)
	spawn(g_big_enemies,x,y)
end

function spawn_unique_enemy(x, y)
	spawn(g_unique_enemy,x,y)
end

function spawn_props(x, y)
	spawn(g_props,x,y)
end

function spawn_bones(x, y)
	spawn(g_bones,x,y)
end


function spawn_items(x, y)
	local r = ProceduralRandom( x-11.631, y+10.2257 )
	
	if (r < 0.94) then
		LoadPixelScene( "data/biome_impl/wand_altar.png", "data/biome_impl/wand_altar_visual.png", x-10, y-17, "", true )
	end
end