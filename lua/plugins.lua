return require('packer').startup(function(use)
        use 'wbthomason/packer.nvim'

        --language server
        use 'neovim/nvim-lspconfig'
        use 'lukas-reineke/lsp-format.nvim'
        use 'simrat39/rust-tools.nvim'
        use 'sbdchd/neoformat'
        use 'hrsh7th/cmp-nvim-lsp'
        use 'hrsh7th/cmp-buffer'
        use 'hrsh7th/cmp-path'
        use 'hrsh7th/cmp-cmdline'
        use 'hrsh7th/cmp-git'
        use 'hrsh7th/nvim-cmp'
        use 'SirVer/ultisnips'
        use 'quangnguyen30192/cmp-nvim-ultisnips'
        use 'honza/vim-snippets'
        use 'ray-x/lsp_signature.nvim'
        use 'onsails/lspkind.nvim'
        use 'jparise/vim-graphql'
        use 'folke/neodev.nvim'

        --treesitter
        use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }

        --diagnostic interface
        use {
                "folke/trouble.nvim",
                requires = "kyazdani42/nvim-web-devicons",
                config = function()
                        require("trouble").setup {}
                end
        }

        --themes
        use 'arcticicestudio/nord-vim'
        use { 'kaicataldo/material.vim', branch = 'main' }
        use 'sainnhe/everforest'
        use 'sainnhe/gruvbox-material'
        use { 'sonph/onehalf', rtp = 'vim' }
        use 'EdenEast/nightfox.nvim'
        use 'humanoid-colors/vim-humanoid-colorscheme'
        use 'hzchirs/vim-material'
        use 'ayu-theme/ayu-vim'
        use 'katawful/kat.nvim'
        use 'dracula/vim'
        use 'ghifarit53/tokyonight-vim'
        use { 'srcery-colors/srcery-vim', as = 'srcery' }

        --icons
        use 'kyazdani42/nvim-web-devicons'

        --statusline
        use {
                'nvim-lualine/lualine.nvim',
                requires = { 'kyazdani42/nvim-web-devicons', opt = true }
        }

        --floating terminal
        use 'voldikss/vim-floaterm'

        --file tree
        use { 'nvim-telescope/telescope-file-browser.nvim' }
        use {
                'nvim-tree/nvim-tree.lua',
                requires = {
                        'nvim-tree/nvim-web-devicons', -- optional, for file icons
                },
                tag = 'nightly' -- optional, updated every week. (see issue #1193)
        }

        -- edit directory as buffer
        use 'elihunter173/dirbuf.nvim'

        --symbol outline
        use 'stevearc/aerial.nvim'

        --marks
        use 'ThePrimeagen/harpoon'

        --comment toggle
        use 'tpope/vim-commentary'

        --search and replace
        use 'tpope/vim-abolish'

        --git
        use 'airblade/vim-gitgutter' --git status in gutter
        use 'APZelos/blamer.nvim'
        use 'tpope/vim-fugitive'
        use 'junegunn/gv.vim'

        --fuzzy finder
        use {
                'junegunn/fzf',
                requires = {
                        'junegunn/fzf.vim',
                },
                run = '{ -> fzf#install() }',
        }

        --telescope
        use {
                'nvim-telescope/telescope.nvim',
                tag = '0.1.0',
                requires = { { 'nvim-lua/plenary.nvim' } }
        }
        use { 'nvim-telescope/telescope-fzf-native.nvim', run = 'make' }

        --motions
        use 'ggandor/leap.nvim'
        -- use 'ggandor/leap-spooky.nvim'

        --shortcuts
        use 'tpope/vim-unimpaired'

        --multicursor
        use { 'mg979/vim-visual-multi', branch = 'master' }

        --repeat plugin commands with . in addition to native ones
        use 'tpope/vim-repeat'

        --filesystem commands
        use 'tpope/vim-eunuch'

        --refactor wrapping characters/tags
        use 'tpope/vim-surround'

        --auto-close brackets
        use 'jiangmiao/auto-pairs'

        --detect buffer options
        use 'tpope/vim-sleuth'

        --debugger
        use 'mfussenegger/nvim-dap'
        use 'Pocco81/DAPInstall.nvim'
        use 'rcarriga/nvim-dap-ui'
        use 'theHamsta/nvim-dap-virtual-text'

        --testing
        use 'vim-test/vim-test'
        use {
                'nvim-neotest/neotest',
                requires = {
                        'nvim-lua/plenary.nvim',
                        'nvim-neotest/neotest-plenary',
                        'nvim-treesitter/nvim-treesitter',
                        'antoinemadec/FixCursorHold.nvim',
                        'nvim-neotest/neotest-vim-test',
                        'haydenmeade/neotest-jest',
                        'rouge8/neotest-rust',
                }
        }

        --documentation
        use {
                'kkoomen/vim-doge',
                run = ':call doge#install()'
        }

        --database:
        -- use 'tpope/vim-dadbod'
end)
