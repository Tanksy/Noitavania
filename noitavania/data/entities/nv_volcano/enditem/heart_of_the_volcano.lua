function enabled_changed(entity_id, is_enabled)
  local owner_id = EntityGetParent(EntityGetParent(entity_id))

  -- Store the original values in VariableStorageComponents so we can later revert to them
  local initial_flammability = get_stored_initial_value(owner_id, "flammability")
  if not initial_flammability then
    initial_flammability = get_flammability(owner_id)
    store_orig_value(owner_id, "flammability", initial_flammability)
  end
  local initial_lava_damage = get_stored_initial_value(owner_id, "lava_damage")
  if not initial_lava_damage then
    local initial_lava_damage = get_material_damage(owner_id, "lava")
    store_orig_value(owner_id, "lava_damage", initial_lava_damage)
  end

  if is_enabled then
    change_flammability(owner_id, 0)
    change_material_damages(owner_id, { lava = 0 })
  else
    -- Only revert it to the original value if we changed it in the first place
    local initial_flammability = get_stored_initial_value(owner_id, "flammability")
    if initial_flammability then
      change_flammability(owner_id, tonumber(initial_flammability))
    end
    local initial_lava_damage = get_stored_initial_value(owner_id, "lava_damage")
    if initial_lava_damage then
      change_material_damages(owner_id, { lava = initial_lava_damage })
    end
  end
end

function get_stored_initial_value(entity_id, value_name)
  local comps = EntityGetComponentIncludingDisabled(entity_id, "VariableStorageComponent") or {}
  for i, comp in ipairs(comps) do
    if ComponentGetValue2(comp, "name") == "volcanobiome_orig_" .. value_name then
      return ComponentGetValue2(comp, "value_string")
    end
  end
end

function store_orig_value(entity_id, value_name, value)
  if not get_stored_initial_value(entity_id, value) then
    EntityAddComponent2(entity_id, "VariableStorageComponent", {
      name="volcanobiome_orig_" .. value_name,
      value_string=value
    })
  end
end

function get_material_damage(entity_id, material_name)
  local damage_model_component = EntityGetFirstComponentIncludingDisabled(entity_id, "DamageModelComponent")
  if damage_model_component ~= nil then
    local materials_that_damage = stringsplit(ComponentGetValue2(damage_model_component, "materials_that_damage"), ",")
    local materials_how_much_damage = stringsplit(ComponentGetValue2(damage_model_component, "materials_how_much_damage"), ",")
    for i, v in ipairs(materials_that_damage) do
      if v == material_name then
        return materials_how_much_damage[i]
      end
    end
  end
end

function stringsplit (inputstr, sep)
  sep = sep or "%s"
  local t = {}
  for str in string.gmatch(inputstr, "([^"..sep.."]+)") do
    table.insert(t, str)
  end
  return t
end

function get_flammability(entity_id)
  local damage_model_component = EntityGetFirstComponentIncludingDisabled(entity_id, "DamageModelComponent")
  if damage_model_component ~= nil then
    return ComponentGetValue2(damage_model_component, "fire_probability_of_ignition")
  end
end

function change_flammability(entity_id, new_value)
  local damage_model_component = EntityGetFirstComponentIncludingDisabled(entity_id, "DamageModelComponent")
  if damage_model_component ~= nil then
    ComponentSetValue2(damage_model_component, "fire_probability_of_ignition", new_value)
  end
end

function change_material_damages(entity_id, materials)
  local damage_model_component = EntityGetFirstComponentIncludingDisabled(entity_id, "DamageModelComponent")
  if damage_model_component ~= nil then
    -- Store all old values
    local old_values = {}
    local old_damage_multipliers = {}
    for k,v in pairs(ComponentGetMembers(damage_model_component)) do
      if k == "ragdoll_fx_forced" then
        v = ComponentGetValue2(damage_model_component, k)
      end
      old_values[k] = v
    end
    for k,_ in pairs(ComponentObjectGetMembers(damage_model_component, "damage_multipliers")) do
      old_damage_multipliers[k] = ComponentObjectGetValue(damage_model_component, "damage_multipliers", k)
    end
    local materials_that_damage = stringsplit(old_values.materials_that_damage, ",")
    local materials_how_much_damage = stringsplit(old_values.materials_how_much_damage, ",")

    for material_name, damage_amount in pairs(materials) do
      for i, material_that_damages in ipairs(materials_that_damage) do
        if material_that_damages == material_name then
          materials_how_much_damage[i] = damage_amount
        end
      end
    end
    -- Rebuild the comma separated string
    old_values.materials_that_damage = ""
    old_values.materials_how_much_damage = ""

    for i, v in ipairs(materials_that_damage) do
      old_values.materials_that_damage = old_values.materials_that_damage .. v
      if i < #materials_that_damage then
        old_values.materials_that_damage = old_values.materials_that_damage .. ","
      end
    end

    for i, v in ipairs(materials_how_much_damage) do
      old_values.materials_how_much_damage = old_values.materials_how_much_damage .. v
      if i < #materials_how_much_damage then
        old_values.materials_how_much_damage = old_values.materials_how_much_damage .. ","
      end
    end

    EntityRemoveComponent(entity_id, damage_model_component)
    damage_model_component = EntityAddComponent(entity_id, "DamageModelComponent", old_values)
    ComponentSetValue2(damage_model_component, "ragdoll_fx_forced", old_values.ragdoll_fx_forced)
    for k, v in pairs(old_damage_multipliers) do
      ComponentObjectSetValue(damage_model_component, "damage_multipliers", k, v)
    end
  end
end
