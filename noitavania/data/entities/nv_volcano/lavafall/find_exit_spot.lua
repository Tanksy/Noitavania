local entity_id = GetUpdatedEntityID()
local x, y = EntityGetTransform(entity_id)
local did_hit, hit_x, hit_y = RaytraceSurfaces(x, y, x, y - 200)

if did_hit then
  local lavafall_exit = EntityLoad("mods/noitavania/data/entities/nv_volcano/lavafall/exit.xml", hit_x, hit_y)
  EntityAddChild(entity_id, lavafall_exit)
else
  EntityKill(entity_id)
end
