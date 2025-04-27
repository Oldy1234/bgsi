local ID = game.PlaceId
local baseURL = "https://raw.githubusercontent.com/Oldy1234/script/refs/heads/main/"
local Players = game:GetService("Players")
local plr = Players.LocalPlayer

function GetGame()
    if ID == 139394516128799 then
        return "chessclub.lua"
    elseif ID == 122678592501168 then
        return "beaks.lua"
    elseif ID == 85896571713843 then
        return "bgsi.lua"
    elseif ID == 13272778002 then
        return "miniempires.lua"
    else
        print("Game is not supported.")
        return nil
    end
end

local gameScript = GetGame()

loadstring(game:HttpGet(baseURL .. gameScript))()

for _, v in next, getconnections(plr.Idled) do
    v:Disable()
end

local VirtualUser = game:GetService("VirtualUser")
local status = getgenv().afk_toggle
if status == nil then
    getgenv().afk_toggle = false
end

if not plr then
    error("Failed to get LocalPlayer reference")
end

plr.Idled:Connect(function()
    if not getgenv().afk_toggle then return end
    pcall(function()
        VirtualUser:CaptureController()
        VirtualUser:ClickButton2(Vector2.new())
    end)
end)
