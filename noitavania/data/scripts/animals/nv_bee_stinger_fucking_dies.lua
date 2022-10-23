dofile_once("data/scripts/lib/utilities.lua")

function collision_trigger()
	local entity_id    = GetUpdatedEntityID()
	--local pos_x, pos_y = EntityGetTransform( entity_id )

	local player_entity = EntityGetWithTag("player_unit")[1]
	
	LoadGameEffectEntityTo(player_entity, "data/entities/misc/effect_poison.xml")
	EntityAddComponent2(entity_id, "VariableStorageComponent", {_tags = "no_gold_drop",})
	EntityInflictDamage(entity_id, 100, "DAMAGE_BITE", "If a bee stings you it dies kekw lole kappa", "NORMAL", 0, 0)
end