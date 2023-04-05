local function feftyGithubRequest(scripturl)
	if not isfile("fefty/"..scripturl) then
		local suc, res = pcall(function() return game:HttpGet("https://raw.githubusercontent.com/cinarkagan/fefty/"..readfile("fefty/commithash.txt").."/"..scripturl, true) end)
		if not suc or res == "404: Not Found" then return nil end
		if scripturl:find(".lua") then res = "--This watermark is used to delete the file if its cached, remove it to make the file persist after commits.\n"..res end
		writefile("fefty/"..scripturl, res)
	end
	return readfile("fefty/"..scripturl)
end

shared.CustomSavefefty = 292439477
if pcall(function() readfile("fefty/CustomModules/292439477.lua") end) then
	loadstring(readfile("fefty/CustomModules/292439477.lua"))()
else
	local publicrepo = feftyGithubRequest("CustomModules/292439477.lua")
	if publicrepo then
		loadstring(publicrepo)()
	end
end