require('bufferline').setup({
        options = {
                numbers = function(opts)
                        return string.format('%s', opts.id)
                end,
                show_buffer_close_icons = false,
                separator_style = "slant",
                diagnostics = "coc",
        }
})
