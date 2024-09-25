return {
	"xiantang/darcula-dark.nvim",
	name = "darcula",
	priority = 1001,
	dependencies = {
		"nvim-treesitter/nvim-treesitter",
	},
	config = function()
		local darcula = require("darcula")
		darcula.setup({})
		vim.cmd.colorscheme("darcula-dark")
	end,
}
