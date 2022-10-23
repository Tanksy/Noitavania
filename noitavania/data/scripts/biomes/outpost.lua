-- default biome functions that get called if we can't find a a specific biome that works for us
-- The level of action ids that are spawned from the chests
CHEST_LEVEL = 3
dofile_once("data/scripts/director_helpers.lua")
dofile_once("data/scripts/biome_scripts.lua")

RegisterSpawnFunction( 0xffC8C800, "spawn_lamp" )
RegisterSpawnFunction( 0xffDC0060, "spawn_props" )
RegisterSpawnFunction( 0xff80FF5A, "spawn_vines" )
RegisterSpawnFunction( 0xff44609c, "load_pillar_filler" )
RegisterSpawnFunction( 0xff44449c, "load_pillar_filler_tall" )
RegisterSpawnFunction( 0xffffa659, "load_furniture" )
RegisterSpawnFunction( 0xfffec390, "load_furniture_bunk" )
RegisterSpawnFunction( 0xffb05830, "load_pod_small_l" )
RegisterSpawnFunction( 0xffb09030, "load_pod_small_r" )
RegisterSpawnFunction( 0xffb03058, "load_pod_large" )

RegisterSpawnFunction( 0xffc133ff, "load_chamfer_top_r" )
RegisterSpawnFunction( 0xff8b33ff, "load_chamfer_top_l" )
RegisterSpawnFunction( 0xff8824b3, "load_chamfer_bottom_r" )
RegisterSpawnFunction( 0xff5f23ad, "load_chamfer_bottom_l" )
RegisterSpawnFunction( 0xff73ffa7, "load_chamfer_inner_top_r" )
RegisterSpawnFunction( 0xffd5ff7f, "load_chamfer_inner_top_l" )
RegisterSpawnFunction( 0xff387d51, "load_chamfer_inner_bottom_r" )
RegisterSpawnFunction( 0xff97b55b, "load_chamfer_inner_bottom_l" )


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
				min_count	= 1,
				max_count	= 2,
				entity	= "data/entities/animals/scavenger_smg.xml",
			},
			{
				min_count	= 0,
				max_count 	= 1,
				entity = "data/entities/animals/scavenger_heal.xml",
			},
		}
	},
	{
		prob   		= 0.05,
		min_count	= 1,
		max_count	= 2,    
		entity 	= "data/entities/animals/tank_rocket.xml"
	},
	{
		prob   		= 0.025,
		min_count	= 1,
		max_count	= 2,    
		entity 	= "data/entities/animals/flamer.xml"
	},
	{
		prob   		= 0.2,
		min_count	= 1,
		max_count	= 1,    
		entity 	= "data/entities/animals/scavenger_clusterbomb.xml"
	},
	{
		prob   		= 0.1,
		min_count	= 1,
		max_count	= 1,    
		entity 	= "data/entities/animals/scavenger_mine.xml"
	},
	{
		prob   		= 0.2,
		min_count	= 1,
		max_count	= 1,    
		entity 	= "data/entities/animals/scavenger_poison.xml"
	},
	{
		prob   		= 0.09,
		min_count	= 1,
		max_count	= 1,    
		entity 	= "data/entities/animals/scavenger_leader.xml"
	},
	{
		prob   		= 0.05,
		min_count	= 1,
		max_count	= 1,    
		entity 	= "data/entities/animals/scavenger_invis.xml"
	},
	{
		prob   		= 0.025,
		min_count	= 1,
		max_count	= 2,    
		entity 	= "mods/noitavania/data/entities/jolter.xml"
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
		prob   		= 0.1,
		min_count	= 1,
		max_count	= 1,    
		entities 	=  {
			"data/entities/animals/scavenger_leader.xml",
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
				min_count	= 0,
				max_count 	= 1,
				entity = "data/entities/animals/scavenger_heal.xml",
			},
		}
	},
	{
		prob   		= 0.1,
		min_count	= 1,
		max_count	= 1,    
		entity 	= "data/entities/animals/tank.xml"
	},
	{
		prob   		= 0.03,
		min_count	= 1,
		max_count	= 1,    
		entity 	= "data/entities/animals/tank_rocket.xml"
	},
	{
		prob   		= 0.01,
		min_count	= 1,
		max_count	= 1,    
		entity 	= "data/entities/animals/tank_super.xml"
	},
	{
		prob   		= 0.05,
		min_count	= 1,
		max_count	= 2,    
		entity 	= "data/entities/animals/flamer.xml"
	},
	{
		prob   		= 0.07,
		min_count	= 1,
		max_count	= 2,    
		entity 	= "data/entities/animals/coward.xml"
	},
	{
		prob   		= 0.02,
		min_count	= 1,
		max_count	= 1,    
		entities 	=  {
			"data/entities/animals/scavenger_clusterbomb.xml",
			{
				min_count	= 1,
				max_count 	= 2,
				entity = "data/entities/animals/scavenger_grenade.xml",
			},
			{
				min_count	= 1,
				max_count 	= 2,
				entity = "data/entities/animals/scavenger_smg.xml",
			},
			{
				min_count	= 0,
				max_count 	= 1,
				entity = "data/entities/animals/scavenger_heal.xml",
			},
			{
				min_count	= 0,
				max_count	= 1,    
				entity 	= "data/entities/animals/coward.xml"
			},
		},
	},
	{
		prob   		= 0.02,
		min_count	= 1,
		max_count	= 1,    
		entities 	= { "data/entities/animals/flamer.xml", "mods/noitavania/data/entities/jolter.xml" },
	},
	{
		prob   		= 0.05,
		min_count	= 1,
		max_count	= 2,    
		entity 	= "mods/noitavania/data/entities/jolter.xml"
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
		prob   		= 0.4,
		min_count	= 1,
		max_count	= 1,    
		entity 	= "data/entities/animals/tank.xml"
	},
	{
		prob   		= 0.1,
		min_count	= 1,
		max_count	= 1,    
		entity 	= "data/entities/animals/tank_rocket.xml"
	},
	{
		prob   		= 0.02,
		min_count	= 1,
		max_count	= 1,    
		entity 	= "data/entities/animals/tank_super.xml"
	},
}

g_unique_enemy2 =
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
		prob   		= 0.6,
		min_count	= 1,
		max_count	= 2,    
		entity 	= "data/entities/animals/scavenger_grenade.xml"
	},
	{
		prob   		= 0.6,
		min_count	= 1,
		max_count	= 2,    
		entity 	= "data/entities/animals/scavenger_smg.xml"
	},
	{
		prob   		= 0.5,
		min_count	= 1,
		max_count	= 1,    
		entity 	= "data/entities/animals/sniper.xml"
	},
}

------------ ITEMS ------------------------------------------------------------

g_items =
{
	total_prob = 0,
	-- this is air, so nothing spawns at 0.6
	{
		prob   		= 2,
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
	{
		prob   		= 2,
		min_count	= 1,
		max_count	= 1,    
		entity 	= "data/entities/items/wand_level_05.xml"
	},
	{
		prob   		= 2,
		min_count	= 1,
		max_count	= 1,    
		entity 	= "data/entities/items/wand_unshuffle_05.xml"
	},
	{
		prob   		= 1,
		min_count	= 1,
		max_count	= 1,    
		entity 	= "data/entities/items/wand_level_05_better.xml"
	},
}

g_lamp =
{
	total_prob = 0,
	-- add skullflys after this step
	{
		prob   		= 1.0,
		min_count	= 1,
		max_count	= 1,    
		entity 	= "data/entities/props/physics_tubelamp.xml"
	},
}

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

g_furniture =
{
	total_prob = 0,
	{
		prob   		= 2.0,
		min_count	= 1,
		max_count	= 1, 
		entity 	= ""
	},
	{
		prob   		= 1.0,
		min_count	= 1,
		max_count	= 1, 
		entity 	= "data/entities/props/furniture_bunk.xml"
	},
	{
		prob   		= 1.0,
		min_count	= 1,
		max_count	= 1, 
		entity 	= "data/entities/props/furniture_table.xml"
	},
	{
		prob   		= 1.0,
		min_count	= 1,
		max_count	= 1, 
		entity 	= "data/entities/props/furniture_locker.xml"
	},
	{
		prob   		= 1.0,
		min_count	= 1,
		max_count	= 1, 
		entity 	= "data/entities/props/furniture_footlocker.xml"
	},
	{
		prob   		= 1.0,
		min_count	= 1,
		max_count	= 1, 
		entity 	= "data/entities/props/furniture_stool.xml"
	},
}

g_props =
{
	total_prob = 0,
	{
		prob   		= 0.2,
		min_count	= 0,
		max_count	= 0,
		offset_y 	= 0,    
		entity 	= ""
	},
	{
		prob   		= 0.5,
		min_count	= 1,
		max_count	= 1,    
		offset_y 	= -8,
		entity 	= "data/entities/props/physics_seamine.xml"
	},
	{
		prob   		= 0.2,
		min_count	= 1,
		max_count	= 1,
		offset_y 	= 0,    
		entity 	= "data/entities/props/physics_barrel_radioactive.xml"
	},
}
g_vines =
{
	total_prob = 0,
	{
		prob   		= 0.5,
		min_count	= 1,
		max_count	= 1,    
		entity 	= ""
	},
	{
		prob   		= 2.0,
		min_count	= 1,
		max_count	= 1,    
		entity 	= "data/entities/props/physics_hanging_wire.xml"
	},
}


-- actual functions that get called from the wang generator




g_pods_small_l =
{
	total_prob = 0,
	{
		prob   			= 1.5,
		material_file 	= "data/biome_impl/snowcastle/pod_small_l_blank_01.png",
		visual_file		= "",
		background_file	= "",
		is_unique		= 0
	},
	{
		prob   			= 1.0,
		material_file 	= "data/biome_impl/snowcastle/pod_small_l_01.png",
		visual_file		= "",
		background_file	= "data/biome_impl/snowcastle/pod_small_l_01_background.png",
		is_unique		= 0
	},
	{
		prob   			= 1.0,
		material_file 	= "data/biome_impl/snowcastle/pod_small_l_01.png",
		visual_file		= "",
		background_file	= "data/biome_impl/snowcastle/pod_small_l_01_background_b.png",
		is_unique		= 0
	},
}

g_pods_small_r =
{
	total_prob = 0,
	{
		prob   			= 1.5,
		material_file 	= "data/biome_impl/snowcastle/pod_small_r_blank_01.png",
		visual_file		= "",
		background_file	= "",
		is_unique		= 0
	},
	{
		prob   			= 1.0,
		material_file 	= "data/biome_impl/snowcastle/pod_small_r_01.png",
		visual_file		= "",
		background_file	= "data/biome_impl/snowcastle/pod_small_r_01_background.png",
		is_unique		= 0
	},
	{
		prob   			= 1.0,
		material_file 	= "data/biome_impl/snowcastle/pod_small_r_01.png",
		visual_file		= "",
		background_file	= "data/biome_impl/snowcastle/pod_small_r_01_background_b.png",
		is_unique		= 0
	},
}
g_pods_large =
{
	total_prob = 0,
	{
		prob   			= 0.5,
		material_file 	= "data/biome_impl/snowcastle/pod_large_blank_01.png",
		visual_file		= "",
		background_file	= "",
		is_unique		= 0
	},
	{
		prob   			= 0.5,
		material_file 	= "data/biome_impl/snowcastle/pod_large_01.png",
		visual_file		= "",
		background_file	= "data/biome_impl/snowcastle/pod_large_01_background.png",
		is_unique		= 0
	},
	{
		prob   			= 0.5,
		material_file 	= "data/biome_impl/snowcastle/pod_large_01.png",
		visual_file		= "",
		background_file	= "data/biome_impl/snowcastle/pod_large_01_background_b.png",
		is_unique		= 0
	},
		{
		prob   			= 0.5,
		material_file 	= "data/biome_impl/snowcastle/pod_large_01.png",
		visual_file		= "",
		background_file	= "data/biome_impl/snowcastle/pod_large_01_background_c.png",
		is_unique		= 0
	},
	{
		prob   			= 2.0,
		material_file 	= "mods/noitavania/data/biome_gfx/outpost/pod_large_dead.png",
		visual_file		= "",
		background_file	= "mods/noitavania/data/biome_gfx/outpost/pod_large_01_background_dead.png",
		is_unique		= 0
	},
}

-- Chamfer corner pieces. 4 outer corners + 4 inner corners
-- /\ /\
-- \/ \/

function load_chamfer_top_r(x,y)
	
	LoadPixelScene( "data/biome_impl/snowcastle/chamfer_top_r.png", "", x-10, y, "", true )
end

function load_chamfer_top_l(x,y)
	
	LoadPixelScene( "data/biome_impl/snowcastle/chamfer_top_l.png", "", x-1, y, "", true )
end

function load_chamfer_bottom_r(x,y)
	
	LoadPixelScene( "data/biome_impl/snowcastle/chamfer_bottom_r.png", "", x-10, y-20, "", true )
end

function load_chamfer_bottom_l(x,y)
	
	LoadPixelScene( "data/biome_impl/snowcastle/chamfer_bottom_l.png", "", x-1, y-20, "", true )
end

function load_chamfer_inner_top_r(x,y)
	
	LoadPixelScene( "data/biome_impl/snowcastle/chamfer_inner_top_r.png", "", x-10, y, "", true )
end

function load_chamfer_inner_top_l(x,y)
	
	LoadPixelScene( "data/biome_impl/snowcastle/chamfer_inner_top_l.png", "", x, y, "", true )
end

function load_chamfer_inner_bottom_r(x,y)
	
	LoadPixelScene( "data/biome_impl/snowcastle/chamfer_inner_bottom_r.png", "", x-10, y-20, "", true )
end

function load_chamfer_inner_bottom_l(x,y)
	
	LoadPixelScene( "data/biome_impl/snowcastle/chamfer_inner_bottom_l.png", "", x, y-20, "", true )
end

function load_pod_small_l( x, y )
	
	load_random_pixel_scene(g_pods_small_l, x-30, y-40)
end

function load_pod_small_r( x, y )
	
	load_random_pixel_scene(g_pods_small_r, x-10, y-40)
end

function load_pod_large( x, y )
	
	load_random_pixel_scene(g_pods_large, x, y-50)
end

function spawn_small_enemies(x, y)
	spawn(g_small_enemies,x,y)
end

function spawn_big_enemies(x, y)
	spawn(g_big_enemies,x,y)
end

function spawn_unique_enemy(x, y)
	spawn(g_unique_enemy,x,y)
end

function spawn_unique_enemy2(x, y)
	spawn(g_unique_enemy2,x,y)
end

function spawn_items(x, y)
	local r = ProceduralRandom( x-11.631, y+10.2257 )
	
	if (r < 0.94) then
		LoadPixelScene( "data/biome_impl/wand_altar.png", "data/biome_impl/wand_altar_visual.png", x-10, y-17, "", true )
	end
end

function spawn_vines(x, y)
	spawn(g_vines,x+5,y+5)
end

function spawn_lamp(x, y)
	spawn(g_lamp,x+5,y,0,0)
end

function spawn_props(x, y)
	spawn(g_props,x,y-3,0,0)
end

function load_furniture( x, y )
	spawn(g_furniture,x,y+5,0,0)
end

function load_furniture_bunk( x, y )
		EntityLoad("data/entities/props/furniture_bunk.xml", x, y+5)
end

function load_pillar_filler(x,y)
	LoadPixelScene( "data/biome_impl/snowcastle/pillar_filler_01.png", "", x, y, "", true )
end

function load_pillar_filler_tall(x,y)
	LoadPixelScene( "data/biome_impl/snowcastle/pillar_filler_tall_01.png", "", x, y, "", true )
end