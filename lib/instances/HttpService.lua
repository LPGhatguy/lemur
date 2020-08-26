local BaseInstance = import("./BaseInstance")
local typeof = import("../functions/typeof")
local json = import("../json")

local HttpService = BaseInstance:extend("HttpService")

-- Credit to https://stackoverflow.com/a/32389020
local AND, OR = 1, 4

local function bit(a, b, oper)
	local r, m, s = 0, 2^52
	repeat
		s, a, b = a + b + m, a % m, b % m
		r, m = r + m * oper % (s - a - b), m / 2
	until m < 1
	return r
end

local function band(a, b)
	return bit(a, b, AND)
end

local function bor(a, b)
	return bit(a, b, OR)
end

local function tohex(number)
	return ("%02x"):format(number)
end

function HttpService.prototype:JSONEncode(input)
	return json.encode(input)
end

function HttpService.prototype:JSONDecode(input)
	return json.decode(input)
end

function HttpService.prototype:UrlEncode(input)
	local url = input:gsub("\n", "\r\n")

	return url:gsub("([^%w])", function(c)
		return string.format("%%%02X", string.byte(c))
	end)
end

function HttpService.prototype:GenerateGUID(wrapInCurlyBraces)
	local argType = typeof(wrapInCurlyBraces)
	if wrapInCurlyBraces ~= nil and argType ~= "boolean" then
		error(("Unable to cast %s to bool"):format(argType), 2)
	end

	local random = math.random

	local guid =
		("%s%s%s%s-%s%s-%s%s-%s%s-%s%s%s%s%s%s"):format(
			tohex(random(0, 255), 2),
			tohex(random(0, 255)),
			tohex(random(0, 255)),
			tohex(random(0, 255)),

			tohex(random(0, 255)),
			tohex(random(0, 255)),

			tohex(bor(band(random(0, 255), 0x0F), 0x40)),
			tohex(random(0, 255)),

			tohex(bor(band(random(0, 255), 0x3F), 0x80)),
			tohex(random(0, 255)),

			tohex(random(0, 255)),
			tohex(random(0, 255)),
			tohex(random(0, 255)),
			tohex(random(0, 255)),
			tohex(random(0, 255)),
			tohex(random(0, 255))
		)

	--[[
		`GenerateGUID` allows any value type for `wrapInCurlyBraces`, but it
		only omits the curly braces when `wrapInCurlyBraces` is set to `false`
	]]
	if wrapInCurlyBraces ~= false then
		guid = "{" .. guid .. "}"
	end

	return guid
end

return HttpService