local opt = vim.opt

opt.relativenumber = true
opt.number = true

-- vim.cmd([[
--
--   "remember folding
--
--   augroup remember_folds
--     autocmd!
--     autocmd BufWinLeave * mkview
--     autocmd BufWinEnter * silent! loadview
--   augroup END
--
-- ]])

vim.cmd([[
  highlight RenderMarkdownH1 guifg=#ff5555 guibg=NONE gui=bold
  highlight RenderMarkdownH2 guifg=#50fa7b guibg=NONE gui=bold
  highlight RenderMarkdownH3 guifg=#f1fa8c guibg=NONE gui=bold
  highlight RenderMarkdownH4 guifg=#bd93f9 guibg=NONE gui=bold
  highlight RenderMarkdownH5 guifg=#ff79c6 guibg=NONE gui=bold
  highlight RenderMarkdownH6 guifg=#8be9fd guibg=NONE gui=bold
]])

opt.tabstop = 2
opt.shiftwidth = 2
opt.expandtab = true
opt.autoindent = true

opt.termguicolors = true
opt.signcolumn = "yes" -- show sign column so that text doesn't shift

-- backspace
opt.backspace = "indent,eol,start" -- allow backspace on indent, end of line or insert mode start position

-- clipboard
opt.clipboard:append("unnamedplus") -- use system clipboard as default register

-- split windows
opt.splitright = true -- split vertical window to the right
opt.splitbelow = true -- split horizontal window to the bottom

-- turn off swapfile
opt.swapfile = false
