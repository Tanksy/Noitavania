local entity_id = GetUpdatedEntityID()
local x, y = EntityGetTransform(entity_id)
local lua_component = GetUpdatedComponentID()
local children = EntityGetAllChildren(entity_id)
if not children then return end
local particle_emitter_entity = children[1]

local material_inventory = EntityGetFirstComponentIncludingDisabled(entity_id, "MaterialInventoryComponent")
local material_inventory_exit = EntityGetFirstComponentIncludingDisabled(particle_emitter_entity, "MaterialInventoryComponent")
local material_count = ComponentGetValue2(material_inventory, "count_per_material_type")
local material_count_exit = ComponentGetValue2(material_inventory_exit, "count_per_material_type")
local lava_count = material_count[CellFactory_GetType("lava")+1]
local lava_count_exit = material_count_exit[CellFactory_GetType("lava")+1]

-- Transfer the lava material over from the base to the emitter
AddMaterialInventoryMaterial(entity_id, "lava", 0)
AddMaterialInventoryMaterial(particle_emitter_entity, "lava", lava_count_exit + lava_count)

local particle_emitter_component = EntityGetFirstComponent(particle_emitter_entity, "ParticleEmitterComponent")
local is_emitting = ComponentGetValue2(particle_emitter_component, "is_emitting")
ComponentSetValue2(particle_emitter_component, "is_emitting", not is_emitting)

SetRandomSeed(GameGetFrameNum(), entity_id + x + y)
ComponentSetValue2(lua_component, "execute_every_n_frame", Random(120, 300))
