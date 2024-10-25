return {
	"xiantang/darcula-dark.nvim",
	dependencies = {
		"nvim-treesitter/nvim-treesitter",
	},
	config = function()
		opt =
			{

				integrations = {
					telescope = false,
					lualine = true,
					lsp_semantics_token = true,
					nvim_cmp = true,
					dap_nvim = true,
				},
			},
    vim.cmd.colorscheme("darcula-dark")
	end,
}
