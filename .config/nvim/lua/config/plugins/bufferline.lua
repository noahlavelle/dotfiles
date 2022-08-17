local bufferline = require('bufferline')
local colors = require('colors').get_hl_scheme()

bufferline.setup {
    options = {
        show_close_icon = false,
        separator_style = 'thin',
    },
    highlights = {
        fill = {
            fg = colors.grey_fg,
            bg = colors.black,
        },
        indicator_selected = {
            fg = colors.black,
            bg = colors.black,
        },
        buffer_selected = {
            bold = true,
            fg = colors.white,
            bg = colors.black,
        },
        buffer_visible = {
            fg = colors.light_grey,
            bg = colors.black2,
        },
        modified = {
            fg = colors.red,
        },
    },
}

