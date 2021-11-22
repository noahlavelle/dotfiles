local telescope = require('telescope')
local actions = require('telescope.actions')
local mappings = require('config.mappings')

telescope.setup {
    defaults = {
        prompt_prefix = '   ',
        selection_caret = '  ',
        sorting_strategy = 'ascending',
        -- Store picker history
        cache_picker = {
            num_pickers = 100,
        },
        layout_config = {
            horizontal = {
                prompt_position = 'top',
                preview_width = 0.55,
                results_width = 0.8,
            },
            vertical = {
                mirror = false,
            },
            width = 0.87,
            height = 0.80,
            preview_cutoff = 120,
        },
        mappings = mappings.telescope(),
    },
    extensions = {
        fzf = {
            fuzzy = true,
            override_file_sorter = true,
            case_mode = 'smart_case',
        },
    },
}

telescope.load_extension('fzf')

