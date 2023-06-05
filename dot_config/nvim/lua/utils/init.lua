local M = {}

-- @see taken from https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/util/init.lua#L127
function M.toggle(option, silent, values)
	if values then
		if vim.opt_local[option]:get() == values[1] then
			vim.opt_local[option] = values[2]
		else
			vim.opt_local[option] = values[1]
		end
		return vim.notify(
			"Set " .. option .. " to " .. vim.opt_local[option]:get(),
			vim.log.levels.INFO,
			{ title = "Option" }
		)
	end
	vim.opt_local[option] = not vim.opt_local[option]:get()
	if not silent then
		if vim.opt_local[option]:get() then
			vim.notify("Enabled " .. option, vim.log.levels.INFO, { title = "Option" })
		else
			vim.notify("Disabled " .. option, vim.log.levels.INFO, { title = "Option" })
		end
	end
end

return M
