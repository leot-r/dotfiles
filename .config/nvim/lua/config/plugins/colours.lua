return {
    "rose-pine/neovim",
    name = "rose-pine",
    config = function()
        require("rose-pine").setup({
            styles = {
                transparency = true,
            }
        })
        vim.cmd("colorscheme rose-pine")
    end
}
-- return {
--     "altercation/vim-colors-solarized",
--     name = "solarized",
--     config = function ()
--         vim.o.background = "dark"
--         vim.cmd("colorscheme solarized")
--     end
-- }
-- return {
--     "morhetz/gruvbox",
--     priority = 1000,
--     config = function()
--         vim.o.background = "dark"
--         vim.cmd("colorscheme gruvbox")
--     end
-- }
-- return {
--     "folke/tokyonight.nvim",
--     priority = 1000,
--     lazy = false,
--     config = function()
--         require("tokyonight").setup({
--             style = "night",
--         })
--         vim.colorscheme = "tokyonight"
--     end
-- }
