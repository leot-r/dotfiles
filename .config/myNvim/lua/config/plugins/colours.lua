return {
    "folke/tokyonight.nvim",
    config = function()
        require("tokyonight").setup({
            style = "night",  -- or "storm", "moon", "day"
            transparent = true, -- This tells TokyoNight not to set background color

            --on_highlights = function(hl, colors)
                ---- Manually set a dark gray background to override transparency where needed
                --hl.Normal = { bg = "#121212", fg = colors.fg }
                --hl.NormalNC = { bg = "#121212", fg = colors.fg }
                --hl.FloatBorder = { fg = colors.blue, bg = "#121212" }
                --hl.NormalFloat = { bg = "#121212" }
                --hl.VertSplit = { fg = "#1a1a1a" }
            --end,
        })
        vim.cmd.colorscheme("tokyonight")
    end 
}
