local nvimtree = require('nvim-tree')

nvimtree.setup {
    disable_netrw = true,
    hijack_netrw = true,
    renderer = {
        icons = {
            glyphs = {
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
            },
        },
    },
}

