return {
    {
        "hrsh7th/nvim-cmp",
        dependencies = {
            "hrsh7th/cmp-nvim-lsp",
            "L3MON4D3/LuaSnip",
            "saadparwaiz1/cmp_luasnip",
        },
        config = function()
            local cmp = require("cmp")
            cmp.setup({
                snippet = {
                    expand = function(args) require("luasnip").lsp_expand(args.body) end,
                },
                mapping = cmp.mapping.preset.insert({
                    ["<C-Space>"] = cmp.mapping.complete(),
                    ["<CR>"] = cmp.mapping.confirm({ select = true }),
                }),
                sources = {
                    { name = "nvim_lsp" },
                    { name = "luasnip" },
                },
            })
        end,
    },
    {
        "neovim/nvim-lspconfig",
        dependencies = {
            { "williamboman/mason.nvim", config = true },
            { "williamboman/mason-lspconfig.nvim" },
        },
        config = function()
            require("mason").setup()
            require("mason-lspconfig").setup({
                ensure_installed = { "lua_ls", "pyright", "clangd", "ts_ls", "rust_analyzer" },
                automatic_installation = true,
            })

            local lspconfig = require("lspconfig")


            local on_attach = function(client, bufnr)
                local opts = { noremap=true, silent=true, buffer=bufnr }

                vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, opts)
                vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
                vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
                vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)
                vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)
                vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, opts)
                vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, opts)
            end

            lspconfig.clangd.setup({
                on_attach = on_attach,
                capabilities = require("cmp_nvim_lsp").default_capabilities(),
            })

            lspconfig.pyright.setup({
                on_attach = on_attach,
                capabilities = require("cmp_nvim_lsp").default_capabilities(),
            })

            lspconfig.ts_ls.setup({
                on_attach = on_attach,
                capabilities = require("cmp_nvim_lsp").default_capabilities(),
            })

            lspconfig.lua_ls.setup({
                on_attach = on_attach,
                capabilities = require("cmp_nvim_lsp").default_capabilities(),
                settings = {
                    Lua = {
                        diagnostics = {
                            globals = { "vim" },
                        },
                    },
                },
            })

            lspconfig.rust_analyzer.setup({
                on_attach = on_attach,
                capabilities = require("cmp_nvim_lsp").default_capabilities(),
            })

            local cmp = require('cmp')

            cmp.setup({
                mapping = {
                    ['<Tab>'] = cmp.mapping.select_next_item(),
                    ['<S-Tab>'] = cmp.mapping.select_prev_item(),
                    ['<CR>'] = cmp.mapping.confirm({ select = true }),
                },
                sources = {
                    { name = 'nvim_lsp' }
                }
            })

        end,
    },
}
