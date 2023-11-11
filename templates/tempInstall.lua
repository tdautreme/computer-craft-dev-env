local args = { ... }

if #args < 1 then
  print("Usage: install <envFolderPath>")
  return
end


local envFolderPath = args[1]
print("Installing "..envFolderPath)

-- remove fodler envFolderPath if it exists
-- env_path = shell.dir().."/"..envFolderPath
if fs.exists(envFolderPath) then
    print("Removing "..envFolderPath)
    fs.delete(envFolderPath)
end

{% for file in files %}
local filePath = envFolderPath .."/{{ file }}"
local command = "wget {{ url }}{{ file }} ".. filePath
shell.run(command)
print(" ")
print(command)
print(" ")
-- print("Adding loadAPI to "..filePath)
local file = io.open(filePath, "r")
local contenu_actuel = file:read("*all")
file:close()
local file = io.open(filePath, "w")
local contenu_a_ajouter = [[
function loadAPI (path)
    local envDirPath = "]] .. filePath .. [["
    envDirPath = envDirPath:match("(.*/)")
    local basePath = envDirPath
    local fullPath = fs.combine(basePath, path)
    os.loadAPI(fullPath .. ".lua")
end
]]

file:write(contenu_a_ajouter)
file:write(contenu_actuel)
file.close()
{% endfor %}

-- manage update
shell.run("wget {{ update_url }} ".. envFolderPath .."/update")