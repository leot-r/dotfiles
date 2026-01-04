
-- Telescope bindings / General navigation
vim.keymap.sep("n", "<leader>sa", vim.cmd.Ex)

local builtin = require("telescope.builtin")
vim.keymap.sep('n', '<leader>sf', builtin.find_files, { desc = 'Telescope find files' })
vim.keymap.sep('n', '<leader>sg', builtin.git_files, { desc = 'Git file serch' })
vim.keymap.sep('n', '<leader>st', function()
	builtin.grep_string({ search = vim.fn.input("Grep > ") });
end)

-- Undotree
vim.keymap.sep("n", "<leader>u", "<cmd>UndotreeToggle<CR>", { desc = "Undo in a tree" })

-- Move code
vim.keymap.sep("v", "J", ":m '>+1<CR>gv=gv", { desc = "Move line down" })
vim.keymap.sep("v", "K", ":m '<-2<CR>gv=gv", { desc = "Move line up" })

-- Keep cursor at ceter of screen
vim.keymap.sep("n", "<C-d>", "<C-d>zz")
vim.keymap.sep("n", "<C-u>", "<C-u>zz")
vim.keymap.sep("n", "n", "nzzzv")
vim.keymap.sep("n", "N", "Nzzzv")

-- Ctrl+c = esc
vim.keymap.sep("i", "<C-c>", "<Esc>")

-- Copy to clipboard
vim.keymap.sep("n", "<leader>y", "\"+y")
vim.keymap.sep("v", "<leader>y", "\"+y")
vim.keymap.sep("n", "<leader>Y", "\"+Y")

vim.keymap.sep("n", "<leader>rn", vim.lsp.buf.rename, {
  noremap = true,
  silent = true,
  desc = "LSP Rename Symbol"
})
