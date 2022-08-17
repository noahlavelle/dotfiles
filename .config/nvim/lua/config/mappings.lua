local mappings = {
    -- Simple mappings
    -- mode -> { old key sequence -> new key sequence }
    -- All mappings are non recursive
    vim = {
        n = {
            -- [[ Basic mappings ]]
            -- Toggle spell/paste modes
            ['<leader>sp']      = ':set paste!<cr>',
            ['<leader>si']      = ':set spell!<cr>',

            -- Make Y work like it should
            ['Y']               = 'y$',

            -- Buffer switching keybinds
            [')']               = ':bn<cr>',
            ['(']               = ':bp<cr>',
            ['<leader><space>'] = '<C-^>',

            -- Window management
            ['<M-h>']           = '<C-w>h',
            ['<M-j>']           = '<C-w>j',
            ['<M-k>']           = '<C-w>k',
            ['<M-l>']           = '<C-w>l',
            ['<M-q>']           = '<C-w>q',

            -- Jump to start/end of a line
            ['<C-l>']           = '$',
            ['<C-h>']           = '^',

            -- [[ Telescope mappings ]]
            -- Open telescope for different tasks
            ['<C-p>']           = ':Telescope find_files<cr>',
            ['<C-f>']           = ':Telescope live_grep<cr>',
            ['<leader>;']       = ':Telescope buffers<cr>',
            ['<leader>ff']      = ':Telescope git_status<cr>',
            -- TODO Add git/lsp telescope bindings

            -- Resume last picker
            ['gp']              = ':Telescope resume<cr>',
            ['gP']              = ':Telescope pickers<cr>',

            -- Show symbols from treesitter (binding overwritten in lsp buffers)
            ['gs']              = ':Telescope treesitter<cr>',

            -- Open nvimtree
            ['<C-n>']           = ':NvimTreeFocus<cr>',

            -- View current file perldoc
            ['<leader>K']       = ':vsp | enew | setfiletype man | setlocal buftype=nofile bufhidden=delete noswapfile | r!perldoc #<cr>',
        },
        v = {
            -- Stay in visual mode when adjusting indentation
            ['>'] = '>gv',
            ['<'] = '<gv',
        },
        o = {
            -- Jump to start/end of line as operator
            ['<C-l>']           = '$',
            ['<C-h>']           = 'v^',
        },
    },
    -- Mappings for git buffers
    git = function(bufnr, map)
        -- Navigation
        map('n', ']c', "&diff ? ']c' : '<cmd>Gitsigns next_hunk<CR>'", { expr = true })
        map('n', '[c', "&diff ? '[c' : '<cmd>Gitsigns prev_hunk<CR>'", { expr = true })

        -- Text object
        map('o', 'ih', ':<C-U>Gitsigns select_hunk<CR>')
        map('x', 'ih', ':<C-U>Gitsigns select_hunk<CR>')
    end,
    -- Mappings for lsp buffers
    lsp = {
        n = {
            -- Goto definition
            ['gd']         = '<cmd>Telescope lsp_definitions<CR>',
            ['gD']         = '<cmd>lua vim.lsp.buf.declaration()<CR>',
            ['gi']         = '<cmd>lua vim.lsp.buf.implementation()<CR>',
            ['gy']         = '<cmd>lua vim.lsp.buf.type_definition()<CR>',
            -- View references
            ['gr']         = '<cmd>Telescope lsp_references<CR>',
            -- View all symbols
            ['gs']         = '<cmd>Telescope lsp_document_symbols<cr>',
            ['gS']         = '<cmd>Telescope lsp_dynamic_workspace_symbols<cr>',
            -- Jump between diagnostics
            ['[g']         = '<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>',
            [']g']         = '<cmd>lua vim.lsp.diagnostic.goto_next()<CR>',
            -- View docs
            ['K']          = '<cmd>lua vim.lsp.buf.hover()<CR>',
            ['<C-k>']      = '<cmd>lua vim.lsp.buf.signature_help()<CR>',
            -- Workspace management
            ['<leader>wa'] = '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>',
            ['<leader>wr'] = '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>',
            ['<leader>wl'] = '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>',
            -- Refactoring
            ['<leader>rn'] = '<cmd>lua vim.lsp.buf.rename()<CR>',
            ['<leader>ca'] = '<cmd>Telescope lsp_code_actions<CR>',
            -- Show diagnostics
            ['<leader>e']  = '<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>',
            ['<leader>E']  = '<cmd>Telescope lsp_workspace_diagnostics<CR>',
            ['<leader>q']  = '<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>',
        },
        v = {
            ['<leader>ca'] = '<cmd>lua vim.lsp.buf.range_code_action()<CR>',
        },
    },
    -- Mappings for inside the telescope window
    telescope = function()
        local actions = require('telescope.actions')

        return { i = {
            ['<C-j>'] = actions.move_selection_next,
            ['<C-k>'] = actions.move_selection_previous,

            ['<C-s>'] = actions.select_vertical,
            ['<C-l>'] = actions.select_horizontal,
        }}
    end
}

return mappings

