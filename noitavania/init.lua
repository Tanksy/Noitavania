dofile("mods/noitavania/util/utilities.lua")

function OnModInit()
	--Overwrite _pixel_scenes.xml to fix missing scenes in the Nightmare map.
	ModTextFileSetContent("data/biome/_pixel_scenes.xml", ModTextFileGetContent("mods/noitavania/data/biome/_pixel_scenes.xml"))

	--Add new materials for custom biomes.
	ModMaterialsFileAdd("mods/noitavania/data/new_materials.xml")

	--Import the LuaNXML lib by Zatherz.
	local nxml = dofile_once("mods/noitavania/util/nxml.lua")
	--Get the content of the current _biomes_all.xml file.
	local biomes = ModTextFileGetContent("data/biome/_biomes_all.xml")
	--Parse the content using NXML.
	local xml = nxml.parse(biomes)

	--Add the custom biomes to the list.
	--Sewers by Perh.
	qP("Adding Sewer biome")
	xml:add_child(nxml.parse([[<Biome
		biome_filename="mods/noitavania/data/biome/sewer.xml"
		height_index="1"
		color="ffd57125" >
	</Biome>]]))
	--Landing by Perh.
	qP("Adding Landing biome")
	xml:add_child(nxml.parse([[<Biome
		biome_filename="mods/noitavania/data/biome/landing.xml"
		height_index="7"
		color="ff004611" >
	</Biome>]]))
	--Thrones by Perh.
	qP("Adding Throneroom biome")
	xml:add_child(nxml.parse([[<Biome
		biome_filename="mods/noitavania/data/biome/thrones.xml"
		height_index="7"
		color="ff004777" >
	</Biome>]]))
	--Volcano by Horscht.
	qP("Adding Volcano biome")
	xml:add_child(nxml.parse([[<Biome
		biome_filename="mods/noitavania/data/biome/nv_volcano/entrance.xml"
		height_index="0"
		color="ff632b4b" >
	</Biome>]]))
	xml:add_child(nxml.parse([[<Biome
		biome_filename="mods/noitavania/data/biome/nv_volcano/entrance_chasm.xml"
		height_index="0"
		color="ff6d3656" >
	</Biome>]]))
	xml:add_child(nxml.parse([[<Biome
		biome_filename="mods/noitavania/data/biome/nv_volcano/inside.xml"
		height_index="0"
		color="ff78375c" >
	</Biome>]]))
	xml:add_child(nxml.parse([[<Biome
		biome_filename="mods/noitavania/data/biome/nv_volcano/bottom.xml"
		height_index="0"
		color="ff712f55" >
	</Biome>]]))
	xml:add_child(nxml.parse([[<Biome
		biome_filename="mods/noitavania/data/biome/nv_volcano/exit.xml"
		height_index="0"
		color="ff873665" >
	</Biome>]]))
	--Space by Hornedkey/Archaeopteryx.
	qP("Adding Space biome")
	xml:add_child(nxml.parse([[<Biome
		biome_filename="mods/noitavania/data/biome/nv_space/entrance.xml"
		height_index="14"
		color="ff12D1C7" >
	</Biome>]]))
	xml:add_child(nxml.parse([[<Biome
		biome_filename="mods/noitavania/data/biome/nv_space/space.xml"
		height_index="14"
		color="ffD17612" >
	</Biome>]]))
	--Toxic Dump by Tanksy & Perh.
	qP("Adding Radioactive biome")
	xml:add_child(nxml.parse([[<Biome
		biome_filename="mods/noitavania/data/biome/nv_radioactive.xml"
		height_index="12"
		color="ff00F344" >
	</Biome>]]))
	--Gas Cave by Nolla & edited by Hornedkey/Archaeopteryx.
	qP("Adding Gas cave biome")
	xml:add_child(nxml.parse([[<Biome
		biome_filename="mods/noitavania/data/biome/nv_gascave/left.xml"
		height_index="10"
		color="ff752ACF" >
	</Biome>]]))
	xml:add_child(nxml.parse([[<Biome
		biome_filename="mods/noitavania/data/biome/nv_gascave/middle.xml"
		height_index="10"
		color="ff681EC1" >
	</Biome>]]))
	xml:add_child(nxml.parse([[<Biome
		biome_filename="mods/noitavania/data/biome/nv_gascave/right.xml"
		height_index="10"
		color="ff550DAD" >
	</Biome>]]))
	--Cursed Path by Tanksy.
	qP("Adding Cursed biome")
	xml:add_child(nxml.parse([[<Biome
		biome_filename="mods/noitavania/data/biome/nv_cursed.xml"
		height_index="10"
		color="ff751515" >
	</Biome>]]))
	--Castle by Tanksy.
	qP("Adding Castle biome")
	xml:add_child(nxml.parse([[<Biome
		biome_filename="mods/noitavania/data/biome/nv_castle/main.xml"
		height_index="10"
		color="ff9f1254" >
	</Biome>]]))
	xml:add_child(nxml.parse([[<Biome
		biome_filename="mods/noitavania/data/biome/nv_castle/boss_room.xml"
		height_index="10"
		color="ffa01356" >
	</Biome>]]))
	xml:add_child(nxml.parse([[<Biome
		biome_filename="mods/noitavania/data/biome/nv_castle/boss_entry.xml"
		height_index="10"
		color="ffa01357" >
	</Biome>]]))
	xml:add_child(nxml.parse([[<Biome
		biome_filename="mods/noitavania/data/biome/nv_castle/maze.xml"
		height_index="10"
		color="ff831046" >
	</Biome>]]))
	--Hive by Tanksy.
	qP("Adding Hive biome")
	xml:add_child(nxml.parse([[<Biome
		biome_filename="mods/noitavania/data/biome/nv_hive.xml"
		height_index="10"
		color="ffedd190" >
	</Biome>]]))
	--Secret Shop by Nolla & edited by Tanksy.
	qP("Adding Secret Shop biome")
	xml:add_child(nxml.parse([[<Biome
		biome_filename="mods/noitavania/data/biome/nv_secretshop/left.xml"
		height_index="10"
		color="ff775ddc" >
	</Biome>]]))
	xml:add_child(nxml.parse([[<Biome
		biome_filename="mods/noitavania/data/biome/nv_secretshop/right.xml"
		height_index="10"
		color="ff775ddd" >
	</Biome>]]))
	--Side temple by Nolla & Tanksy.
	qP("Adding Mini-Temple biome")
	xml:add_child(nxml.parse([[<Biome
		biome_filename="mods/noitavania/data/biome/nv_side_temple.xml"
		height_index="1"
		color="ff92ca5b" >
	</Biome>]]))
	--Heart Altars by Nolla & Tanksy.
	qP("Adding Heart Altar biomes")
	xml:add_child(nxml.parse([[<Biome
		biome_filename="mods/noitavania/data/biome/nv_hearts/altar_left.xml"
		height_index="13"
		color="ffC02021" >
	</Biome>]]))
	xml:add_child(nxml.parse([[<Biome
		biome_filename="mods/noitavania/data/biome/nv_hearts/altar_right.xml"
		height_index="13"
		color="ffC02022" >
	</Biome>]]))
	--Cave Entrances by Nolla & edited by Tanksy.
	qP("Adding Cave Entrance biome")
	xml:add_child(nxml.parse([[<Biome
		biome_filename="mods/noitavania/data/biome/nv_caves/left_corner_down.xml"
		height_index="10"
		color="ff0AA096" >
	</Biome>]]))
	xml:add_child(nxml.parse([[<Biome
		biome_filename="mods/noitavania/data/biome/nv_caves/right_corner_down.xml"
		height_index="10"
		color="ff0AA097" >
	</Biome>]]))
	xml:add_child(nxml.parse([[<Biome
		biome_filename="mods/noitavania/data/biome/nv_caves/left_corner_up.xml"
		height_index="10"
		color="ff0AA098" >
	</Biome>]]))
	xml:add_child(nxml.parse([[<Biome
		biome_filename="mods/noitavania/data/biome/nv_caves/right_corner_up.xml"
		height_index="10"
		color="ff0AA099" >
	</Biome>]]))
	--Tunnels by Tanksy.
	xml:add_child(nxml.parse([[<Biome
		biome_filename="mods/noitavania/data/biome/nv_tunnels/horizontal.xml"
		height_index="10"
		color="ff0FA099" >
	</Biome>]]))
	--Outpost by Congress.
	qP("Adding Outpost biome")
	xml:add_child(nxml.parse([[<Biome
		biome_filename="mods/noitavania/data/biome/outpost.xml"
		height_index="0"
		color="ff9E442D" >
	</Biome>]]))
	--Forgotten Tunnels by Congress.
	qP("Adding Forgotten Tunnels biome")
	xml:add_child(nxml.parse([[<Biome
		biome_filename="mods/noitavania/data/biome/forgotten_tunnels.xml"
		height_index="0"
		color="ff68AFA5" >
	</Biome>]]))
	xml:add_child(nxml.parse([[<Biome
		biome_filename="mods/noitavania/data/biome/forgotten_tunnels_dark.xml"
		height_index="0"
		color="ff6891A5" >
	</Biome>]]))
	--Cave Lake by Congress.
	qP("Adding Cave Lake biome")
	xml:add_child(nxml.parse([[<Biome
		biome_filename="mods/noitavania/data/biome/cavelake.xml"
		height_index="0"
		color="ff001BA5" >
	</Biome>]]))
	--Overwrite the file contents with the updated list.
	qP("Overwriting with new biomes list")
	ModTextFileSetContent("data/biome/_biomes_all.xml", tostring(xml))

	qP("Checking for Nightmare")
	if ModIsEnabled("nightmare") then
		qP("Nightmare is enabled. Appending our loader to nightmare's biome_map.lua")
		ModLuaFileAppend("mods/nightmare/files/biome_map.lua", "mods/noitavania/data/scripts/nightmare_loader.lua")
	else
		--Set new magic numbers to load the biome_map_loader.lua
		qP("Magic Numbers has been set to load Noitavania")
		ModMagicNumbersFileAdd("mods/noitavania/data/new_magic_numbers.xml")
	end

	qP("Checking for LocationTracker")
	if ModIsEnabled("LocationTracker") then
		local location_tracker = dofile_once("mods/LocationTracker/files/intermod_compat.lua")
		location_tracker.add_colors({
		0xd57125, 0x004611, 0x004777, 0x632b4b, 0x6d3656, 0x78375c, 0x712f55, 0x873665, 0x12d1c7, 0xd17612, 0x00f344, 0x752acf, 0x681ec1, 0x550dad, 0x751515, 0x9f1254, 0xa01356, 0xa01357, 0x831046, 0xedd190, 0x775ddc, 0x775ddd, 0x92ca5b, 0x0aa096, 0x0aa097, 0x0aa098, 0x0aa099, 0x9e442d, 0x68afa5, 0x6891a5, 0x001ba5
		}, "mods/noitavania/data/LocationTracker_spritesheet.xml")
	end
end

function appendTranslations( filepath, translation_file )
    if translation_file == nil then
        translation_file = "data/translations/common.csv";
    end
    local translations = ModTextFileGetContent( translation_file );
    if translations ~= nil then
        while translations:find("\r\n\r\n") do
            translations = translations:gsub("\r\n\r\n","\r\n");
        end
        local new_translations = ModTextFileGetContent( filepath );
        translations = translations .. new_translations;
        ModTextFileSetContent( translation_file, translations );
    end
end

appendTranslations( "mods/noitavania/data/translations/new.csv" )

function OnPlayerSpawned(aPlayerEntity)
	if GetSetting("diffScale_switch") == "true" then
		qP("Adding difficulty scaling script component")
		EntityAddComponent( aPlayerEntity, "LuaComponent", {
			_tags="_nv",
			script_source_file="mods/noitavania/data/scripts/difficulty_scaling.lua",
			execute_every_n_frame="60",
		});
	end
end