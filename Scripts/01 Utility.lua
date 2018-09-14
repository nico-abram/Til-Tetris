-- General utility functions
function tableKeys(t)
	local keys = {}
	local n = 0
	for k, v in pairs(t) do
		n = n + 1
		keys[n] = k
	end
	return keys
end

function shuffle(tbl)
	size = #tbl
	for i = size, 1, -1 do
		local rand = math.random(size)
		tbl[i], tbl[rand] = tbl[rand], tbl[i]
	end
	return tbl
end

function serializeTable(val, name, skipnewlines, depth)
	skipnewlines = skipnewlines or false
	depth = depth or 0

	local tmp = string.rep(" ", depth)

	if name then
		tmp = tmp .. name .. " = "
	end

	if type(val) == "table" then
		tmp = tmp .. "{" .. (not skipnewlines and "\n" or "")

		for k, v in pairs(val) do
			tmp = tmp .. serializeTable(v, k, skipnewlines, depth + 1) .. "," .. (not skipnewlines and "\n" or "")
		end

		tmp = tmp .. string.rep(" ", depth) .. "}"
	elseif type(val) == "number" then
		tmp = tmp .. tostring(val)
	elseif type(val) == "string" then
		tmp = tmp .. string.format("%q", val)
	elseif type(val) == "boolean" then
		tmp = tmp .. (val and "true" or "false")
	else
		tmp = tmp .. '"[inserializeable datatype:' .. type(val) .. ']"'
	end

	return tmp
end

function invertTable(t)
	local s = {}
	for k, v in pairs(t) do
		s[v] = k
	end
	return s
end

function copyTable(obj, seen)
	if type(obj) ~= "table" then
		return obj
	end
	if seen and seen[obj] then
		return seen[obj]
	end
	local s = seen or {}
	local res = setmetatable({}, getmetatable(obj))
	s[obj] = res
	for k, v in pairs(obj) do
		res[copyTable(k, s)] = copyTable(v, s)
	end
	return res
end

function colorSum(c1, c2, r1, r2)
	return {c1[1] * r1 + (c2[1]) * r2, c1[2] * r1 + (c2[2]) * r2, c1[3] * r1 + (c2[3]) * r2, c1[4]}
end

function output(thing)
	SCREENMAN:SystemMessage(serializeTable(thing))
end

function pos(x, y)
	return {x = x, y = y}
end
