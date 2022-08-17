local ts_cfg = require('nvim-treesitter.configs')

ts_cfg.setup {
    -- Install required language parsers
    ensure_installed = {
        'css',
        'html',
        'javascript',
        'json',
        'lua',
        'php',
        'regex',
        'typescript',
        'yaml',
    },
    -- Use parser features
    highlight = {
        enable = true,
    },
    indent = {
        enable = true,
    }
}

