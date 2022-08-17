local lualine = require('lualine')
local onedark = require('lualine.themes.onedark')
local config = require('config')
local colors = require('colors').get_hl_scheme()

onedark.normal.c.bg = colors.black
onedark.inactive.c.bg = colors.black

lualine.setup {
    options = {
        section_separators = { left = '', right = '' },
        component_separators = '|',
        theme = onedark,
    },
    sections = {
        lualine_a = {
            { 'mode', separator = { left = '' }, right_padding = 2 },
        },
        lualine_b = { 'filename', 'branch' },
        lualine_c = { 'diff' },
        lualine_x = { 'diagnostics' },
        lualine_y = { 'filetype', 'progress' },
        lualine_z = {
            { 'location', separator = { right = '' }, left_padding = 2 },
        },
    },
    inactive_sections = {
        lualine_a = {
            { 'filename', separator = { left = '', right = '' }, right_padding = 2 },
        },
        lualine_b = {},
        lualine_c = { 'diff' },
        lualine_x = {},
        lualine_y = {},
        lualine_z = {
            { 'location', separator = { right = '', left = '', left_padding = 2, } }
        },
    },
}

