local M = {}

function M.set_highlight(groups)
	for group, parameters in pairs(groups) do
		vim.api.nvim_set_hl(0, group, parameters)
	end
end

return M
