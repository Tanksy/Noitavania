dofile("mods/noitavania/util/utilities.lua")

function ComponentAdjustValues( component, member_callback_table )
    for member,callback in pairs( member_callback_table ) do
        ComponentSetValue2( component, member, callback( ComponentGetValue2( component, member ) ) )
    end
end

--Attempts to get the VariableStorageComponent with aTag, and if it fails returns aDefault.
function EntityGetVariableString( aEntity, aTag, aDefault )
    local variable = EntityGetFirstComponent( aEntity, "VariableStorageComponent", aTag );
    if variable ~= nil then
        return ComponentGetValue2( variable, "value_string" );
    end
    return aDefault;
end

--Attempts to set the VariableStorageComponent with aTag, and creates a VSC if one doesn't exist.
function EntitySetVariableString( aEntity, aTag, aValue )
    local current_variable = EntityGetFirstComponent( aEntity, "VariableStorageComponent", aTag );
    if current_variable == nil then
        EntityAddComponent( aEntity, "VariableStorageComponent", {
            _tags=aTag..",enabled_in_world,enabled_in_hand,enabled_in_inventory",
            value_string=tostring(aValue)
        } );
    else
        ComponentSetValue2( current_variable, "value_string", aValue );
    end
end

--Difficulty scaling only starts to take effect after the player has visited more than one biome.
if tonumber(StatsGetValue("places_visited")) > 1 then
	--Get our number of places visited.
	local placesVisited = tonumber(StatsGetValue("places_visited"))
	--Calculate the multipliers we'll be applying.
	--Speed mult is a linear % increase per places visited.
	local speedMultiplier = 1 + (tonumber(GetSetting("diffScale_speed")) / 100 or 0.025) * (placesVisited - 1)
	--Damage "Resistance" is an exponential % damage-reduction multiplier per places visited.
	local resistMultiplier = math.min(1, math.pow(1 - (tonumber(GetSetting("diffScale_resist")) / 100 or 0.0375), placesVisited - 1))

	--Get the player entity
	local myEntity = GetUpdatedEntityID()
	--Get the player's genome data
	local myGenome = EntityGetFirstComponent(myEntity, "GenomeDataComponent")
	--Initialise the herd variable
	local myHerd = -1

	--Check we have a genome, and if we do then update the herd ID.
	if myGenome ~= nil then
		myHerd = ComponentGetValue2(myGenome, "herd_id")
	end

	--Get all nearby enemies.
	local nearbyEnemies = EntityGetWithTag("enemy")
	--Iterate through the enemy list.
	for i,enemy in pairs(nearbyEnemies) do
		--Check that we haven't already scaled this enemy.
		if EntityGetVariableString(enemy, "nv_diff", "false") == "false" then
			--Tell future iterations on this enemy to skip it.
			EntitySetVariableString(enemy, "nv_diff", "true")
		
			local damageModels = EntityGetComponent(enemy, "DamageModelComponent") or {}
			if #damageModels > 0 then
				--The default resistance multiplier.
				local defResist = 1.00
				--Build a table of all damage types with default resistances, to use when iterating over each damage type for the target enemy.
				local resistances = {
					ice = defResist,
					electricity = defResist,
					radioactive = defResist,
					slice = defResist,
					projectile = defResist,
					physics_hit = defResist,
					explosion = defResist,
					poison = defResist,
					melee = defResist,
					drill = defResist,
					fire = defResist,
				}
				--Iterate over each damage model component.
				for n,model in pairs(damageModels) do
					--For each damage type in our resistances table, we get the target enemy's resistance value for that type and adjust it.
					for damageType,mult in pairs(resistances) do
						local thisResist = ComponentObjectGetValue2(model, "damage_multipliers", damageType)
						local newResist = thisResist * mult * resistMultiplier
						print(tostring(newResist)..": ("..tostring(thisResist).." * "..tostring(resistMultiplier)..")")
						ComponentObjectSetValue2(model, "damage_multipliers", damageType, newResist)
					end
				end
				
				--Adjust the attack speed of enemies by modifying the frames between attacks against the speed multiplier.
				local animalAI = EntityGetComponent(enemy, "AnimalAIComponent") or {}
				if #animalAI > 0 then
					for n,ai in pairs( animalAI ) do
						ComponentAdjustValues( ai, {
							attack_melee_frames_between=function(value) return math.ceil( tonumber( value ) / speedMultiplier ) end,
							attack_dash_frames_between=function(value) return math.ceil( tonumber( value ) / speedMultiplier ) end,
							attack_ranged_frames_between=function(value) return math.ceil( tonumber( value ) / speedMultiplier ) end,
						})
					end
				end
			end

			--Get the platforming component of the target enemy.
			local platforming = EntityGetFirstComponent( nearby, "CharacterPlatformingComponent" )
			--If we have a platforming component, we adjust velocity and flight values with the speed multiplier.
			if platforming ~= nil then
				ComponentAdjustValues( platforming, {
					jump_velocity_x = function(value) return value * speedMultiplier end,
					jump_velocity_y = function(value) return value * speedMultiplier end,
					fly_smooth_y = function(value) return false end,
					fly_speed_mult = function(value) return value * speedMultiplier end,
					fly_speed_max_up = function(value) return value * speedMultiplier end,
					fly_speed_max_down = function(value) return value * speedMultiplier end,
					fly_speed_change_spd = function(value) return value * speedMultiplier end,
					run_velocity = function(value) return value * speedMultiplier end,
					fly_velocity_x = function(value) return value * speedMultiplier end,
					--velocity_max_x = function(value) return value * speedMultiplier end,
				})
			end
		end
	end
end