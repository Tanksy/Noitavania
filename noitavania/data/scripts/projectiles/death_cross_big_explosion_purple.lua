dofile_once("data/scripts/lib/utilities.lua")

local entity_id    = GetUpdatedEntityID()
local pos_x, pos_y = EntityGetTransform( entity_id )

local how_many = 4
local angle_inc = math.pi * 0.5
local theta = 0
local length = 200
local length_base = 300

for i=1,how_many do
	for j=1,4 do
		local vel_x = math.cos( theta ) * (length * j + length_base)
		local vel_y = math.sin( theta ) * (length * j + length_base)

		shoot_projectile( entity_id, "mods/noitavania/data/entities/projectiles/death_cross_big_laser_purple.xml", pos_x, pos_y, vel_x, vel_y )
	end
	
	theta = theta + angle_inc
end
