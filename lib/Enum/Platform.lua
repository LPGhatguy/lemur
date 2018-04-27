local platformArray = {
	"Windows",
	"OSX",
	"IOS",
	"Android",
	"XBoxOne",
	"PS4",
	"PS3",
	"XBox360",
	"WiiU",
	"NX",
	"Ouya",
	"AndroidTV",
	"Chromecast",
	"Linux",
	"SteamOS",
	"WebOS",
	"DOS",
	"BeOS",
	"UWP",
	"None",
}

local platforms = {}
for _, value in ipairs(platformArray) do
	platforms[value] = value
end
return platforms