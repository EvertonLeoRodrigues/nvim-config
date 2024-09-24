return {
	"shaunsingh/nord.nvim",
	name = "nord",
	priority = 1000,
	dependencies = {
		"nvim-treesitter/nvim-treesitter",
	},
	config = function()
		vim.cmd([[colorscheme nord]])
	end,
}
