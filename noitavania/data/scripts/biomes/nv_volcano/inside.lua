CHEST_LEVEL = 5
dofile_once("data/scripts/director_helpers.lua")
dofile_once("data/scripts/biome_scripts.lua")

RegisterSpawnFunction(0xffffeedd, "init")
RegisterSpawnFunction(0xffa7994a, "spawn_bone_prop")
RegisterSpawnFunction(0xfffff700, "spawn_wand_altar_low_chance")
RegisterSpawnFunction(0xffdb7a7a, "spawn_worm_attractor")
RegisterSpawnFunction(0xffa14e1f, "spawn_geyser")
RegisterSpawnFunction(0xffdf8a5a, "spawn_geyser_small")
RegisterSpawnFunction(0xfff21717, "spawn_lavafall")
RegisterSpawnFunction(0xffda9f16, "spawn_suspended_seamine")
RegisterSpawnFunction(0xff00ba11, "spawn_ballpuzzle")

g_small_enemies =
{
	total_prob = 0,
	{
		prob   		= 1,
		min_count	= 0,
		max_count	= 0,    
		entity 	= ""
	},
	{
		prob   		= 1,
		min_count	= 1,
		max_count	= 1,    
		entity 	= "mods/noitavania/data/entities/nv_volcano/flamer.xml"
	},
	{
		prob   		= 1.5,
		min_count	= 1,
		max_count	= 2,    
		entity 	= "mods/noitavania/data/entities/nv_volcano/firebug.xml"
	},
	{
		prob   		= 1.5,
		min_count	= 1,
		max_count	= 1,    
		entity 	= "mods/noitavania/data/entities/nv_volcano/fireskull.xml"
	},
	{
		prob   		= 1,
		min_count	= 1,
		max_count	= 1,    
		entity 	= "mods/noitavania/data/entities/nv_volcano/miner_fire.xml"
	},
	{
		prob   		= 1.3,
		min_count	= 1,
		max_count	= 1,    
		entity 	= "mods/noitavania/data/entities/nv_volcano/firemage_weak.xml"
	},
	{
		prob   		= 1.3,
		min_count	= 1,
		max_count	= 1,    
		entity 	= "mods/noitavania/data/entities/nv_volcano/scavenger_grenade.xml"
	},
	{
		prob   		= 1.3,
		min_count	= 1,
		max_count	= 1,    
		entity 	= "mods/noitavania/data/entities/nv_volcano/scavenger_smg.xml"
	},
}

g_big_enemies =
{
	total_prob = 0,
	{
		prob   		= 0.2,
		min_count	= 0,
		max_count	= 0,    
		entity 	= ""
	},
	{
		prob   		= 0.7,
		min_count	= 1,
		max_count	= 1,    
		entity 	= "mods/noitavania/data/entities/nv_volcano/bigzombie.xml"
	},
	{
		prob   		= 1,
		min_count	= 1,
		max_count	= 1,    
		entity 	= "mods/noitavania/data/entities/nv_volcano/spitmonster.xml"
	},
	{
		prob   		= 0.5,
		min_count	= 1,
		max_count	= 1,    
		entity 	= "mods/noitavania/data/entities/nv_volcano/gazer.xml"
	},
	{
		prob   		= 1,
		min_count	= 1,
		max_count	= 1,    
		entity 	= "mods/noitavania/data/entities/nv_volcano/scavenger_leader.xml"
	},
}

if ModIsEnabled("new_enemies") then
	table.insert(g_big_enemies, {
		prob   		= 0.4,
		min_count	= 1,
		max_count	= 1,    
		entity 	= "data/entities/animals/lavashooter.xml"
	})
end

g_wands = {
	total_prob = 0,
	{
		prob = 1,
		file = "data/entities/items/wand_level_04.xml",
	},
	{
		prob = 1,
		file = "data/entities/items/wand_unshuffle_04.xml",
	},
	{
		prob = 0.15,
		file = "data/entities/items/wand_unshuffle_05.xml",
	}
}

g_pixel_scene_01 =
{
	total_prob = 0,
	{
		prob   			= 1,
		material_file 	= "mods/noitavania/data/scenes/nv_volcano/horizontal_1.png",
		visual_file		= "",
		background_file	= "",
		is_unique		= 0,
	},
	{
		prob   			= 1,
		material_file 	= "mods/noitavania/data/scenes/nv_volcano/horizontal_2.png",
		visual_file		= "",
		background_file	= "",
		is_unique		= 0,
	},
	{
		prob   			= 1,
		material_file 	= "mods/noitavania/data/scenes/nv_volcano/horizontal_3.png",
		visual_file		= "",
		background_file	= "",
		is_unique		= 0,
	},
	{
		prob   			= 1,
		material_file 	= "mods/noitavania/data/scenes/nv_volcano/horizontal_4.png",
		visual_file		= "",
		background_file	= "",
		is_unique		= 0,
	},
}

g_pixel_scene_02 =
{
	total_prob = 0,
	{
		prob   			= 1,
		material_file 	= "mods/noitavania/data/scenes/nv_volcano/vertical_1.png",
		visual_file		= "mods/noitavania/data/scenes/nv_volcano/vertical_1_visual.png",
		background_file	= "",
		is_unique		= 0,
	},
	{
		prob   			= 1,
		material_file 	= "mods/noitavania/data/scenes/nv_volcano/vertical_2.png",
		visual_file		= "mods/noitavania/data/scenes/nv_volcano/vertical_2_visual.png",
		background_file	= "",
		is_unique		= 0,
	},
	{
		prob   			= 1,
		material_file 	= "mods/noitavania/data/scenes/nv_volcano/vertical_3.png",
		visual_file		= "",
		background_file	= "",
		is_unique		= 0,
	},
}

function init() end

function spawn_bone_prop(x, y)
  SetRandomSeed(GameGetFrameNum(), x + y)
  if Random(2) == 2 then
    EntityLoad("data/entities/props/physics_skull_0"..Random(1,3)..".xml", x, y)
  else
    EntityLoad("data/entities/props/physics_bone_0"..Random(1,6)..".xml", x, y)
  end
end

function spawn_worm_attractor(x, y)
	EntityLoad("mods/noitavania/data/entities/nv_volcano/worm_attractor_crystal.xml", x, y - 32)
end

function spawn_geyser_small(x, y)
	EntityLoad("mods/noitavania/data/entities/nv_volcano/geyser/lavageyser_weak.xml", x + 5, y + 15)
end

function spawn_geyser(x, y)
	EntityLoad("mods/noitavania/data/entities/nv_volcano/geyser/lavageyser.xml", x + 5, y + 15)
end

function spawn_lavafall(x, y)
	-- Origin x, y is at the bottom, shoots a ray to the top to find the position it should spew out of
	EntityLoad("mods/noitavania/data/entities/nv_volcano/lavafall/lavafall.xml", x + 5, y + 13)
end

function spawn_suspended_seamine(x, y)
	EntityLoad("data/entities/props/suspended_seamine.xml", x, y)
end

function spawn_small_enemies(x, y, w, h, is_open_path)
	SetRandomSeed(GameGetFrameNum(), x + y)
	if Random(100) <= 75 then
		local entity_data = random_from_table(g_small_enemies, x, y)
		entity_load_camera_bound(entity_data, x, y, 0, 0)
	end
end

function spawn_big_enemies(x, y, w, h, is_open_path)
	SetRandomSeed(GameGetFrameNum(), x + y)
	if Random(100) <= 75 then
		local entity_data = random_from_table(g_big_enemies, x, y)
		entity_load_camera_bound(entity_data, x, y, 0, 0)
	end
end

function spawn_items(x, y)
  LoadPixelScene("data/biome_impl/wand_altar.png", "data/biome_impl/wand_altar_visual.png", x-5, y-10, "", true)
end

function spawn_wands(x, y)
	EntityLoad(random_from_table(g_wands, GameGetFrameNum(), x + y).file, x, y)
end

function spawn_wand_altar_low_chance(x, y)
  SetRandomSeed(GameGetFrameNum(), x + y)
  if Random(100) <= 30 then
    LoadPixelScene("data/biome_impl/wand_altar.png", "data/biome_impl/wand_altar_visual.png", x-5, y-10, "", true)
  end
end

function spawn_ballpuzzle(x, y)
	SetRandomSeed(GameGetFrameNum(), x + y)
	if Random(100) <= 50 then
		EntityLoad("mods/noitavania/data/entities/nv_volcano/ballgame/ball.xml", x, y)
		EntityLoad("mods/noitavania/data/entities/nv_volcano/ballgame/goal.xml", x + 152, y + 20)
	end
end

function spawn_props(x, y)
  EntityLoad("data/entities/props/physics_seamine.xml", x, y)
end

function spawn_heart(x, y)
	SetRandomSeed(GameGetFrameNum(), x + y)
  if Random(100) <= 25 then
		EntityLoad("data/entities/items/pickup/heart.xml", x+4, y+3)
	end
end

function spawn_potion_altar(x, y)
  LoadPixelScene( "data/biome_impl/potion_altar.png", "data/biome_impl/potion_altar_visual.png", x-5, y-15, "", true )
end

function spawn_potions(x, y)
  EntityLoad("data/entities/items/pickup/potion.xml", x, y-2)
end

-- horizontal
function load_pixel_scene(x, y)
	--LoadPixelScene("mods/VolcanoBiome/files/pixel_scene_horizontal_3.png", "", x, y, "", false, false)
	--GameCreateSpriteForXFrames("data/debug/circle_16.png", x, y, true, 0, 0, 1000000)
	-- local temp = LoadPixelScene
	-- LoadPixelScene = function(a, b, x, y, c)
	-- 	temp(a, b, x, y, c, true, false)
	-- end
	load_random_pixel_scene(g_pixel_scene_01, x, y)
	-- LoadPixelScene = temp
end

-- vertical
function load_pixel_scene2(x, y)
	--LoadPixelScene("mods/VolcanoBiome/files/pixel_scene_vertical_3.png", "", x, y, "", false, false)
	--GameCreateSpriteForXFrames("data/debug/circle_16.png", x, y, true, 0, 0, 1000000)
	-- local temp = LoadPixelScene
	-- LoadPixelScene = function(a, b, x, y, c)
	-- 	temp(a, b, x, y, c, true, false)
	-- end
	load_random_pixel_scene(g_pixel_scene_02, x, y)
	-- LoadPixelScene = temp
end

function spawn_props2() end
function spawn_props3() end
function spawn_lamp() end
function spawn_unique_enemy() end
function spawn_unique_enemy2() end
function spawn_unique_enemy3() end
function spawn_ghostlamp() end
function spawn_candles() end
function spawn_apparition() end
function spawn_portal() end
function spawn_end_portal() end
function spawn_orb() end
function spawn_perk() end
function spawn_all_perks() end
function spawn_wand_trap() end
function spawn_wand_trap_ignite_a() end
function spawn_wand_trap_ignite_b() end
function spawn_wand_trap_electricity_source() end
function spawn_wand_trap_electricity() end
function spawn_moon() end
