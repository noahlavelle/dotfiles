local export = {}

-- All valid modes allowed for mappings
-- See `:h map-modes`
export.map_modes = {
    [''] = true,
    ['n'] = true,
    ['v'] = true,
    ['s'] = true,
    ['x'] = true,
    ['o'] = true,
    ['!'] = true,
    ['i'] = true,
    ['l'] = true,
    ['c'] = true,
    ['t'] = true,
}

-- Create a mapping
export.map = function(mode, keys, cmd, opt)
    local options = { noremap = true, silent = true }
    if opt then
        options = vim.tbl_extend('force', options, opt)
    end

    if export.map_modes[mode] then
        vim.api.nvim_set_keymap(mode, keys, cmd, options)
    end
end

return export

