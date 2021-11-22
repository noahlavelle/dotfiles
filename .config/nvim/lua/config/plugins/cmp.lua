local cmp = require('cmp')
local cmp_autopairs = require('nvim-autopairs.completion.cmp')

local icons = {
    Text          = "",
    Method        = "",
    Function      = "",
    Constructor   = "",
    Field         = "ﰠ",
    Variable      = "",
    Class         = "ﴯ",
    Interface     = "",
    Module        = "",
    Property      = "ﰠ",
    Unit          = "塞",
    Value         = "",
    Enum          = "",
    Keyword       = "",
    Snippet       = "",
    Color         = "",
    File          = "",
    Reference     = "",
    Folder        = "",
    EnumMember    = "",
    Constant      = "",
    Struct        = "פּ",
    Event         = "",
    Operator      = "",
    TypeParameter = "",
}

cmp.setup {
    snippet = {
        expand = function(args)
            require("luasnip").lsp_expand(args.body)
        end,
    },
    formatting = {
        -- Use icons and display completion source
        format = function(entry, vim_item)
            vim_item.kind = string.format(
                '%s %s',
                icons[vim_item.kind],
                vim_item.kind
            )

            return vim_item
        end,
    },
    mapping = {
        ['<C-d>'] = cmp.mapping.scroll_docs(-4),
        ['<C-f>'] = cmp.mapping.scroll_docs(4),
        ['<C-Space>'] = cmp.mapping.complete(),
        ['<C-e>'] = cmp.mapping.close(),
        ['<CR>'] = cmp.mapping.confirm({ select = true }),
        ['<Tab>'] = function(fallback)
             if cmp.visible() then
                    cmp.select_next_item()
             elseif require('luasnip').expand_or_jumpable() then
                    vim.fn.feedkeys(vim.api.nvim_replace_termcodes('<Plug>luasnip-expand-or-jump', true, true, true), '')
             else
                    fallback()
             end
        end,
        ['<S-Tab>'] = function(fallback)
             if cmp.visible() then
                    cmp.select_prev_item()
             elseif require('luasnip').jumpable(-1) then
                    vim.fn.feedkeys(vim.api.nvim_replace_termcodes('<Plug>luasnip-jump-prev', true, true, true), '')
             else
                    fallback()
             end
        end,
    },
    sources = {
        { name = 'luasnip' },
        { name = 'nvim_lsp' },
        { name = 'nvim_lua' },
        { name = 'buffer' },
        { name = 'path' },
    },
}

cmp.event:on( 'confirm_done', cmp_autopairs.on_confirm_done())

