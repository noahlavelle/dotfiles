local base16 = require('base16')
local config = require('config')

local export = {}

-- Define bg color
local function bg(group, color)
   vim.cmd('hi ' .. group .. ' guibg=' .. color)
end

-- Define fg color
local function fg(group, color)
   vim.cmd('hi ' .. group .. ' guifg=' .. color)
end

-- Define bg and fg color
local function fg_bg(group, fgcol, bgcol)
   vim.cmd('hi ' .. group .. ' guifg=' .. fgcol .. ' guibg=' .. bgcol)
end

-- Setup highlights
local function highlight(colors)
    -- Used for highlighting current line number
    vim.opt.cursorline = true

    -- Comments
    fg('Comment', colors.grey_fg .. ' gui=italic')

    -- Disable cusror line
    vim.cmd 'hi clear CursorLine'

    -- Line number
    fg('cursorlinenr', colors.white)

    -- For floating windows
    fg('FloatBorder', colors.blue)
    bg('NormalFloat', colors.one_bg)

    -- Popup menu
    bg('Pmenu',      colors.one_bg)
    bg('PmenuSbar',  colors.one_bg2)
    bg('PmenuSel',   colors.pmenu_bg)
    bg('PmenuThumb', colors.nord_blue)

    -- Highlight trailing whitespace
    bg('ExtraWhitespace', colors.red)

    -- Make errors stand out more
    fg('NvimInternalError', colors.red)

    -- inactive statuslines as thin splitlines
    fg('StatusLineNC', colors.one_bg2 .. ' gui=underline')
    fg('VertSplit',    colors.one_bg2)

    if config.no_background then
        bg('Normal',  'NONE')
        bg('Folded',  'NONE')
        fg('Folded',  'NONE')
        fg('Comment',  colors.grey)
    end
end

-- Set the theme from the value from the config file
export.set_theme = function()
    base16(base16.themes(config.colorscheme), true)
    highlight(export.get_hl_scheme())
end

-- Get the highlight colors
export.get_hl_scheme = function()
    return require('hl_themes.' .. config.colorscheme)
end

return export

