local config = {}

colorcolumn_values = {};

-- Set the colorscheme
config.colorscheme = 'nord'

-- Set the leader to space
config.mapleader = ' '

-- Highlight trailing whitespace
config.show_extra_whitespace = true

config.options = {
    -- Set terminal title
    title = true,

    -- Set color column
    colorcolumn = '+1',

    -- Don't highlight match after search is finished
    hlsearch = false,

    -- Use smartcase
    ignorecase = true,
    smartcase = true,

    -- Auto indent lines
    autoindent = true,

    -- Split sensibly
    splitright = true,
    splitbelow = true,

    -- Use relative numbers
    number = true,
    relativenumber = true,

    -- Don't show mode (status bar will do that)
    showmode = false,

    -- Allow buffer change before writing
    hidden = true,

    -- Allow the mouse
    mouse = 'a',

    -- Truecolor support
    termguicolors = true,

    -- Use 4 spaces for indentation
    expandtab = true,
    tabstop = 4,
    shiftwidth = 0,

    -- Disable ~ at the end of the buffer
    fillchars = { eob = ' ' },

    -- Show the sign column
    signcolumn = 'yes',

    -- Better completion
    completeopt = 'menuone,noselect',
    
}

-- Load mappings
config.mappings = require('config.mappings')

-- Hide opening text
vim.o.shortmess = vim.o.shortmess .. 'sI'

-- Associate tt files with template toolkit
vim.cmd [[ autocmd BufNewFile,BufRead *.tt setf tt2 ]]

vim.api.nvim_create_autocmd({'BufEnter', 'BufWinEnter'}, {
    pattern = {'*(?!.php)'},
    command = 'set textwidth=80',
})

return config

