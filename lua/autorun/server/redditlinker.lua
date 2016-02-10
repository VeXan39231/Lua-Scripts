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

--9gag is better than reddit

--**********
--USE
--**********
--Type '/r/' in chat, followed by a subreddit, and it will automatically change it to a link.
--EX: '/r/globaloffensive' would automatically be set to a link that would open the subreddit.

--**********
--NOTES
--**********
--This is made to work for AtlasChat. If you want support for other chatboxes, add me and tell me.
--Place the Lua file in lua/autorun/server to get it working.

hook.Add( "PlayerSay", "redditlink", function( sender, str, team ) --Add the hook that is called every time a player says something.
  if ( string.sub( str, 1, 3 ) == "/r/" ) then --Are the first 3 letters of the message '/r/'?
    return "<url>http://www.reddit.com" .. str .. "</url>" --If they are, change the entire message to a link that goes to the subreddit.
  end --End the if statement.
end ) --End the hook.

MsgC( Color( 0, 255, 0 ), "VeXan's RedditLinker loaded!\n" ) --Send the server a message that the script has loaded.
