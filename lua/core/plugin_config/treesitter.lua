require'nvim-treesitter.configs'.setup {
    ensure_installed = { "cpp", "c", "lua", "vim", "rust", "html", "css", "javascript", "typescript", "json", "gitignore", "python", "java" },

    sync_install = false,
    auto_install = true,
    highlight = {
        enable = true
    }
}
