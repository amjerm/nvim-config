require 'neotest'.setup {
        adapters = {
                require("neotest-plenary"),
                require("neotest-vim-test")({
                        ignore_file_types = { "python", "vim", "lua", "javascript" },
                }),
                require('neotest-jest')({
                        jestCommand = "npm test --",
                        cwd = function(path)
                                return vim.fn.getcwd()
                        end,
                }),
                -- require("neotest-rust"),
        },
}
