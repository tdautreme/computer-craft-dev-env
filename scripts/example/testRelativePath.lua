function relativePath(path, current_dir)
    result = fs.combine(current_dir, path)
    if string.sub(path, 1, 1) == "/" then
        result = path
    end
    return result
end 

local args = { ... }

if #args < 1 then
  print("Usage: testRelativePath <path>")
  return
end


local envFolderPath = args[1]
local shellDir = shell.dir()
relativePathResult = relativePath(envFolderPath, shellDir)

print("relative path: "..relativePathResult)

