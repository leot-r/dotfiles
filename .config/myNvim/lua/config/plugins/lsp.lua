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
                    -- "tsserver",
                    "html",
                    "cssls",
                    "jsonls",
                    "bashls",
                    "yamlls",
                    "gopls",
                }
            })
        end
    },
    {
        "neovim/nvim-lspconfig",
        config = function()
            local capabilities = require('blink.cmp').get_lsp_capabilities()
            local lspconfig = vim.lsp.config()

            -- Do things when we connect to an lsp
            local on_attach = function(client, bufnr)
                local opts = { noremap = true, silent = true, buffer = bufnr }

                vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts) --Jump to definition
                -- vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts)
                vim.keymap.set("n", "gi", vim.lsp.buf.implementation, opts) --Jump to implementation
                vim.keymap.set("n", "gr", vim.lsp.buf.references, opts) --Jump to references
                vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
                vim.keymap.set("n", "<C-k>", vim.lsp.buf.signature_help, opts)
                vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts) --Rename var
                -- vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, opts)
                -- vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, opts)
                -- vim.keymap.set("n", "]d", vim.diagnostic.goto_next, opts)
                vim.keymap.set("n", "<leader>e", vim.diagnostic.open_float, opts)
                -- vim.keymap.set("n", "<leader>f", function()
                    -- vim.lsp.buf.format { async = true }
                -- end, opts)
            end

            -- Setup diagnostics
            vim.diagnostic.config({
                virtual_text = {
                    spacing = 4,
                    prefix = "●",
                },
                signs = true,
                underline = true,
                update_in_insert = false,
                severity_sort = true,
            })

            -- Setup lsp servers
            lspconfig.lua_ls.setup({
                capabilities = capabilities,
                on_attach = on_attach
            })
            lspconfig.pyright.setup({
                capabilities = capabilities,
                on_attach = on_attach,
                filetypes = { "python" },
            })
            lspconfig.yamlls.setup({
                capabilities = capabilities,
                on_attach = on_attach,
                settings = {
                    yaml = {
                        schemas = {
                            -- Example schemas
                            ["https://json.schemastore.org/github-workflow.json"] = "/.github/workflows/*",
                            ["https://json.schemastore.org/kubernetes.json"] = "/*.k8s.yaml",
                            -- Add more as needed
                        },
                        validate = true,
                        format = { enable = true },
                        hover = true,
                        completion = true,
                    },
                },
            })
            lspconfig.html.setup {}
            lspconfig.cssls.setup {}
            lspconfig.jsonls.setup {}
            lspconfig.bashls.setup {}
            lspconfig.gopls.setup {}
        end
    }
}

