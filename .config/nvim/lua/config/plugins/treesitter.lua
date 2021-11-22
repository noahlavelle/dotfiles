local ts_cfg = require('nvim-treesitter.configs')

ts_cfg.setup {
    -- Install required language parsers
    ensure_installed = {
        'php',
        'html',
        'css',
        'javascript',
        'typescript',
        'json',
        'regex',
        'yaml',
        'lua',
    },
    -- Use parser features
    highlight = {
        enable = true,
    },
    indent = {
        enable = true,
    }
}

