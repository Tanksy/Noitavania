--Attempts to get a ModSetting, providing the function exists.
function GetSetting( aSetting )
	if ModSettingGet and ModSettingGet("noitavania."..tostring(aSetting)) ~= nil then
		return ModSettingGet("noitavania."..tostring(aSetting))
	end
end

--Quick Print function.
function qP(aString)
	if GetSetting("dbg") == "true" then
		return print(GetSetting("logPrefix").." - "..tostring(aString))
	end
end