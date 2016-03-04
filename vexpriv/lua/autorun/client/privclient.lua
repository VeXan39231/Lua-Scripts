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

--User has joined your channel.

--util.AddNetworkString( "CheckedForFile" )

concommand.Add( "privmenu", function()

  local frame = vgui.Create( "DFrame" )
  frame:Center()
  frame:SetSize( 300, 200 )
  frame:SetTitle( "Privilege Key Creation/Redemption" )
  frame:ShowCloseButton( true )
  frame:MakePopup()

  local text = vgui.Create( "DLabel" )
  text:SetParent( frame )
  text:SetPos( 5, 30 )
  text:SetText( "This menu is used to create or redeem a privilege key for\nyour server. To create a key, enter a code in to the text\nbox, and click the create button. Your key may not have\nspaces! To redeem your code type it in the text box and\npress the redeem button. If you get the wrong code 3 times\nyou will be banned!" )
  text:SizeToContents()

  local entry = vgui.Create( "DTextEntry" )
  entry:SetParent( frame )
  entry:SetSize( 200, 20 )
  entry:SetPos( 50, 125 )

  local create = vgui.Create( "DButton" )
  create:SetParent( frame )
  create:SetSize( 200, 15 )
  create:SetPos( 50, 150 )
  create:SetDisabled( true )
  create:SetText( "Create and Lock Privilege Key" )
  function create:OnCursorEntered()
    surface.PlaySound( "buttons/lightswitch2.wav" )
  end
  create.DoClick = function()
    local key = entry:GetValue()
    local ply = LocalPlayer()

    if key == "" then
      chat.AddText( Color( 255, 50, 50 ), "You must type something in the text box!" )
      surface.PlaySound( "buttons/button16.wav" )
    elseif string.find( string.lower( key ), " " ) then
      chat.AddText( Color( 255, 50, 50 ), "Your privilege key may not have spaces!" )
      surface.PlaySound( "buttons/button16.wav" )
    elseif string.len( string.lower( key ) ) > 64 then
      chat.AddText( Color( 255, 50, 50 ), "Your privilege key may not have more than 64 characters!" )
      surface.PlaySound( "buttons/button16.wav" )
    elseif create:GetDisabled() == true then
      surface.PlaySound( "buttons/button8.wav" )
    else
      net.Start( "CreateFile" )
      net.WriteString( key )
      net.SendToServer()
      create:SetDisabled( true )
      chat.AddText( Color( 50, 255, 50 ), "Your privilege key has been created and locked!" )
      surface.PlaySound( "buttons/button24.wav" )
      frame:Close()
    end
  end

  net.Start( "SendFileCheck" )
  net.WriteString( "Checking for priv.txt..." )
  net.SendToServer()

  local redeem = vgui.Create( "DButton" )
  redeem:SetParent( frame )
  redeem:SetSize( 200, 15 )
  redeem:SetPos( 50, 170 )
  redeem:SetText( "Redeem Privilege Key" )
  function redeem:OnCursorEntered()
    surface.PlaySound( "buttons/lightswitch2.wav" )
  end
  local tries = 0
  redeem.DoClick = function()

    local key = entry:GetValue()
    net.Start( "CheckFileText" )
    net.WriteString( key )
    net.SendToServer()

    net.Receive( "FileTextChecked", function()
      local ans = net.ReadBool()
      if ans == true then
        local ply = LocalPlayer()
        local plyid = ply:SteamID()
        chat.AddText( Color( 50, 255, 50 ), "Privilege key redemption successful! Setting player rank..." )
        surface.PlaySound( "buttons/button24.wav" )
        frame:Close()
        net.Start( "Success" )
        net.WriteString( plyid )
        net.SendToServer()
      else
        tries = ( tries + 1 )
        if tries > 3 then
          net.Start( "TooManyTries" )
          local ply = LocalPlayer()
          local banid = ply:SteamID()
          net.WriteString( banid )
          net.SendToServer()
        end
        chat.AddText( Color( 255, 50, 50 ), "Incorrect privilege key! Attempt " .. tries .."/3" )
        surface.PlaySound( "buttons/button16.wav" )
      end

    end )
  end

  net.Receive( "CheckedForFile", function()
    local val = net.ReadBool()
    create:SetDisabled( val )
    redeem:SetEnabled( val )
  end )

end )
