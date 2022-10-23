CHEST_LEVEL = 5
dofile_once("data/scripts/director_helpers.lua")
dofile_once("data/scripts/biome_scripts.lua")
dofile_once("data/scripts/perks/perk.lua")
-- ffff0000,spawn_small_enemies,-1,-1,-1,-1
-- ff800000,spawn_big_enemies,-1,-1,-1,-1
-- ff00ff00,spawn_items,-1,-1,-1,-1
-- ffc88d1a,spawn_props,-1,-1,-1,-1
-- ffc88000,spawn_props2,-1,-1,-1,-1
-- ffc80040,spawn_props3,-1,-1,-1,-1
-- ffffff00,spawn_lamp,-1,-1,-1,-1
-- ffff0aff,load_pixel_scene,-1,-1,-1,-1
-- ffFF0080,load_pixel_scene2,-1,-1,-1,-1
-- ffFF8000,spawn_unique_enemy,-1,-1,-1,-1
-- ffc84040,spawn_unique_enemy2,-1,-1,-1,-1
-- ff804040,spawn_unique_enemy3,-1,-1,-1,-1
-- ff96C850,spawn_ghostlamp,-1,-1,-1,-1
-- ff60A064,spawn_candles,-1,-1,-1,-1
-- ff50a000,spawn_potion_altar,-1,-1,-1,-1
-- ffbca0f0,spawn_potions,-1,-1,-1,-1
-- ff00FF5A,spawn_apparition,-1,-1,-1,-1
-- ff78FFFF,spawn_heart,-1,-1,-1,-1
-- ff50A0F0,spawn_wands,-3,-3,-4,-4
-- ffbf26a6,spawn_portal,-1,-1,-1,-1
-- ff04A977,spawn_end_portal,-1,-1,-1,-1
-- ffffd171,spawn_orb,-1,-1,-1,-1
-- ffffd181,spawn_perk,-1,-1,-1,-1
-- ffffff81,spawn_all_perks,-1,-1,-1,-1
-- ffc7eb28,spawn_wand_trap,-1,-1,-1,-1
-- ffE8FF80,spawn_wand_trap_ignite_a,-1,-1,-1,-1
-- ffE8FF81,spawn_wand_trap_ignite_b,-1,-1,-1,-1
-- ff2768DE,spawn_wand_trap_electricity_source,-1,-1,-1,-1
-- ff2768DF,spawn_wand_trap_electricity,-1,-1,-1,-1
-- ff6b4f9b,spawn_moon,-1,-1,-1,-1

RegisterSpawnFunction(0xffffeedd, "init")
RegisterSpawnFunction(0xff7345DF, "spawn_perk_reroll")
RegisterSpawnFunction(0xff8590ff, "spawn_spells")
RegisterSpawnFunction(0xff6d934c, "spawn_hp")
RegisterSpawnFunction(0xff4d517a, "spawn_enditem_altar")
RegisterSpawnFunction(0xff2b70b6, "spawn_enditem")

function init(x, y, w, h)
	LoadPixelScene("mods/noitavania/data/scenes/nv_volcano/exit.png", "", x, y, "", true)
end

function spawn_all_perks(x, y)
	perk_spawn_many(x - 30, y)
	local workshop_entity = EntityCreateNew()
	EntityAddTag(workshop_entity, "workshop")
	EntitySetTransform(workshop_entity, x, y)
	EntityAddComponent2(workshop_entity, "HitboxComponent", {
		aabb_min_x=-120,
		aabb_max_x=120,
		aabb_min_y=-100,
		aabb_max_y=200,
	})
end

function spawn_perk_reroll( x, y )
	EntityLoad("data/entities/items/pickup/perk_reroll.xml", x, y)
end

function spawn_spells(x, y)
	local count = 6
	local width = 20
	local offset = -(count / 2) * width - (width / 2)

	for i=1,count do
		SpawnActionItem(x + offset + i*width, y, 6)
	end
end

function spawn_hp(x, y)
	EntityLoad("data/entities/items/pickup/heart_fullhp_temple.xml", x-16, y)
	EntityLoad("data/entities/items/pickup/spell_refresh.xml", x+16, y)
end

function spawn_enditem_altar(x, y)
	LoadPixelScene("mods/noitavania/data/entities/nv_volcano/enditem/altar.png", "mods/noitavania/data/entities/nv_volcano/enditem/altar_visual.png", x-9, y-14, "", true)
end

function spawn_enditem(x, y)
	EntityLoad("mods/noitavania/data/entities/nv_volcano/enditem/heart_of_the_volcano_dummy.xml", x, y - 5)
end

function spawn_portal(x, y)
	local portal_entity = EntityLoad("data/entities/buildings/teleport.xml", x, y)
	local teleport_component = EntityGetFirstComponent(portal_entity, "TeleportComponent")
	ComponentSetValue(teleport_component, "target_x_is_absolute_position", "0")
	ComponentSetValue(teleport_component, "target_y_is_absolute_position", "1")
	local target_x, target_y = -600, -150
	local portal_target = "to surface"
	if GlobalsGetValue("VOLCANO_BIOME_CHALICE_PORTAL_ACTIVATED", "0") == "1" then
		target_x, target_y = -14765, 8500
		portal_target = "back down"
	end
	ComponentSetValueVector2(teleport_component, "target", target_x, target_y)
	local uiinfo_component = EntityGetFirstComponent(portal_entity, "UIInfoComponent")
	ComponentSetValue(uiinfo_component, "name", "Portal " .. portal_target)
end

function spawn_small_enemies(x, y) end
function spawn_big_enemies(x, y) end
function spawn_items(x, y) end
function spawn_wands(x, y) end
function spawn_props(x, y) end
function spawn_heart(x, y) end
function spawn_potion_altar(x, y) end
function spawn_potions(x, y) end
function load_pixel_scene(x, y) end
function load_pixel_scene2(x, y) end
function spawn_props2() end
function spawn_props3() end
function spawn_lamp() end
function spawn_unique_enemy() end
function spawn_unique_enemy2() end
function spawn_unique_enemy3() end
function spawn_ghostlamp() end
function spawn_candles() end
function spawn_apparition() end
function spawn_end_portal() end
function spawn_perk() end
function spawn_orb() end
function spawn_wand_trap() end
function spawn_wand_trap_ignite_a() end
function spawn_wand_trap_ignite_b() end
function spawn_wand_trap_electricity_source() end
function spawn_wand_trap_electricity() end
function spawn_moon() end
