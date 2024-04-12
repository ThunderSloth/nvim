
local function toBits(num, nBits)
	local bits = {}

	-- Convert the number to its binary representation
	repeat
		local remainder = num % 2
		table.insert(bits, 1, remainder) -- Insert the remainder at the beginning of the table
		num = math.floor(num / 2)
	until num == 0

	-- Add leading zeros if necessary
	local numBits = #bits
	local numZerosToAdd = nBits - numBits
	for _ = 1, numZerosToAdd do
		table.insert(bits, 1, 0)
	end

	return bits
end

local function binCombos(nBits)
	local _t = {}
	-- Calculate the maximum number of combinations based on the number of bits
	local len = 2 ^ nBits

	-- Iterate through each combination
	for _i = 0, len - 1 do
		_t[_i + 1] = {}
		for _j, _b in ipairs(toBits(_i, nBits)) do
			_t[_i + 1][_j] = _b
		end
	end
	return _t
end

local function getTable(nInputs, nOutputs)
	nOutputs = nOutputs or 1
	local _t = binCombos(nInputs) -- get all possible n-bit binary numbers
	local header = {"m_n"}
	for _i=1, nInputs do
		table.insert(header, string.char(64 + _i))
	end
	for _=1, nOutputs do
		table.insert(header, " ")
	end
	local _s = ("\\begin{displaymath}\n\t\\begin{array}{c|%s|%s}"):format(
		string.rep("c", nInputs),
		string.rep("c", nOutputs)
	) .. "\n\t\t" .. table.concat(header, " & ") .. "\\\\\n\t\t\\hline\n"

	for _i, _v in ipairs(_t) do
		table.insert(_t[_i], 1, ("m_{%d}"):format(_i-1))
		for _j = 1, nOutputs do
			_t[_i][#_t[_i] + 1] = " "
		end
		_s = _s .. "\t\t" .. table.concat(_t[_i], " & ") .. "\\\\\n"
	end
	return _s .. "\t\\end{array}\n\\end{displaymath}"
end

local M = {
	s(
		{ trig = "tt%s(%d+)%s(%d+) ", snippetType = "autosnippet", regTrig = true },
		f(function(_, snip)
			local nInputs = snip.captures[1]
			local nOutputs = snip.captures[2]lines = {}
			for _s in getTable(nInputs, nOutputs):gmatch("[^\r\n]+") do
				table.insert(lines, _s)
			end
			return lines
		end, {})
	),
}

return M

