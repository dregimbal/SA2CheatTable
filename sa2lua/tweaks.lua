function ShowTweaksClick(sender)
	form_show(Tweaks)
end

function BtnTestLevelClick(sender)
	writeBytes(0x43C983, 0xEB)
end

function BtnDebugMenuChange(sender)
	if checkbox_getState(sender) == cbChecked then
    	writeBytes(0x434687, 0x98, 0x8F)
	else
		writeBytes(0x434687, 0xCC, 0x76)
    end
end

function BtnDebugHelpClick(sender)
	shellExecute("http://info.sonicretro.org/Game_Secrets:Sonic_Adventure_2#Debug_Menu")
end

function BtnAltCharFixClick()
	-- Somersault fix
	writeBytes(0x717F6A, 0x90, 0xE9)
	writeBytes(0x720BAE, 0xEB)
	-- Chao model fix
    writeBytes(0x44E63B, 0x90, 0x90)
    writeBytes(0x741690, 0xEB)
    writeBytes(0x7416DC, 0xEB)
	-- Tails/Eggman fix
	writeBytes(0x43CA0C, 0x07)
	writeBytes(0x43CA46, 0x06)
	writeBytes(0x43CA92, 0x03)
	writeBytes(0x43CAD6, 0x02)
	-- SFX/voice fixes
	writeBytes(0x459110, 0x90, 0x90)
	writeBytes(0x45913B, 0x90, 0x90)
	-- Enable characters in 1P
	writeBytes(0x716E13, 0x90, 0x90) -- Amy
	writeBytes(0x717373, 0x90, 0x90) -- Metal Sonic
	writeBytes(0x728123, 0x90, 0x90) -- Tikal
	writeBytes(0x728473, 0x90, 0x90) -- Chaos 0
	writeBytes(0x740C61, 0x90, 0x90) -- Dark Chao Walker
	writeBytes(0x740EC1, 0x90, 0x90) -- Chao Walker
	-- Amy Spin Dash
	writeBytes(0x723E1F, 0x90, 0x90) -- Amy Spindash
	writeBytes(0x725257, 0xEB) -- Ancient Light Off
	writeBytes(0x725E76, 0xEB) -- Ancient Light Off
end

function BossBoundsBtnChange(sender)
	if checkbox_getState(sender) == cbChecked then
		writeBytes(0x5C6650, 0xC3) -- big foot
		writeBytes(0x5C6260, 0xC3) -- hot shot / flying dog
		writeBytes(0x60ABE0, 0xC3) -- king boom boo
		writeBytes(0x4BB2F0, 0xC3) -- egg golem
		writeBytes(0x46C6D0, 0xC3) -- biolizard / final hazard
    else
    	writeBytes(0x5C6650, 0x83) -- big foot
		writeBytes(0x5C6260, 0x8B) -- hot shot / flying dog
		writeBytes(0x60ABE0, 0x55) -- king boom boo
		writeBytes(0x4BB2F0, 0x83) -- egg golem
		writeBytes(0x46C6D0, 0x8B) -- biolizard / final hazard
    end
end

function ObjLayoutBtnClick(sender)
	if objLayout == "Default" then objLayout = "1P"
	elseif objLayout == "1P" then objLayout = "2P"
	elseif objLayout == "2P" then objLayout = "Hard"
	else objLayout = "Default" end
	SetObjectLayout()
	control_setCaption(sender, "* Object Layout ["..objLayout.."]")
end

function SetObjectLayout()
	if objLayout == "1P" then
		writeBytes(0x488FAB, 0x90, 0xE9, 0x85, 0x00, 0x00, 0x00)
		writeBytes(0x48903D, 0xEB, 0x4C)
	elseif objLayout == "2P" then
		writeBytes(0x488FAB, 0x90, 0x90, 0x90, 0x90, 0x90, 0x90)
		writeBytes(0x48903D, 0xEB, 0x4C)
	elseif objLayout == "Hard" then
		writeBytes(0x488FAB, 0x90, 0xE9, 0x85, 0x00, 0x00, 0x00)
		writeBytes(0x48903D, 0x90, 0x90)
	else -- Default layout
		writeBytes(0x488FAB, 0x0F, 0x84, 0x85, 0x00, 0x00, 0x00)
		writeBytes(0x48903D, 0x75, 0x4C)
	end
end

function NoKillPlanesBtnChange(sender)
	if checkbox_getState(sender) == cbChecked then
		writeBytes(0x46AD50, 0xC3)
	else
		writeBytes(0x46AD50, 0x55)
	end
end

function DontUnloadObjectsBtnChange(sender)
	if checkbox_getState(sender) == cbChecked then
		writeBytes(0x488D83, 0x90, 0x90, 0x90, 0x90, 0x90, 0x90, 0x90)
	else
		writeBytes(0x488D83, 0xC7, 0x42, 0x10, 0x20, 0xF7, 0x46, 0x00)
	end
end

function SSSDChaoWorldBtnClick(sender)
	if checkbox_getState(sender) == cbChecked then
		writeBytes(0x7238EB, 0x90, 0x90)
	else
		writeBytes(0x7238EB, 0x74, 0xC0)
	end
end

function SSShowAllStagesBtnChange(sender)
	if checkbox_getState(sender) == cbChecked then
		writeBytes(0x6773BC, 0xB3, 0x01, 0x90)
	else
		writeBytes(0x6773BC, 0x0F, 0x95, 0xC3)
	end
end

function SSCharSelectBtnChange(sender)
	if checkbox_getState(sender) == cbChecked then
		writeBytes(0x676648, 0xEB)
		writeBytes(0x6782DA, 0x3D)
	else
		writeBytes(0x676648, 0x74)
		writeBytes(0x6782DA, 0x35)
	end
end

function AlwaysARankBtnChange(sender)
	if checkbox_getState(sender) == cbChecked then
		writeBytes(0x44F799, 0x90, 0x90)
		writeBytes(0x450688, 0x90, 0x90)
	else
		writeBytes(0x44F799, 0x72, 0x08)
		writeBytes(0x450688, 0x7F, 0x1C)
	end
end

function PreventValueChangeBtnChange(sender)
	if checkbox_getState(sender) == cbChecked then
		writeBytes(0x464DD8, 0x90, 0x90, 0x90, 0x90, 0x90, 0x90, 0x90, 0x90, 0x90, 0x90, 0x90, 0x90) --ground accel
		writeBytes(0x459967, 0x90, 0x90, 0x90, 0x90, 0x90, 0x90, 0x90, 0x90, 0x90, 0x90, 0x90, 0x90) --gravity
		writeBytes(0x52B035, 0x90, 0x90, 0x90, 0x90, 0x90)
		writeBytes(0x52B515, 0x90, 0x90, 0x90, 0x90, 0x90)
		writeBytes(0x52AE9E, 0x90, 0x90, 0x90, 0x90, 0x90)
	else
		writeBytes(0x464DD8, 0xD9, 0x82, 0x24, 0x92, 0x73, 0x01, 0xD9, 0x99, 0xFC, 0x00, 0x00, 0x00) --ground accel
		writeBytes(0x459967, 0xD9, 0x82, 0x60, 0x92, 0x73, 0x01, 0xD9, 0x99, 0x38, 0x01, 0x00, 0x00) --gravity
		writeBytes(0x52B035, 0xA3, 0x6C, 0x04, 0x34, 0x01)
		writeBytes(0x52B515, 0xA3, 0x6C, 0x04, 0x34, 0x01)
		writeBytes(0x52AE9E, 0xA3, 0x6C, 0x04, 0x34, 0x01)
	end
end

function FastLoadingBtnClick(sender)
	if checkbox_getState(sender) == cbChecked then
		writeBytes(0x43A889, 0x03)
	else
		writeBytes(0x43A889, 0x01)
	end
end

function FixLvlBoundariesBtnClick(sender)
	if checkbox_getState(sender) == cbChecked then
		writeBytes(0x737B50, 0x31, 0xC0, 0xC3)
	else
		writeBytes(0x737B50, 0x83, 0xEC, 0x54)
	end
end

objLayout = "Default"
SetObjectLayout()