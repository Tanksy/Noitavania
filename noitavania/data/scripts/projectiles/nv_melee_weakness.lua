dofile_once("data/scripts/lib/utilities.lua")

local entity_id = GetUpdatedEntityID()
local pos_x, pos_y = EntityGetTransform( entity_id )

local proj = EntityLoad("data/entities/projectiles/nv_melee_weakness.xml", pos_x, pos_y)

local comp = EntityGetFirstComponentIncludingDisabled(proj, "ProjectileComponent")
if (comp ~= nil) then
    ComponentSetValue2(comp, "mWhoShot", entity_id)
end

EntityAddChild(entity_id, proj)