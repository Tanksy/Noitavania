local entity_id = GetUpdatedEntityID()
local x, y = EntityGetTransform(entity_id)

local particle_emitter_component = EntityGetFirstComponent(entity_id, "ParticleEmitterComponent")
local material_sucker_component = EntityGetFirstComponentIncludingDisabled(entity_id, "MaterialSuckerComponent")
local is_emitting = ComponentGetValue2(particle_emitter_component, "is_emitting")
ComponentSetValue2(particle_emitter_component, "is_emitting", not is_emitting)
EntitySetComponentIsEnabled(entity_id, material_sucker_component, is_emitting)
