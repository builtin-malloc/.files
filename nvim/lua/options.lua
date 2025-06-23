local opt = vim.opt

vim.opt.swapfile   = false
opt.number         = true
opt.tabstop        = 4
opt.shiftwidth     = 4
opt.expandtab      = true
opt.smartindent    = true
opt.wrap           = false
opt.scrolloff      = 8
opt.signcolumn     = "yes"
opt.updatetime     = 300
opt.hlsearch       = true
opt.incsearch      = true

vim.opt.list = true
opt.listchars = {
  tab = "▸ ",
  trail = "·",
  nbsp = "␣",
}
