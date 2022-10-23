CHEST_LEVEL = 5
dofile_once("data/scripts/director_helpers.lua")
dofile_once("data/scripts/biome_scripts.lua")

RegisterSpawnFunction(0xffffeedd, "init")

function init(x, y, w, h)
	LoadPixelScene("mods/noitavania/data/scenes/nv_volcano/bottom.png", "", x, y - 0, "", true)
end

function spawn_portal(x, y)
	local portal_entity = EntityLoad("data/entities/buildings/teleport.xml", x, y)
	local teleport_component = EntityGetFirstComponent(portal_entity, "TeleportComponent")
	ComponentSetValue(teleport_component, "target_x_is_absolute_position", "1")
	ComponentSetValue(teleport_component, "target_y_is_absolute_position", "1")
	ComponentSetValueVector2(teleport_component, "target", 14079, 4238)
	local uiinfo_component = EntityGetFirstComponent(portal_entity, "UIInfoComponent")
	ComponentSetValue(uiinfo_component, "name", "Portal to the Exit")
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
function spawn_all_perks() end
function spawn_orb() end
function spawn_wand_trap() end
function spawn_wand_trap_ignite_a() end
function spawn_wand_trap_ignite_b() end
function spawn_wand_trap_electricity_source() end
function spawn_wand_trap_electricity() end
function spawn_moon() end
