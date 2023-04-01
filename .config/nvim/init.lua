local vimrc = vim.fn.stdpath("config") .. "/vim/vimrc"
vim.cmd.source(vimrc)

require'themes'
require'lsp'
require'misc'

