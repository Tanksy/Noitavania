dofile("mods/noitavania/util/utilities.lua")

local w = 70
local h = 48

--qP("Setting Biome Map Size")
BiomeMapSetSize(w, h)
--qP("Setting Biome Map to Noitavania")

if GetSetting("forceNightmare") then
	BiomeMapLoadImage(0, 0, "mods/noitavania/map_nightmare.png")
else
	BiomeMapLoadImage(0, 0, "mods/noitavania/map.png")
end