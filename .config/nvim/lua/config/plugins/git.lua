-- GIT STUFF HERE
return {
    {
        "tpope/vim-fugitive",
        cmd = { "G", "Git", "Gdiffsplit" },  -- lazy-load on Git commands
    },
    {
        "lewis6991/gitsigns.nvim",
        event = "BufRead",
        config = function()
            require("gitsigns").setup()
        end,
    }
}
