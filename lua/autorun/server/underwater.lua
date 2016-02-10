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

--sooper dooper underwater funkshinz


MsgC( Color( 255, 255, 255 ), "VeXan's Underwater Sensor: ", Color( 255, 0, 0 ), "0% Loaded\n" ) --0% loaded message.

function playerWaterLevel() --Start the function to see if the player is submerged.
  for k, v in pairs( player.GetAll() ) do --For loop to watch all players.
    if v:WaterLevel() == 1 then --If the player's feet are underwater then...
      MsgC( Color( 255, 255, 255 ), "Player ", Color( 0, 255, 255 ), v:Nick(), Color( 255, 255, 255 ), "'s feet are underwater!\n" ) --Send the server a message stating that the player's feet are underwater.
    elseif v:WaterLevel() == 2 then --If the player is mostly underwater then...
      MsgC( Color( 255, 255, 255 ), "Player ", Color( 0, 255, 255 ), v:Nick(), Color( 255, 255, 255 ), " is mostly underwater!\n" ) --Send the server a message stating that the player is mostly underwater.
    elseif v:WaterLevel() == 3 then --If the player is submerged then...
      MsgC( Color( 255, 255, 255 ), "Player ", Color( 0, 255, 255 ), v:Nick(), Color( 255, 255, 255 ),  " is fully submerged!\n" ) --Send the server a message stating that the playeris fully submerged.
    end --End the if statement.
  end --End the for loop.
end --End the function.

MsgC( Color( 255, 255, 255 ), "VeXan's Underwater Sensor: ", Color( 255, 160, 0 ), "50% Loaded\n" ) --50% loaded message.

timer.Create( "UnderwaterTimer", 1, 0, playerWaterLevel ) --Check every second to see if the player is underwater.

MsgC( Color( 255, 255, 255 ), "VeXan's Underwater Sensor: ", Color( 0, 255, 0 ), "100% Loaded!\n" ) --100% loaded message.
