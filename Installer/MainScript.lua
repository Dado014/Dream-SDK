local Installer = {}

local HttpService = game:GetService("HttpService")
local ServerScriptService = game:GetService("ServerScriptService")

local function getContentFromGitHub(username, repository, path)
    local apiUrl = ("http://raw.githubusercontent.com/%s/%s/master/%s"):format(username, repository, path)
    local content = HttpService:GetAsync(apiUrl)
    return content
end

function Installer.Install()
    if HttpService.HttpEnabled then
        local found = ServerScriptService:FindFirstChild("Dream-SDK")
        if  found then
            print("SDK Folder already installed. Updating to the latest version")
            found:Destroy()
        end
        
        local Folder = Instance.new("Folder")
        local MainScript = Instance.new("ModuleScript")
        Folder.Parent = ServerScriptService
        
        Folder.Name = "Dream-SDK"
        
        MainScript.Parent = Folder
        MainScript.Source = getContentFromGitHub("dado014", "dream-sdk", "src/Mainscript.lua" )
        
        if MainScript.Source == nil then
            warn("Installation not successful: Failed to fetch content from GitHub")
        else
            print("Installation successful!")
        end
    else
        warn("Installing not succesful: HTTP services not enabled.")
    end
end

return Installer
