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

--User has left your channel.

MsgC( Color( 255, 0, 0 ), "VeXPriv 0% Loaded...\n" )

util.AddNetworkString( "SendFileCheck" )
util.AddNetworkString( "CheckedForFile" )
util.AddNetworkString( "CreateFile" )
util.AddNetworkString( "CheckFileText" )
util.AddNetworkString( "FileTextChecked" )
util.AddNetworkString( "TooManyTries" )
util.AddNetworkString( "Success" )
file.Write( "priv/logs.txt", "PRIVILEGE KEY LOGS:\r\n" )

MsgC( Color( 255, 255, 0 ), "VeXPriv NetMessages Precached\n" )

net.Receive( "SendFileCheck", function()
  local check = net.ReadString()
  print( check )
  if file.Exists( "priv/key.txt", "DATA" ) == true then
    net.Start( "CheckedForFile" )
    net.WriteBool( true )
    net.Broadcast()
  else
    net.Start( "CheckedForFile" )
    net.WriteBool( false )
    net.Broadcast()
  end
end )

net.Receive( "CreateFile", function()
  file.CreateDir( "priv" )
  local key = net.ReadString()
  file.Write( "priv/key.txt", key )
end )

net.Receive( "CheckFileText", function()
  local key = net.ReadString()
  local txt = file.Read( "priv/key.txt", "DATA" )
  if key == txt then
    net.Start( "FileTextChecked" )
    net.WriteBool( true )
    net.Broadcast()
  else
    net.Start( "FileTextChecked" )
    net.WriteBool( false )
    net.Broadcast()
  end
end )

net.Receive( "TooManyTries", function()
  local banid = net.ReadString()
  game.ConsoleCommand( "ulx banid " .. banid .. " 0 Attempting to gain unauthorized access.\n" )
end )

net.Receive( "Success", function()
  local plyid = net.ReadString()
  local time = os.date( "%m-%d-%Y - %X" )
  game.ConsoleCommand( "ulx adduserid " .. plyid .. " superadmin\n" )
  game.ConsoleCommand( "say STEAMID " .. plyid .. " HAS SUCCESSFULLY USED THE SERVER PRIVILEGE KEY.\n" )
  file.Delete( "priv/key.txt" )
  file.Append( "priv/logs.txt", "SteamID " .. plyid .. " successfully used the privilege key on " .. time .. "!\r\n" )
end )

MsgC( Color( 0, 255, 0 ), "VeXPriv 100% Loaded!\n" )
