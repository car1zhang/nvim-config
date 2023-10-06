vim.opt.ts = 2
vim.opt.sts = 2
vim.opt.sw = 2
vim.opt.ai = true
vim.opt.si = true
vim.opt.et = true
vim.opt.bs = '2'
vim.opt.rnu = true

vim.keymap.set('n', '<c-r>', '<cmd>split | term g++ -o main.exe "%:p" && main.exe<cr>')
