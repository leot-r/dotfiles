-- Line number things
vim.opt.nu = true
vim.opt.relativenumber = true

-- Turn off relative numbers in insert mode
vim.api.nvim_create_autocmd("InsertEnter", {
  callback = function()
    vim.opt.relativenumber = false
  end,
})

-- Turn them back on when leaving insert mode
vim.api.nvim_create_autocmd("InsertLeave", {
  callback = function()
    vim.opt.relativenumber = true
  end,
})



-- Tab stuff
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

vim.opt.smartindent = true

vim.opt.wrap = false

-- Search better
vim.opt.hlsearch = false
vim.opt.incsearch = true

-- Dont scroll away
vim.opt.scrolloff = 8
vim.opt.signcolumn = "yes"

-- Update time?
vim.opt.updatetime = 50
