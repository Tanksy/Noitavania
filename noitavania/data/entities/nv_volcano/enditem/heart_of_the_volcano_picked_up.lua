function item_pickup(entity_item, entity_pickupper, item_name)
  local inventory = find_inventory_entity(entity_pickupper)
  local heart_of_the_volcano = EntityLoad("mods/noitavania/data/entities/nv_volcano/enditem/heart_of_the_volcano.xml")
  EntityKill(entity_item)
  EntityAddChild(inventory, heart_of_the_volcano)
  EntitySetComponentsWithTagEnabled(heart_of_the_volcano, "enabled_in_world", false)

  -- local inventory2_comp = EntityGetFirstComponentIncludingDisabled(entity_pickupper, "Inventory2Component")
  -- if( inventory2_comp ) then
  --   ComponentSetValue( inventory2_comp, "mActualActiveItem", "0" )
  -- end

  local x, y = EntityGetTransform(entity_item)
  GameScreenshake(50, x, y)
  EntityLoad("mods/noitavania/data/entities/nv_volcano/enditem/pickup_effect.xml", x, y)
end

function find_inventory_entity(entity_id)
  for i, child in ipairs(EntityGetAllChildren(entity_id) or {}) do
    if EntityGetName(child) == "inventory_quick" then
      return child
    end
  end
end
