--[[
.----------------.  .----------------.  .----------------.  .----------------.  .-----------------.
| .--------------. || .--------------. || .--------------. || .--------------. || .--------------. |
| | ____   ____  | || |  _________   | || |  ____  ____  | || |      __      | || | ____  _____  | |
| ||_  _| |_  _| | || | |_   ___  |  | || | |_  _||_  _| | || |     /  \     | || ||_   \|_   _| | |
| |  \ \   / /   | || |   | |_  \_|  | || |   \ \  / /   | || |    / /\ \    | || |  |   \ | |   | |
| |   \ \ / /    | || |   |  _|  _   | || |    > `' <    | || |   / ____ \   | || |  | |\ \| |   | |
| |    \ ' /     | || |  _| |___/ |  | || |  _/ /'`\ \_  | || | _/ /    \ \_ | || | _| |_\   |_  | |
| |     \_/      | || | |_________|  | || | |____||____| | || ||____|  |____|| || ||_____|\____| | |
| |              | || |              | || |              | || |              | || |              | |
| '--------------' || '--------------' || '--------------' || '--------------' || '--------------' |
'----------------'  '----------------'  '----------------'  '----------------'  '----------------'
http://www.steamcommunity.com/id/vexan
]]--

CreateClientConVar( "vx_autohop", 0, true, false, "Enables/Disables the HS Autohop." )

local bhop = GetConVar( "vx_autohop" )
local ply = LocalPlayer()
ply:SetNWBool( "BHOP_EN", false)

if ( bhop ) then
	ply:SetNWBool( "BHOP_EN", true )
else
	ply:SetNWBool( "BHOP_EN", false )
end

hook.Add( "CreateMove", "vx_authop", function(ucmd)
	if !bhop:GetBool() then return end

	if ucmd:KeyDown( IN_JUMP ) and IsValid( LocalPlayer() ) and LocalPlayer():GetMoveType() != MOVETYPE_NOCLIP and LocalPlayer():Alive() and ply:WaterLevel() == 0 then
		local buttons = ucmd:GetButtons()
		if !LocalPlayer():IsOnGround() then
			buttons = bit.band( buttons, bit.bnot( IN_JUMP ) )
		end
		ucmd:SetButtons( buttons )
	end
end )