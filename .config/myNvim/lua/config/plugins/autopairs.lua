return {
    "windwp/nvim-autopairs",
    event = "InsertEnter",
    config = function()
        local npairs = require("nvim-autopairs")
        npairs.setup({
            check_ts = true,  -- enables Treesitter integration (better behavior)
            fast_wrap = {},
            enable_check_bracket_line = false,
        })

        -- npairs.remove_rule('(')
        -- npairs.remove_rule('[')
    end,
}
