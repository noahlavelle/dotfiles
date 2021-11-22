local bufferline = require('bufferline')
local colors = require('colors').get_hl_scheme()

bufferline.setup {
    options = {
        show_close_icon = false,
        separator_style = 'thin',
    },
    highlights = {
        fill = {
            guifg = colors.grey_fg,
            guibg = colors.black,
        },
        indicator_selected = {
            guifg = colors.black,
            guibg = colors.black,
        },
        buffer_selected = {
            gui = 'bold',
            guifg = colors.white,
            guibg = colors.black,
        },
        buffer_visible = {
            guifg = colors.light_grey,
            guibg = colors.black2,
        },
        modified = {
            guifg = colors.red,
        },
    },
}

