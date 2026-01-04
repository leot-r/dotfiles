return {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    event = { "BufReadPre", "BufNewFile" }, -- Load when opening an exising file
    config = function()
        local treesitter = require("nvim-treesitter.configs")

        treesitter.setup({
            highlight = {
                enable = true,
            },
            indent = { enable = true },
            ensure_installed = {
				"lua",
				"bash",
				"python",
				"javascript",
				"typescript",
				"html",
				"css",
				"json",
				"markdown",
				"markdown_inline",
                "go",
			},
        })

    end
}
