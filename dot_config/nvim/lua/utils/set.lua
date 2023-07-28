local M = {}
function M.tableAsSet(originalTable)
	local set = {}
	local newTable = {}
	for _, value in ipairs(originalTable) do
		if not set[value] then
			table.insert(newTable, value)
			set[value] = true
		end
	end
	return newTable
end

return M
