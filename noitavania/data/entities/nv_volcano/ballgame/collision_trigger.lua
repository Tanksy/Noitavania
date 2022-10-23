function collision_trigger(colliding_entity_id)
  local x, y = EntityGetTransform(colliding_entity_id)
  EntityKill(colliding_entity_id)
  EntityLoad("mods/noitavania/data/entities/nv_volcano/ballgame/explosion.xml", x, y)
  if EntityGetName(colliding_entity_id) == "volcanobiome_ball" then
    -- Spawn a heart, 1000 gold or a level 5 no shuffle wand at 33% chance each
    SetRandomSeed(GameGetFrameNum(), x + y)
    local random_number = Random(1, 100)
    if random_number < 33 then
      EntityLoad("data/entities/items/pickup/heart.xml", x, y)
    elseif random_number < 66 then
      spawn_gold(x, y)
    else
      EntityLoad("data/entities/items/wand_unshuffle_05.xml", x, y)
    end
  end
end

function spawn_gold(x, y)
  local gold_entity = EntityLoad("data/entities/items/pickup/goldnugget_1000.xml", x, y - 8)
  local lifetime_components = EntityGetComponent( gold_entity, "LifetimeComponent")
  if lifetime_components ~= nil then
    for i,lifetime_comp in ipairs(lifetime_components) do
      EntityRemoveComponent(gold_entity, lifetime_comp)
    end
  end
end
