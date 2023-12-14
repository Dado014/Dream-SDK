local Installer = {}

local HttpService = game:GetService("HttpService")
local url = "https://api.github.com/repos/Dado014/Dream-SDK/contents/{path}}"

function Install()
    if HttpService.HttpEnabled then
        local response = game:GetService("HttpService"):GetAsync(url, Enum.HttpRequestType.Default, {}, false)
        local data = game:GetService("HttpService"):JSONDecode(response)
        
        local Folder = Instance.new("Folder")
        local MainScript = Instance.new("ModuleScript")
        Folder.Parent = game:GetService("ServerScriptService")
        
        MainScript.Parent = Folder
        MainScript.Source = data.content
        
    else
        warn("Installing not succesful: HTTP services are not enabled.")
    end
end

return Installer
