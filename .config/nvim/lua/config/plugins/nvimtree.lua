local nvimtree = require('nvim-tree')

vim.g.nvim_tree_quit_on_open = 1
vim.g.nvim_tree_icons = {
    default = '',
    symlink = '',
    git = {
        deleted = '',
        ignored = '◌',
        renamed = '➜',
        staged = '✓',
        unmerged = '',
        unstaged = '✗',
        untracked = '★',
    },
    folder = {
        arrow_open = '',
        arrow_closed = '',
        default = '',
        empty = '',
        empty_open = '',
        open = '',
        symlink = '',
        symlink_open = '',
    },
}

nvimtree.setup {
    disable_netrw = true,
    hijack_netrw = true,
}

