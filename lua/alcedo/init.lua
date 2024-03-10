local M = {}

local config = require("alcedo.config").default

local cmd = vim.cmd

function M.setup(settings)
	if settings.style == "day" then
		config.style = "day"
	end

	if settings.transparent then
		config.transparent = true
	end
end

function M.load()
	cmd.highlight("clear")

	if vim.fn.exists("syntax_on") then
		cmd.syntax("reset")
	end

	vim.g.colors_name = "alcedo"

	require("alcedo.theme").setup(config.style)

	if config.transparent then
		local groups = {
			FoldColumn = {
				bg = "NONE",
			},

			SignColumn = {
				bg = "NONE",
			},

			Normal = {
				bg = "NONE",
			},

			NormalNC = {
				bg = "NONE",
			},
		}

		require("alcedo.utils").set_highlight(groups)
	end
end

return M
