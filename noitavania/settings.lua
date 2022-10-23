dofile("data/scripts/lib/mod_settings.lua")

function mod_setting_change_callback( mod_id, gui, in_main_menu, setting, old_value, new_value  )
	if (tonumber(new_value) > 100.0) then
		ModSettingSetNextValue( mod_setting_get_id(mod_id,setting), "100", false )
		ModSettingSet(mod_setting_get_id(mod_id,setting), "100")
	elseif (tonumber(new_value) < 0.0) then
		ModSettingSetNextValue( mod_setting_get_id(mod_id,setting), "0", false )
		ModSettingSet(mod_setting_get_id(mod_id,setting), "0")
	end
end


local mod_id = "noitavania" -- This should match the name of your mod's folder.
mod_settings_version = 1 -- This is a magic global that can be used to migrate settings to new mod versions. call mod_settings_get_version() before mod_settings_update() to get the old value. 
mod_settings = 
{
	{
		id = "dbg",
		ui_name = "Debug Logging",
		ui_description = "Toggle debug logs to the dev exe console.",
		value_default = true,
		scope = MOD_SETTING_SCOPE_RUNTIME,
	},
	{
		id = "logPrefix",
		ui_name = "Log Prefix",
		ui_description = "The prefix for mod-specific console logs.",
		value_default = "NV",
		text_max_length = 5,
		allowed_characters = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789",
		scope = MOD_SETTING_SCOPE_NEW_GAME,
	},
	{
		id = "forceNightmare",
		ui_name = "Force Nightmare/NG+ Map",
		ui_description = "*Requires a New Game*\nWith this enabled; Starting a new game will use the Nightmare/NG+ map,\nwithout requiring a Nightmare start.",
		value_default = false,
		scope = MOD_SETTING_SCOPE_NEW_GAME,
	},
	{
		id = "diffScale_switch",
		ui_name = "Difficulty Scaling",
		ui_description = "*Requires a New Game*\nWith this enabled; Enemies scale in difficulty\nas the player encounters new biomes.",
		value_default = true,
		scope = MOD_SETTING_SCOPE_NEW_GAME,
	},
	{
		id = "diffScale_speed",
		ui_name = "Speed Increase per Biome",
		ui_description = "If Difficulty Scaling is enabled,\nthis value controls the percentage increase in enemy speed.",
		value_default = "2.5",
		scope = MOD_SETTING_SCOPE_NEW_GAME,
		text_max_length = 5,
		allowed_characters = "0123456789.",
		change_fn = mod_setting_change_callback,
	},
	{
		id = "diffScale_resist",
		ui_name = "Resistance Increase per Biome",
		ui_description = "If Difficulty Scaling is enabled,\nthis value controls the percentage increase in enemy damage resistance.",
		value_default = "3.75",
		scope = MOD_SETTING_SCOPE_NEW_GAME,
		text_max_length = 5,
		allowed_characters = "0123456789.",
		change_fn = mod_setting_change_callback,
	}
}

-- This function is called to ensure the correct setting values are visible to the game. your mod's settings don't work if you don't have a function like this defined in settings.lua.
function ModSettingsUpdate( init_scope )
	local old_version = mod_settings_get_version( mod_id ) -- This can be used to migrate some settings between mod versions.
	mod_settings_update( mod_id, mod_settings, init_scope )
end

-- This function should return the number of visible setting UI elements. 
-- Your mod's settings wont be visible in the mod settings menu if this function isn't defined correctly.
-- If your mod changes the displayed settings dynamically, you might need to implement custom logic for this function.
function ModSettingsGuiCount()
	return mod_settings_gui_count( mod_id, mod_settings )
end

-- This function is called to display the settings UI for this mod. your mod's settings wont be visible in the mod settings menu if this function isn't defined correctly.
function ModSettingsGui( gui, in_main_menu )
	mod_settings_gui( mod_id, mod_settings, gui, in_main_menu )
end
