local entity_id = GetUpdatedEntityID()
local x, y = EntityGetTransform(entity_id)
SetRandomSeed(GameGetFrameNum(), x + y)

function get_state()
  local entity_id = GetUpdatedEntityID()
  state = state or {}
  state[entity_id] = state[entity_id] or {
    worm_score_spawned = 0
  }
  return state[entity_id]
end
local state = get_state()

local random_number = Random(1, 500)
local spawn_direction_angle = Randomf(-3.1415, 3.1415)
local entity_to_spawn = nil

if random_number < 2 then
  entity_to_spawn = "data/entities/animals/worm_big.xml"
  state.worm_score_spawned = state.worm_score_spawned + 6
elseif random_number < 8 then
  entity_to_spawn = "data/entities/animals/worm.xml"
  state.worm_score_spawned = state.worm_score_spawned + 2
elseif random_number < 40 then
  entity_to_spawn = "data/entities/animals/worm_tiny.xml"
  state.worm_score_spawned = state.worm_score_spawned + 1
end

if entity_to_spawn then
  local cam_x, cam_y = GameGetCameraPos()
  local viewport_width, viewport_height = 512, 300
  local radius = 256
  local spawn_offset_x = math.cos(spawn_direction_angle) * radius
  local spawn_offset_y = math.sin(spawn_direction_angle) * radius
  -- Make sure it spawns offscreen
  if x + spawn_offset_x > cam_x - (viewport_width/2) and x + spawn_offset_x < cam_x + (viewport_width/2) then
    spawn_offset_x = spawn_offset_x * -1
  end
  if y + spawn_offset_y > cam_y - (viewport_width/2) and y + spawn_offset_y < cam_y + (viewport_width/2) then
    spawn_offset_y = spawn_offset_y * -1
  end

  EntityLoad(entity_to_spawn, x + spawn_offset_x, y + spawn_offset_y)
  -- Break the crystal if enough worms have spawned, so it doesn't generate too many
  if state.worm_score_spawned >= 6 then
    EntityInflictDamage(entity_id, 26.64, "DAMAGE_PHYSICS_BODY_DAMAGED", "Broken", "NORMAL", 0, 0)
  end
end
