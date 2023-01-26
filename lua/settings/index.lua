-- GLOBALS
vim.g.mapleader = ','
vim.g.vim_markdown_conceal = 0
vim.g.vim_markdown_conceal_code_blocks = 0
vim.g['&t_EI'] = "<Esc>]50;CursorShape=3x7"
vim.g['&t_SI'] = "<Esc>]50;CursorShape=1x7"
vim.g['&t_SR'] = "<Esc>]50;CursorShape=2x7"
vim.g.ayucolor = 'light'

-- OPTIONS
--vim.o.ch = 0 -- command height
vim.o.background = "dark"
vim.o.cursorline = true
vim.o.encoding = "utf-8"
vim.o.expandtab = true
vim.o.foldenable = false
vim.o.foldmethod = "syntax"
vim.o.guifont = "MonoLisa:h12"
vim.o.ignorecase = true
vim.o.incsearch = false
-- vim.o.ls = 0 -- last status
vim.o.number = true
vim.o.paste = false
vim.o.pyxversion = 3
vim.o.relativenumber = true
vim.o.scrolloff = 999
vim.o.showtabline = 2
vim.o.smartcase = true
vim.o.softtabstop = 2
vim.o.spell = true
vim.o.splitbelow = true
vim.o.splitright = true
vim.o.termguicolors = true
vim.o.updatetime = 300
vim.wo.signcolumn = "yes"

-- theme specific settings
vim.g.tokyonight_enable_italic = 1
vim.g.tokyonight_style = 'storm' -- night, storm
vim.g.srcery_italic = 1

-- autocomplete tags
vim.cmd [[autocmd FileType html set omnifunc=htmlcomplete#CompleteTags]]

-- plugins
-- require 'settings/plugins/bufferline'
-- require 'settings/plugins/dadbod'
-- require 'settings/plugins/easymotion'
-- require 'settings/plugins/ministarter'
-- require 'settings/plugins/nvim-cmp'
-- require 'settings/plugins/symbols-outline'
-- require 'settings/plugins/winbar'
-- require'settings/plugins/coc'
-- require'settings/plugins/nerdcommenter'
-- require'settings/plugins/vim-test'
-- require'settings/plugins/vimspector'
--require'settings/plugins/copilot'
--require'settings/plugins/dap'
--require'settings/plugins/miniyank'
require 'settings/plugins/aerial'
require 'settings/plugins/blamer'
require 'settings/plugins/fzf'
require 'settings/plugins/indentline'
require 'settings/plugins/leap'
require 'settings/plugins/lsp'
require 'settings/plugins/lsp_signature'
require 'settings/plugins/lualine'
require 'settings/plugins/neotest'
require 'settings/plugins/nvim-tree'
require 'settings/plugins/nvim-web-devicons'
require 'settings/plugins/telescope'
require 'settings/plugins/treesitter'
require 'settings/plugins/utilisnips'
require 'settings/plugins/vim-gitgutter'
