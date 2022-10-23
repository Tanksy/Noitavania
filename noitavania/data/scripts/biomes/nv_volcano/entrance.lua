-- default biome functions that get called if we can't find a a specific biome that works for us
CHEST_LEVEL = 3
dofile_once("data/scripts/director_helpers.lua")
dofile_once("data/scripts/biome_scripts.lua")

RegisterSpawnFunction( 0xffffeedd, "init" )

function spawn_small_enemies( x, y ) end
function spawn_big_enemies( x, y ) end
function spawn_items( x, y ) end
function spawn_props( x, y ) end
function spawn_props2( x, y ) end
function spawn_props3( x, y ) end
function spawn_lamp( x, y ) end
function spawn_chest( x, y ) end
function spawn_blood( x, y ) end
function load_pixel_scene( x, y ) end
function load_pixel_scene2( x, y ) end
function spawn_unique_enemy( x, y ) end
function spawn_unique_enemy2( x, y ) end
function spawn_unique_enemy3( x, y ) end
function spawn_save( x, y ) end
function spawn_ghostlamp( x, y ) end
function spawn_persistent_teleport( x, y ) end
function spawn_candles( x, y ) end
function spawn_stash(x, y) end

function init(x, y, w, h)
  local map_width = 70 -- TODO: Get this properly
  local biome_map_x = (x / 512) % map_width -- For parallel worlds
  local biome_map_y = y / 512
  local translate = {
    ["26_-1"] = "0",
    ["27_-1"] = "3",
    ["28_-1"] = "6",
    ["26_0"] = "1",
    ["27_0"] = "4",
    ["28_0"] = "7",
    ["27_1"] = "5",
  }
  local biome_key = biome_map_x .. "_" .. biome_map_y
  if translate[biome_key] ~= nil then
    LoadPixelScene(
      "mods/noitavania/data/scenes/nv_volcano/volcano/"..translate[biome_key]..".png",
      "mods/noitavania/data/scenes/nv_volcano/volcano/"..translate[biome_key].."_visual.png",
      x, y + 150,
      "mods/noitavania/data/scenes/nv_volcano/volcano/"..translate[biome_key].."_background.png", true)
  end
end
