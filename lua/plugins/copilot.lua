return {
    {
        "github/copilot.vim",
        config = function()
            vim.g.copilot_no_tab_map = true
            vim.g.copilot_enabled = false
            vim.api.nvim_set_keymap('i', '<C-CR>', 'copilot#Accept("<CR>")', { expr = true, noremap = true, silent = true })
        end
    },
}
