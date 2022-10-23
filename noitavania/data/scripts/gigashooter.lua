dofile_once("data/scripts/lib/utilities.lua")

function damage_received(damage, message,entity_thats_responsible, is_fatal)
  local entity_id = GetUpdatedEntityID()
  state = state or {}
  state[entity_id] = state[entity_id] or { previous_percentage = 100 }
  local damage_model_component = EntityGetFirstComponent(entity_id, "DamageModelComponent")
  if damage_model_component ~= nil then
    local hp = ComponentGetValue(damage_model_component, "hp")
    local max_hp = ComponentGetValue(damage_model_component, "max_hp")
    local percentage = hp / max_hp * 100
    local entity_id    = GetUpdatedEntityID()
    local pos_x, pos_y = EntityGetTransform( entity_id )
    SetRandomSeed( GameGetFrameNum(), pos_x + pos_y + entity_id )
    pos_x = pos_x + rand(-5, 5)
    pos_y = pos_y + rand(-5, 5)
    
    if state[entity_id].previous_percentage > 5 and percentage < 5 then
        EntityLoad( "mods/noitavania/data/entities/projectiles/death_cross_big_explosion_purple.xml", pos_x, pos_y )
    elseif state[entity_id].previous_percentage > 25 and percentage < 25 then
        EntityLoad( "data/entities/animals/lasershooter.xml", pos_x, pos_y )
    elseif state[entity_id].previous_percentage > 50 and percentage < 50 then
        EntityLoad( "data/entities/animals/lasershooter.xml", pos_x, pos_y )
    elseif state[entity_id].previous_percentage > 75 and percentage < 75 then
        EntityLoad( "data/entities/animals/lasershooter.xml", pos_x, pos_y )
    end
    state[entity_id].previous_percentage = percentage
  end
end