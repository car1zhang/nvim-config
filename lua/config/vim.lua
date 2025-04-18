vim.opt.ts = 4
vim.opt.sts = 4
vim.opt.sw = 4
vim.opt.ai = true
vim.opt.si = true
vim.opt.et = true
vim.opt.bs = '2'
vim.opt.nu = true
vim.opt.rnu = true

vim.cmd([[colorscheme gruvbox]])

-- vim.keymap.set('n', '<c-r>', '<cmd>split | term g++ -o main.exe "%:p" && main.exe<cr>')
vim.keymap.set('n', '<leader>y', '"+y_')
vim.keymap.set('n', '<leader>Y', 'gg"+yG_')
vim.keymap.set('n', '<leader>p', '"+p_')

vim.keymap.set('i', '<C-CR>', '<cmd>call augment#Accept()<cr>', { noremap = true })
