-- plugins for notetaking and knowledge management

return {
	-- install with yarn or npm
	{
		"iamcco/markdown-preview.nvim",
		cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
		build = "cd app && yarn install",
		init = function()
			vim.g.mkdp_filetypes = { "markdown" }
		end,
		ft = { "markdown" },
	},
	{
		"MeanderingProgrammer/render-markdown.nvim",
		opts = {},
		dependencies = { "nvim-treesitter/nvim-treesitter", "nvim-tree/nvim-web-devicons" },
		---@module 'render-markdown'
		---@type render.md.UserConfig
		config = function()
			local render = require("render-markdown")
			render.setup({
				heading = {
					-- Turn on / off heading icon & background rendering
					enabled = true,
					-- Turn on / off any sign column related rendering
					sign = true,
					-- Determines how icons fill the available space:
					--  inline:  underlying '#'s are concealed resulting in a left aligned icon
					--  overlay: result is left padded with spaces to hide any additional '#'
					position = "overlay",
					-- Replaces '#+' of 'atx_h._marker'
					-- The number of '#' in the heading determines the 'level'
					-- The 'level' is used to index into the array using a cycle
					icons = { "󰲡 ", "󰲣 ", "󰲥 ", "󰲧 ", "󰲩 ", "󰲫 " },
					-- Added to the sign column if enabled
					-- The 'level' is used to index into the array using a cycle
					signs = { "󰫎 " },
					-- Width of the heading background:
					--  block: width of the heading text
					--  full:  full width of the window
					-- Can also be an array of the above values in which case the 'level' is used
					-- to index into the array using a clamp
					width = "full",
					-- Amount of margin to add to the left of headings
					-- If a floating point value < 1 is provided it is treated as a percentage of the available window space
					-- Margin available space is computed after accounting for padding
					-- Can also be an array of numbers in which case the 'level' is used to index into the array using a clamp
					left_margin = 0,
					-- Amount of padding to add to the left of headings
					-- If a floating point value < 1 is provided it is treated as a percentage of the available window space
					-- Can also be an array of numbers in which case the 'level' is used to index into the array using a clamp
					left_pad = 0,
					-- Amount of padding to add to the right of headings when width is 'block'
					-- If a floating point value < 1 is provided it is treated as a percentage of the available window space
					-- Can also be an array of numbers in which case the 'level' is used to index into the array using a clamp
					right_pad = 0,
					-- Minimum width to use for headings when width is 'block'
					-- Can also be an array of integers in which case the 'level' is used to index into the array using a clamp
					min_width = 0,
					-- Determins if a border is added above and below headings
					border = false,
					-- Alway use virtual lines for heading borders instead of attempting to use empty lines
					border_virtual = false,
					-- Highlight the start of the border using the foreground highlight
					border_prefix = false,
					-- Used above heading for border
					above = "▄",
					-- Used below heading for border
					below = "▀",
					-- The 'level' is used to index into the array using a clamp
					-- Highlight for the heading icon and extends through the entire line
					backgrounds = {
						-- "RenderMarkdownH1Bg",
						-- "RenderMarkdownH2Bg",
						-- "RenderMarkdownH3Bg",
						-- "RenderMarkdownH4Bg",
						-- "RenderMarkdownH5Bg",
						-- "RenderMarkdownH6Bg",
					},
					-- The 'level' is used to index into the array using a clamp
					-- Highlight for the heading and sign icons
					foregrounds = {
						"RenderMarkdownH1",
						"RenderMarkdownH2",
						"RenderMarkdownH3",
						"RenderMarkdownH4",
						"RenderMarkdownH5",
						"RenderMarkdownH6",
					},
				},
				quote = {
					-- Turn on / off block quote & callout rendering
					enabled = true,
					-- Replaces '>' of 'block_quote'
					icon = "▋",
					-- Whether to repeat icon on wrapped lines. Requires neovim >= 0.10. This will obscure text if
					-- not configured correctly with :h 'showbreak', :h 'breakindent' and :h 'breakindentopt'. A
					-- combination of these that is likely to work is showbreak = '  ' (2 spaces), breakindent = true,
					-- breakindentopt = '' (empty string). These values are not validated by this plugin. If you want
					-- to avoid adding these to your main configuration then set them in win_options for this plugin.
					repeat_linebreak = false,
					breakindent = true,
					breakindentopt = "",
					-- Highlight for the quote icon
					highlight = "RenderMarkdownQuote",
				},
				latex = {
					enabled = true,
					converter = "latex2text",
					highlight = "RenderMarkdownMath",
					top_pad = 0,
					bottom_pad = 0,
				},
			})
			vim.g.render_markdown_template = [[
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/katex@0.13.11/dist/katex.min.css">
    <script defer src="https://cdn.jsdelivr.net/npm/katex@0.13.11/dist/katex.min.js"></script>
    <script defer src="https://cdn.jsdelivr.net/npm/katex@0.13.11/dist/contrib/auto-render.min.js"></script>
    <script>
        document.addEventListener("DOMContentLoaded", function() {
            renderMathInElement(document.body, {
                delimiters: [
  	
#add8e6                   {left: "$$", right: "$$", display: true},
                    {left: "$", right: "$", display: false}
                ]
            });
        });
    </script>
</head>
<body>
{{content}}
</body>
</html>
]]
		end,
	},
	{
		"kylechui/nvim-surround",
		version = "*", -- Use for stability; omit to use `main` branch for the latest features
		event = "VeryLazy",
		config = function()
			require("nvim-surround").setup({
				-- Configuration here, or leave empty to use defaults
			})
		end,
	},
	{
		"kevinhwang91/nvim-ufo",
		dependencies = "kevinhwang91/promise-async",
		config = function()
			vim.o.foldcolumn = "1"
			vim.o.foldlevel = 99
			vim.o.foldlevelstart = 99
			vim.o.foldenable = true

			local ufo = require("ufo")

			vim.keymap.set("n", "zR", ufo.openAllFolds)
			vim.keymap.set("n", "zM", ufo.closeAllFolds)
			vim.keymap.set("n", "zK", function()
				local winid = ufo.peekFoldedLinesUnderCursor()
				if not winid then
					vim.lsp.buf.hover()
				end
			end)

			ufo.setup({
				provider_selector = function(bufnr, filetype, buftype)
					return { "lsp", "indent" }
				end,
			})
		end,
	},
	{
		"epwalsh/obsidian.nvim",
		version = "*",
		lazy = true,
		ft = "markdown",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"nvim-telescope/telescope.nvim",
		},
		config = function()
			local obs = require("obsidian")
			obs.setup({
				workspaces = {
					{
						name = "Everton",
						path = "/home/evesantos/Documents/Eve",
					},
				},
				completion = {
					nvim_cmp = true,
					min_chars = 2,
				},
				new_notes_location = "notes_subdir",
				note_id_func = function(title)
					return title and title:gsub(" ", "_"):lower() or tostring(os.time())
				end,
				note_frontmatter_func = function(note)
					local out = { id = note.id, aliases = note.aliases, tags = note.tags, date = os.date("%Y-%m-%d") }

					if note.metadata ~= nil and not vim.tbl_isempty(note.metadata) then
						for k, v in pairs(note.metadata) do
							out[k] = v
						end
					end

					return out
				end,
				mappings = {},

				templates = {
					subdir = "Templates",
					date_format = "%Y-%m-%d",
					time_format = "%H:%M",
					tags = "",
					substitutions = {
						yesterday = function()
							return os.date("%Y-%m-%d", os.time() - 86400)
						end,
						tomorrow = function()
							return os.date("%Y-%m-%d", os.time() + 86400)
						end,
					},
				},

				ui = {
					enable = false, -- using render-markdown.nvim instead
				},
			})
		end,
	},
}
