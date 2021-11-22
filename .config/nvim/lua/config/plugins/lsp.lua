-- Configuration for lsp plugins
local lspconfig = require('lspconfig')
local mappings = require('config.mappings')

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.documentationFormat = { 'markdown', 'plaintext' }
capabilities.textDocument.completion.completionItem.snippetSupport = true
capabilities.textDocument.completion.completionItem.preselectSupport = true
capabilities.textDocument.completion.completionItem.insertReplaceSupport = true
capabilities.textDocument.completion.completionItem.labelDetailsSupport = true
capabilities.textDocument.completion.completionItem.deprecatedSupport = true
capabilities.textDocument.completion.completionItem.commitCharactersSupport = true
capabilities.textDocument.completion.completionItem.tagSupport = { valueSet = { 1 } }
capabilities.textDocument.completion.completionItem.resolveSupport = {
    properties = {
        'documentation',
        'detail',
        'additionalTextEdits',
    },
}

-- replace the default lsp diagnostic symbols
local function lspSymbol(name, icon)
   vim.fn.sign_define('LspDiagnosticsSign' .. name, { text = icon, numhl = 'LspDiagnosticsDefault' .. name })
end

lspSymbol('Error', '')
lspSymbol('Information', '')
lspSymbol('Hint', '')
lspSymbol('Warning', '')

-- Servers to enable
local servers = { 'tsserver', 'intelephense', 'perlpls' }

local function on_attach(_, buf)
    vim.api.nvim_buf_set_option(buf, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

    for mode, mappings in pairs(mappings.lsp) do
        for from, to in pairs(mappings) do
            vim.api.nvim_buf_set_keymap(buf, mode, from, to, { noremap = true, silent = true })
        end
    end
end

for _, server in ipairs(servers) do
    lspconfig[server].setup {
        capabilities = capabilities,
        on_attach = on_attach,
    }
end

