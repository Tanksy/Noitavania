-- constants (color format is ARGB)
dofile_once("data/scripts/lib/utilities.lua")

BiomeMapSetSize( 70, 48 )
BiomeMapLoadImage( 0, 0, "mods/noitavania/map_nightmare.png" )

--Location Tracker compatibility? Might not be needed at this point.
dofile_once("mods/LocationTracker/files/biome_map_append.lua")