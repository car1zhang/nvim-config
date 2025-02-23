require('mason').setup()
require('mason-lspconfig').setup({
    ensure_installed = { 'clangd', 'pyright', 'ts_ls', 'lua_ls' },
    automatic_installation = true
})

local lspconfig = require('lspconfig')

-- Common on_attach
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

lspconfig.clangd.setup{}

lspconfig.pyright.setup{
    on_attach = on_attach
}

lspconfig.ts_ls.setup{}

lspconfig.lua_ls.setup{
    on_attach = on_attach,
    settings = {
        Lua = {
            diagnostics = {
                globals = { "vim" }, -- Prevents 'vim' undefined error in Neovim Lua config
            },
        },
    },
}

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
