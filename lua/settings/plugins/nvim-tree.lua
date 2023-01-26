require('nvim-tree').setup({
        -- needed for dirbuf.nvim
        -- hijack_directories = { enable = false },
        actions = {
                open_file = {
                        quit_on_open = true, -- quit when opening file
                }
        },
        view = {
                float = {
                        enable = true,
                        open_win_config = {
                                width = 100,
                        },
                },
        },
})

vim.g.nvim_tree_git_hl = 1 -- highlight git changed files
vim.g.nvim_tree_highlight_opened_files = 1 -- highlight open files
