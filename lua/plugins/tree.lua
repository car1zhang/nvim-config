vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
vim.g.nvim_tree_respect_buf_cwd = 1

vim.opt.termguicolors = true

return {
    {
        "nvim-tree/nvim-tree.lua",
        dependencies = { "nvim-tree/nvim-web-devicons" },
        config = function()
            require("nvim-tree").setup({
                view = {
                    width = 30,
                    side = "left",
                    relativenumber = true,
                },
                renderer = {
                    icons = {
                        show = {
                            git = true,
                            folder = true,
                            file = true,
                            folder_arrow = true,
                        },
                    },
                },
                filters = {
                    git_ignored = false,
                },
            })

            vim.keymap.set("n", "<leader>e", ":NvimTreeFindFile<CR>", { desc = "Open Nvimtree" })
        end,
    },
}
