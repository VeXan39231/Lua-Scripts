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
http://www.steamcommunity.com/id/SmellyWetSock
]]--




local boxFrame = vgui.Create( "DFrame" )
boxFrame:Center()
--boxFrame:SetPos( ScrW() / 2, ScrH() / 2 )
boxFrame:SetSize( 250, 150 )
boxFrame:SetTitle( "Some shitty Derma I made" )
boxFrame:SetDraggable( true )
boxFrame:ShowCloseButton( true )
--boxFrame:MakePopup()

local boxButton = vgui.Create( "DButton", boxFrame )
boxButton:SetParent( boxFrame )
boxButton:Center()
--boxButton:SetPos( boxFrame:GetWide() / 2 - 15, boxFrame:GetTall() / 2 + 25 )
boxButton:SetText( "Close" )
boxButton:SetPos( boxButton:GetPos(), boxButton:GetPos() + 30 )
boxButton:SetSize( 50, 25 )
boxButton.DoClick = function()
  surface.PlaySound( "buttons/button16.wav" )
  boxFrame:Close() end

local boxCharSelect = vgui.Create( "DComboBox" )
boxCharSelect:SetParent( boxFrame )
boxCharSelect:Center()
boxCharSelect:SetPos( boxCharSelect:GetPos() - 80, boxCharSelect:GetPos() - 60 )
boxCharSelect:SetSize( 125, 25 )
boxCharSelect:SetValue( "Somebody" )
for k, v in pairs( player.GetAll() ) do
  boxCharSelect:AddChoice( v:Nick() )
end

local boxLabel = vgui.Create( "DLabel" )
boxLabel:SetParent( boxFrame )
boxLabel:Center()
boxLabel:SetPos( boxLabel:GetPos() + 50, boxLabel:GetPos() - 60 )
boxLabel:SetText( "wants to" )

local boxText = vgui.Create( "DTextEntry" )
boxText:SetParent( boxFrame )
boxText:Center()
boxText:SetSize( 50, 25 )
boxText:SetPos( boxText:GetPos() + 100 , boxText:GetPos() - 60 )

local boxCharSelect2 = vgui.Create( "DComboBox" )
boxCharSelect2:SetParent( boxFrame )
boxCharSelect2:Center()
boxCharSelect2:SetPos( boxCharSelect2:GetPos() - 80, boxCharSelect2:GetPos() - 30 )
boxCharSelect2:SetSize( 125, 25 )
boxCharSelect2:SetValue( "Somebody Else" )
for k, v in pairs( player.GetAll() ) do
  boxCharSelect2:AddChoice( v:Nick() )
end

local x = boxCharSelect:GetValue()
local y = boxText:GetValue()
local z = boxCharSelect2:GetValue()

local boxButton2 = vgui.Create( "DButton", boxFrame )
boxButton2:SetParent( boxFrame )
boxButton2:Center()
boxButton2:SetText( "Submit" )
boxButton2:SetPos( boxButton:GetPos() + 50 , boxButton:GetPos() - 30 )
boxButton2:SetSize( 100, 25 )
boxButton2.DoClick = function()
  surface.PlaySound( "buttons/button15.wav" )
  chat.AddText( Color( 220, 110, 110 ), ""..LocalPlayer():Nick().." wants "..x.." to "..y.." "..z.."!" )
end

concommand.Add( "Gossip", function( ply )
  boxFrame:MakePopup()
end )


--[[
local boxButton = vgui.Create( "DButton", boxFrame )
boxButton:SetParent( boxFrame )
boxButton:SetPos( boxFrame:GetWide() / 2 - 15, boxFrame:GetTall() / 2 + 25 )
boxButton:SetText( "Close" )
boxButton:SetSize( 50, 25 )
boxButton.DoClick = function() boxFrame:Close() end

local boxLabel = vgui.Create( "DTextEntry", boxFrame )
boxLabel:SetParent( boxFrame )
boxLabel:SetSize( 100, 25 )
--boxLabel:Center()
boxLabel:SetPos( boxFrame:GetWide() / 2 - 15, boxFrame:GetTall() / 2 - 25  )
boxLabel:SetText( "Type Something..." )

local boxButton2 = vgui.Create( "DButton", boxFrame )
boxButton2:SetParent( boxFrame )
boxButton2:SetPos( boxFrame:GetWide() / 2 - 15, boxFrame:GetTall() / 2 )
boxButton2:SetText( "Print Text" )
boxButton2:SetSize( 50, 25 )
boxButton2.DoClick = function() print( "The box of wisdom says "..boxLabel:GetValue().."" ) end
]]--
