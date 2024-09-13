require "eve.options"
require "eve.keymaps"
require "eve.lazy"

function OpenMarkdownPreview(url)
  vim.fn.jobstart({"firefox", "--new-window", url}, {detach = true})
end

vim.g.mkdp_browserfunc = 'OpenMarkdownPreview'
