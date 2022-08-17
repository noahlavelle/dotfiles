local gitsigns = require('gitsigns')
local util = require('core.util')
local mappings = require('config.mappings')

gitsigns.setup {
    current_line_blame_opts = {
        delay = 100
    },
    on_attach = function(bufnr)
        -- TODO: Pass buffer specific map function rather than global map
        mappings.git(bufnr, util.map)
    end
}

