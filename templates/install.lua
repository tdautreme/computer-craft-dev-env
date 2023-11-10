local args = { ... }

if #args < 1 then
  print("Usage: install <ENV_NAME>")
  return
end

local envName = args[1]

-- if temp_install exists, delete it
local tempInstallPath = "tempInstall"
if fs.exists(tempInstallPath) then
  fs.delete(tempInstallPath)
end

local installPath = "/"..shell.dir().."/"..envName

print(installPath)

shell.run("wget {{ temp_install_url }} " .. tempInstallPath)
shell.run(tempInstallPath .. " " .. installPath)
shell.run("rm " .. tempInstallPath)