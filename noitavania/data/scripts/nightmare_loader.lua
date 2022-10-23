--dofile("mods/noitavania/util/utilities.lua")

local nv_w = 70
local nv_h = 48

--qP("Setting Biome Map Size")
BiomeMapSetSize(nv_w, nv_h)
--qP("Setting Biome Map to Nightmarevania")

BiomeMapLoadImage(0, 0, "mods/noitavania/map_nightmare.png")