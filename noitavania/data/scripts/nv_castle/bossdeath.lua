dofile_once("data/scripts/lib/utilities.lua")

function death( damage_type_bit_field, damage_message, entity_thats_responsible, drop_items )
	local x, y = EntityGetTransform( GetUpdatedEntityID() )
	
	SetRandomSeed( x, y * GameGetFrameNum() )
	local opts = { "DUPLICATE", "DAMAGE_RANDOM", "RANDOM_SPELL", "RANDOM_PROJECTILE", "RANDOM_MODIFIER", "RANDOM_STATIC_PROJECTILE", "DRAW_RANDOM", "DRAW_RANDOM_X3", "DRAW_3_RANDOM", "ALPHA", "OMEGA", "ADD_TRIGGER", "ADD_TIMER", "ADD_DEATH_TRIGGER", "GAMMA" }
	local rnd = Random( 1, #opts )
	
	CreateItemActionEntity( opts[rnd], x, y )
	
	EntityLoad( "data/entities/projectiles/deck/black_hole_big.xml",  x, y )
	EntityLoad( "data/entities/projectiles/deck/crumbling_earth.xml",  x, y )
	EntityLoad( "mods/noitavania/data/entities/items/nv_skullwand.xml",  x, y )
end