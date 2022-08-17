-- Load base options and mappings from config.lua
local config = require('config')
local util = require('core.util')
local o = vim.opt
local g = vim.g

local export = {}

local preload = function()
    -- Prevent netrw from loading
    g['loaded_netrwPlugin'] = 1
end

local load_mappings = function()
    for mode, mappings in pairs(config.mappings.vim) do
        -- Only map modes since other keys may have other meanings
        if util.map_modes[mode] then
            for from, to in pairs(mappings) do
                util.map(mode, from, to)
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

return export

