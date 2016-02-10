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

--admin he doin it sideways

--**********
--USE
--**********
--Hold space after the script has loaded for the player to automatically jump every time he hits the ground.

--**********
--NOTES
--**********
--Place the Lua file in lua/autorun/client to get it working.

hook.Add( "Think", "autohop", function() --Add a hook that thinks every tick.
  if ( input.IsKeyDown( KEY_SPACE ) ) == true then --Is the player holding down the space key?
    if LocalPlayer():IsOnGround() then --If they are, are they on the ground?
      RunConsoleCommand( "+jump" ) --If they are, make them jump.
    else --Otherwise...
      RunConsoleCommand( "-jump" ) --Do -jump so that they can jump when they hit the ground.
    end --End the if statement.
  end --End the if statement.
end  ) --End the hook.

MsgC( Color( 0, 255, 0 ), "VeXan's AutoHop loaded!\n" ) --Send the client a message that the script has loaded.
