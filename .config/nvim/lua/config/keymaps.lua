
-- Telescope bindings / General navigation
vim.keymap.set("n", "<leader>sa", vim.cmd.Ex)

local builtin = require("telescope.builtin")
vim.keymap.set('n', '<leader>sf', builtin.find_files, { desc = 'Telescope find files' })
vim.keymap.set('n', '<leader>sg', builtin.git_files, { desc = 'Git file serch' })
vim.keymap.set('n', '<leader>st', function()
	builtin.grep_string({ search = vim.fn.input("Grep > ") });
end)

-- Undotree
vim.keymap.set("n", "<leader>u", "<cmd>UndotreeToggle<CR>", { desc = "Undo in a tree" })

-- Move code
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv", { desc = "Move line down" })
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv", { desc = "Move line up" })

-- Keep cursor at ceter of screen
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

-- Ctrl+c = esc
vim.keymap.set("i", "<C-c>", "<Esc>")

-- Copy to clipboard
vim.keymap.set("n", "<leader>y", "\"+y")
vim.keymap.set("v", "<leader>y", "\"+y")
vim.keymap.set("n", "<leader>Y", "\"+Y")
