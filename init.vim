set runtimepath^=~/.nvim runtimepath+=~/.nvim/after
let &packpath = &runtimepath

lua require('init')
colorscheme tokyonight
