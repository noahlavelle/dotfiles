local packer = require('core.packer')
local config = require('config')

packer.startup(function()
    use {
        'wbthomason/packer.nvim',
    }

    use {
        'glacambre/firenvim',
        run = function()
            vim.fn['firenvim#install'](0)
        end
    }

    -- Library for telescope
    use {
        'nvim-lua/plenary.nvim',
    }

    -- Colorscheme provider
    use {
        'nvchad/nvim-base16.lua',
        commit = 'f7528f4f49ddc42ae30b82d289591b965f553a1b',
        config = function()
            require('colors').set_theme()
        end,
    }

    -- Icons for other plugins
    use {
        'kyazdani42/nvim-web-devicons',
        config = function()
            require('nvim-web-devicons').setup{}
        end,
    }

    -- Display language specific matching words (eg. if then do)
    use {
        'andymass/vim-matchup',
        setup = function()
            vim.g.matchup_matchparen_offscreen = {}
        end,
    }

    -- Hightlight colors
    use {
        'norcalli/nvim-colorizer.lua',
        config = function()
            require('colorizer').setup()
        end,
    }

    -- Complementary pairs of mappings
    use {
        'tpope/vim-unimpaired',
    }

    -- Surround keybindings
    use {
        'tpope/vim-surround',
    }

    -- Comment operator
    use {
        'tpope/vim-commentary',
        event = 'BufRead',
    }

    -- Alignment operator
    use {
        'tommcdo/vim-lion',
    }

    -- Treesitter parsing/highlighting
    use {
        'nvim-treesitter/nvim-treesitter',
        event = 'BufRead',
        run = ':TSUpdate',
        config = function()
            require('config.plugins.treesitter')
        end,
    }

    -- Lsp
    use {
        'neovim/nvim-lspconfig',
        config = function()
            require('config.plugins.lsp')
        end,
    }

    use {
        'windwp/nvim-autopairs',
        after = 'nvim-lspconfig',
        config = function()
            require('nvim-autopairs').setup()
        end,
    }

    -- Snippets
    use {
        'rafamadriz/friendly-snippets',
    }

    use {
        'L3MON4D3/LuaSnip',
        wants = "friendly-snippets",
        after = "nvim-cmp",
        config = function()
            local luasnip = require('luasnip')

            luasnip.config.set_config {
                history = true,
                updateevents = 'TextChanged,TextChangedI',
            }

            -- First load loads snippets from runtime path
            local vscode_snippets = require('luasnip.loaders.from_vscode')
            vscode_snippets.load()
            vscode_snippets.load({ paths = ( './snippet' ) })
        end,
    }

    -- Completion
    use {
        'hrsh7th/nvim-cmp',
        after = 'nvim-autopairs',
        requires = {
            'hrsh7th/cmp-nvim-lsp',
            'hrsh7th/cmp-nvim-lua',
            'hrsh7th/cmp-buffer',
            'hrsh7th/cmp-path',
            'saadparwaiz1/cmp_luasnip',
        },
        config = function()
            require('config.plugins.cmp')
        end,
    }

    -- Git signs
    use {
        'lewis6991/gitsigns.nvim',
        config = function()
            require('config.plugins.gitsigns')
        end,
    }

    -- Statusline
    use {
        'hoob3rt/lualine.nvim',
        config = function()
            require('config.plugins.lualine')
        end,
    }

    -- Tabline
    use {
        'akinsho/bufferline.nvim',
        config = function()
            require('config.plugins.bufferline')
        end,
    }

    -- File finder
    use {
        'nvim-telescope/telescope.nvim',
        cmd = 'Telescope',
        requires = {
            {
                "nvim-telescope/telescope-fzf-native.nvim",
                run = "make",
            }
        },
        config = function()
            require('config.plugins.telescope')
        end,
    }

    -- File manager
    use {
        'kyazdani42/nvim-tree.lua',
        config = function()
            require('config.plugins.nvimtree')
        end,
    }
end)

