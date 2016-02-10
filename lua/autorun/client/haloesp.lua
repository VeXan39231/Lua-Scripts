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

--reported faggot



concommand.Add( "espsettings", function()
  local settings = vgui.Create( "DFrame" )
  settings:Center()
  settings:SetSize( 300, 285 )
  settings:SetTitle( "HaloESP Settings" )
  settings:ShowCloseButton( true )
  settings:SetDraggable( true )
  settings:MakePopup()

  local enabled = vgui.Create( "DCheckBox" )
  enabled:SetPos( 10, 29 )
  enabled:SetValue( 0 )
  enabled:SetToolTip( "Is HaloESP enabled?" )
  enabled:SetParent( settings )

  local label = vgui.Create( "DLabel" )
  label:SetPos( 28, 29 )
  label:SetText( "Toggle HaloESP" )
  label:SizeToContents()
  label:SetParent( settings )

  local color = vgui.Create( "DColorMixer" )
  color:Dock( BOTTOM )
  color:SetPalette( false )
  color:SetAlphaBar( false )
  color:SetColor( Color( 255, 255, 255 ) )
  color:SetParent( settings )
  local realcolor = color:GetColor()

  --function haloESP()
  --  halo.Add( player.GetAll(), realcolor, 1, 1, 22, true, true )
  --end

  if enabled == true then
    hook.Add( "PreDrawHalos", "megaesp", function()
      halo.Add( player.GetAll(), realcolor, 1, 1, 22, true, true )
    end )
  end

end )

MsgC( Color( 0, 255, 0 ), "Vexan's HaloESP loaded!\n" )
