return { -- NOTE: Need to install luarocks manually
    {
        "nvim-neorg/neorg",
        dependencies = {
            { "nvim-lua/plenary.nvim", },
        },
        build = ":Neorg sync-parsers",
        config = function()
            require('nvim-treesitter.install').compilers = { "clang" }
            require('nvim-treesitter.parsers').get_parser_configs().norg = {
                install_info = {
                    url = "https://github.com/nvim-neorg/tree-sitter-norg",
                    files = { "src/parser.c", "src/scanner.cc" },
                    use_makefile = true,  -- This ensures the Makefile is used
                },
            }
            require("neorg").setup({
                load = {
                    ["core.defaults"] = {}, -- Loads default behaviour
                    ["core.concealer"] = {}, -- Adds pretty icons to your documents
                    ["core.dirman"] = { -- Manages Neorg workspaces
                        config = {
                            workspaces = {
                                notes = "~/Documents/notes",
                            },
                            default_workspace = "notes",
                        },
                    },
                },
            })

            vim.keymap.set("n", "<leader>n", ":Neorg workspace notes<CR>", { desc = "Go to notes Neorg workspace" })
        end,
    },
}
