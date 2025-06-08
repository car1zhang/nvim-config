return {
    "supermaven-inc/supermaven-nvim",
    config = function()
        require("supermaven-nvim").setup({
            keymaps = {
                accept_suggestion = "<C-CR>",
                clear_suggestion = "<C-BS>",
                accept_word = "<S-CR>",
            },
        })
    end,
}
