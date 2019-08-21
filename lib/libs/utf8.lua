local function castToNumber(argNum, value, r1, r2)
	local num = tonumber(value)

	if type(num) ~= "number" then
		error("bad argument #" .. argNum .. " to 'char' (number expect, got " .. typeof(num) .. ")", 2)
	end

	if (r1 and not (r1 <= num)) or (r2 and not (num <= r2)) then
		error("bad argument #" .. argNum .. " to 'char' (value out of range)", 2)
	end

	return num
end

local rbxUTF8 = {}
rbxUTF8.charpattern = "[%z\1-\127\194-\244][\128-\191]*"

-- works for every valid input
rbxUTF8.char = function(...)
	local results = {}
	for i = 1, select("#", ...) do
		local a = castToNumber(i, select(i, ...), 0, 1114111)

		if a >= 128 then
			local _1 = a % 64
			local b = (a - _1) / 64

			if a >= 2048 then
				local _64 = b % 64
				local c = (b - _64) / 64

				if a >= 65536 then
					local _4096 = c % 64
					local d = (c - _4096) / 64
					results[i] = string.char(d + 240, _4096 + 128, _64 + 128, _1 + 128)
				else
					results[i] = string.char(c + 224, _64 + 128, _1 + 128)
				end
			else
				results[i] = string.char(b + 192, _1 + 128)
			end
		else
			results[i] = string.char(a)
		end
	end
	return table.concat(results)
end

rbxUTF8.graphemes = function(str, i, j)
	return coroutine.wrap(function()
		local a, b = string.find(str, rbxUTF8.charpattern)

		while a do
			local c, d = string.find(str, rbxUTF8.charpattern, b + 1)
			if c then
				-- FIXME: We need to lookahead here to see if a-b can be paired with c-d
				coroutine.yield(a, b, c, d)
			else
				coroutine.yield(a, b)
			end
			a, b = c, d
		end
		coroutine.yield()
	end)
end

-- not fully tested yet
rbxUTF8.codes = function(_, i, j)
	return coroutine.wrap(function(str)
		local a, b = 0

		while true do
			a, b = string.find(str, rbxUTF8.charpattern, a + 1)
			if a == nil then break end
			local c = b - a

			if c == 0 then
				coroutine.yield(a, string.byte(str, a))
			elseif c == 1 then
				coroutine.yield(
					a,
					(string.byte(str, a) - 192) * 64 +
					(string.byte(str, a + 1) - 128)
				)
			elseif c == 2 then
				coroutine.yield(
					a,
					(string.byte(str, a) - 224) * 4096 +
					(string.byte(str, a + 1) - 128) * 64 +
					(string.byte(str, a + 2) - 128)
				)
			elseif c == 3 then
				coroutine.yield(
					a,
					(string.byte(str, a) - 240) * 262144 +
					(string.byte(str, a + 1) - 128) * 4096 +
					(string.byte(str, a + 2) - 128) * 64 +
					(string.byte(str, a + 3) - 128)
				)
			end
		end
		coroutine.yield()
	end)
end

-- temp tests
local valid = [[
هذه هي بعض النصوص العربي
Hello there!
ᚠᛇᚻ᛫ᛒᛦᚦ᛫ᚠᚱᚩᚠᚢᚱ᛫ᚠᛁᚱᚪ᛫ᚷᛖᚻᚹᛦᛚᚳᚢᛗ
Sîne klâwen durh die wolken sint geslagen,
Τη γλώσσα μου έδωσαν ελληνική
На берегу пустынных волн
ვეპხის ტყაოსანი შოთა რუსთაველი
யாமறிந்த மொழிகளிலே தமிழ்மொழி போல் இனிதாவது எங்கும் காணோம்,
我能吞下玻璃而不伤身体
나는 유리를 먹을 수 있어요. 그래도 아프지 않아요
]]

local a = utf8.graphemes(valid)
local b = rbxUTF8.graphemes(valid)

repeat
	local t1 = {a()}
	local t2 = {b()}
	if (t1[1] ~= t2[1] or t1[2] ~= t2[2]) then
		print(unpack(t1))
		print(unpack(t2)) -- see FIXME above
		error("problem!")
	end
until t1[1] == nil and t2[1] == nil
-- Previous art?? https://github.com/luapower/utf8/blob/master/utf8.lua#L194

return rbxUTF8
