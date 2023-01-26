require("noice").setup({
        history = {
                view = "notify",
        },
        messages = {
                enabled = true,
        },
        views = {
                cmdline_popup = {
                        position = {
                                row = 5,
                                col = "50%",
                        },
                        -- size = {
                        --         width = 60,
                        --         height = "auto",
                        -- },
                },
        },
        lsp = {
                signature = {
                        enabled = false,
                }
        },
        format = {
                input = {},
        },
})
