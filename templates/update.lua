local envDirPath = shell.getRunningProgram()
envDirPath = envDirPath:match("(.*/)")

local tempInstallPath = fs.combine(envDirPath, "../tempInstall")
envDirPath = "/" .. envDirPath
tempInstallPath = "/" .. tempInstallPath
print(tempInstallPath .." " .. envDirPath)

shell.run("wget {{ temp_install_url }} " .. tempInstallPath)
shell.run(tempInstallPath .." " .. envDirPath)
shell.run("rm " .. tempInstallPath)