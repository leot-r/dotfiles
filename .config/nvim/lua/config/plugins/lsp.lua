-- :checkhealth vim.lsp
return {
    {
        "mason-org/mason.nvim",
        config = function()
            require("mason").setup()
        end
    },
    {
        "mason-org/mason-lspconfig.nvim",
        config = function()
            require("mason-lspconfig").setup({
                ensure_installed = {
                    "lua_ls",
                    "pyright",
                    "vtsls",
                    -- "tsserver",
                    "html",
                    "cssls",
                    "jsonls",
                    "bashls",
                    "yamlls",
                    "gopls",
                    "rust_analyzer",
                }
            })
        end
    },
    {
        "neovim/nvim-lspconfig",
        config = function()
            local lspconfig = require("lspconfig")
            local on_attach = function(client, bufnr)
                local opts = { noremap = true, silent = true, buffer = bufnr }

                vim.keymap.set("n", "<leader>gd", vim.lsp.buf.definition, opts) --Jump to definition
                vim.keymap.set("n", "<leader>gi", vim.lsp.buf.implementation, opts) --Jump to implementation
                vim.keymap.set("n", "<leader>gr", vim.lsp.buf.references, opts) --Jump to references
                vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts) --Rename var
                -- vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts)
                -- vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, opts)
                -- vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, opts)
                -- vim.keymap.set("n", "]d", vim.diagnostic.goto_next, opts)
                -- vim.keymap.set("n", "<leader>f", function()
                -- vim.lsp.buf.format { async = true }
                -- end, opts)
                vim.keymap.set("n", "K", vim.lsp.buf.hover, opts) -- Show the err
                vim.keymap.set("n", "<C-k>", vim.lsp.buf.signature_help, opts)
                vim.keymap.set("n", "<leader>e", vim.diagnostic.open_float, opts)
            end

            -- Capabilities (compleation) (combine regualar and blink.cmp capabilities)
            local capabilities = vim.lsp.protocol.make_client_capabilities()
            capabilities = vim.tbl_deep_extend('force', capabilities, require('blink.cmp').get_lsp_capabilities({}, false))


            -- Diagnostics
            vim.diagnostic.config({
                virtual_text = {
                    prefix = "●",
                },
                signs = true,
                underline = true,
                update_in_insert = false,
                severity_sort = true,
            })

            --===================== Language server config =============================--
            lspconfig.lua_ls.setup({
                on_attach = on_attach,
                capabilities = capabilities,
                -- settings = {
                    -- Lua {
                        -- diagnostics = { globals = { "vim" }},
                        -- workspace = {
                            -- library = vim.api.nvim_get_runtime_file("", true),
                            -- checkThirdParty = false,
                        -- },
                    -- },
                -- },
            })
            lspconfig.pyright.setup({
                on_attach = on_attach,
                capabilities = capabilities,
            })
            lspconfig.html.setup({
                on_attach = on_attach,
                capabilities = capabilities,
            })
            lspconfig.cssls.setup({
                on_attach = on_attach,
                capabilities = capabilities,
            })
            lspconfig.jsonls.setup({
                on_attach = on_attach,
                capabilities = capabilities,
            })
            lspconfig.bashls.setup({
                on_attach = on_attach,
                capabilities = capabilities,
            })
            lspconfig.yamlls.setup({
                on_attach = on_attach,
                capabilities = capabilities,
            })
            lspconfig.gopls.setup({
                on_attach = on_attach,
                capabilities = capabilities,
            })
            -- lspconfig.rust_analyzer.setup({
            --     on_attach = on_attach,
            --     capabilities = capabilities
            -- })
        end,
    }
}
