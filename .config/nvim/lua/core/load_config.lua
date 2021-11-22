-- Load base options and mappings from config.lua
local config = require('config')
local o = vim.opt
local g = vim.g

local export = {}

-- All valid modes allowed for mappings
-- See `:h map-modes`
local valid_modes = {
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

local preload = function()
    -- Prevent netrw from loading
    g['loaded_netrwPlugin'] = 1
end

local load_mappings = function()
    for mode, mappings in pairs(config.mappings.vim) do
        -- Only map modes since other keys may have other meanings
        if valid_modes[mode] then
            for from, to in pairs(mappings) do
                export.map(mode, from, to)
            end
        end
    end
end

export.load_base = function()
    preload()

    -- Load key-value pairs from config into vim
    for k, v in pairs(config.options) do
        o[k] = v
    end

    -- Set the leader
    g.mapleader = config.mapleader

    -- Show trailing whitespace
    if config.show_extra_whitespace then
        -- Setup temporary highlight so vim will let us create the group
        -- The color will be set with the scheme
        vim.cmd('hi ExtraWhitespace guibg=NONE')
        vim.fn.matchadd('ExtraWhitespace', [[\s\+\%#\@<!$]])
    end

    load_mappings()
end

-- Create a mapping
export.map = function(mode, keys, cmd, opt)
    local options = { noremap = true, silent = true }
    if opt then
        options = vim.tbl_extend('force', options, opt)
    end

    if valid_modes[mode] then
        vim.api.nvim_set_keymap(mode, keys, cmd, options)
    end
end

return export

