function death(damage_type_bit_field, damage_message, entity_thats_responsible, drop_items)
  local entity_id = GetUpdatedEntityID()
  local x, y = EntityGetTransform(entity_id)
	EntityLoad("mods/noitavania/data/entities/nv_volcano/bigzombietorso.xml", x, y)	
	EntityLoad("mods/noitavania/data/entities/nv_volcano/bigzombiehead.xml", x, y)
end
