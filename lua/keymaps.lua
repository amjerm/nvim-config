local defaultOpts = { noremap = true }
local silentOpts = { noremap = true, silent = true }

-- main keys
vim.keymap.set('n', 'gD', ':Trouble lsp_definitions<CR>')

-- CTRL SHORTCUTS
vim.keymap.set('n', '<C-a>', vim.lsp.buf.code_action, defaultOpts)
vim.keymap.set('n', '<C-h>', ':wincmd h<CR>', defaultOpts) -- window nav
vim.keymap.set('n', '<C-j>', ':wincmd j<CR>', defaultOpts) -- window nav
vim.keymap.set('n', '<C-k>', ':wincmd k<CR>', defaultOpts) -- window nav
vim.keymap.set('n', '<C-l>', ':wincmd l<CR>', defaultOpts) -- window nav
vim.keymap.set('n', '<C-i>', ':NvimTreeFindFileToggle<CR>', defaultOpts) -- nvimtree toggle
vim.keymap.set('n', '<C-p>', ':Telescope find_files<CR>', defaultOpts) -- find file
vim.keymap.set('n', '<C-t>', ':FloatermToggle<CR>', defaultOpts)
vim.keymap.set('t', '<C-t>', '<C-\\><C-n>:FloatermToggle<CR>', defaultOpts)

-- other keys
vim.keymap.set('n', '<Esc>', ':noh<CR>', defaultOpts) -- find file

-- code actions - LEADER c
vim.keymap.set('n', '<Leader>ch', vim.lsp.buf.signature_help, defaultOpts)
vim.keymap.set('n', '<Leader>cf', function() vim.lsp.buf.format { async = true } end, defaultOpts)

-- diagnostics - LEADER d
vim.keymap.set('n', '<Leader>dt', ':Trouble<CR>', defaultOpts)
vim.keymap.set('n', '<Leader>dl', vim.diagnostic.setloclist, defaultOpts)
vim.keymap.set('n', '<Leader>dq', vim.diagnostic.setqflist, defaultOpts)
vim.keymap.set('n', '<Leader>dn', vim.diagnostic.goto_next, silentOpts)
vim.keymap.set('n', '<Leader>dN', vim.diagnostic.goto_prev, silentOpts)


-- telescope - LEADER f
local builtin = require('telescope.builtin')
vim.keymap.set('n', '<Leader>ch', builtin.command_history, {})
vim.keymap.set('n', '<Leader>fb', builtin.buffers, {})
vim.keymap.set('n', '<Leader>fc', builtin.git_commits, {})
vim.keymap.set('n', '<Leader>fe', ':Telescope file_browser<CR>', defaultOpts) -- telescope file_browser
vim.keymap.set('n', '<Leader>ff', builtin.find_files, {})
vim.keymap.set('n', '<Leader>fg', builtin.git_status, {})
vim.keymap.set('n', '<Leader>fh', builtin.help_tags, {})
vim.keymap.set('n', '<Leader>fi', builtin.live_grep, {})
vim.keymap.set('n', '<Leader>fj', builtin.jumplist, {})
vim.keymap.set('n', '<Leader>fl', builtin.loclist, {})
vim.keymap.set('n', '<Leader>fm', builtin.marks, {})
vim.keymap.set('n', '<Leader>fn', ':Rg NOCOMMIT<CR>', defaultOpts)
vim.keymap.set('n', '<Leader>fo', builtin.vim_options, {})
vim.keymap.set('n', '<Leader>fr', builtin.registers, {})
vim.keymap.set('n', '<Leader>fs', ':SearchSession<CR>', defaultOpts) -- find file
vim.keymap.set('n', '<Leader>ft', builtin.treesitter, {})

-- git - LEADER g
vim.keymap.set('n', '<Leader>gg', ':GFiles?<CR>', defaultOpts)
vim.keymap.set('n', '<Leader>gb', ':Git blame<CR>', defaultOpts)
vim.keymap.set('n', '<Leader>gi', ':BlamerToggle<CR>', defaultOpts)
vim.keymap.set('n', '<Leader>gd', ':Gvdiffsplit!<CR>', defaultOpts)
vim.keymap.set('n', '<Leader>gf', ':GFiles?<CR>', defaultOpts)
vim.keymap.set('n', '<Leader>ghb', ':BCommits<CR>', defaultOpts)
vim.keymap.set('n', '<Leader>gn', ']c', defaultOpts)
vim.keymap.set('n', '<Leader>gp', '[c', defaultOpts)
vim.keymap.set('n', '<Leader>gtm', ':diffget //3<CR>', defaultOpts)
vim.keymap.set('n', '<Leader>gtt', ':diffget //2<CR>', defaultOpts)

-- marks LEADER m
vim.keymap.set('n', '<Leader>ma', ":lua require('harpoon.mark').add_file()<CR>", defaultOpts)
vim.keymap.set('n', '<Leader>mm', ":lua require('harpoon.ui').toggle_quick_menu()<CR>", defaultOpts)
vim.keymap.set('n', '<Leader>mn', ":lua require('harpoon.ui').nav_next()<CR>", defaultOpts)
vim.keymap.set('n', '<Leader>mp', ":lua require('harpoon.ui').nav_prev()<CR>", defaultOpts)
vim.keymap.set('n', '<Leader>mt', ":Telescope harpoon marks<CR>", defaultOpts)

-- navigation LEADER n
vim.keymap.set('n', '<Leader>n', vim.diagnostic.goto_next, silentOpts)
vim.keymap.set('n', '<Leader>N', vim.diagnostic.goto_prev, silentOpts)

-- symbols - LEADER s
vim.keymap.set('n', '<Leader>s', ':AerialToggle<CR>', defaultOpts)

-- unit tests - LEADER u
vim.keymap.set('n', '<Leader>un', ":lua require('neotest').run.run()<CR>", defaultOpts)
vim.keymap.set('n', '<Leader>uf', ":lua require('neotest').run.run(vim.fn.expand('%'))<CR>", defaultOpts)
vim.keymap.set('n', '<Leader>ud', ":lua require('neotest').run.run({vim.fn.expand('%'), strategy = 'dap'})<CR>",
        defaultOpts)
vim.keymap.set('n', '<Leader>us', ":lua require('neotest').summary.toggle()<CR>", defaultOpts)

-- debugger - LEADER x
vim.keymap.set('n', '<Leader>xx', ":lua require'dap'.run_last()<CR>", defaultOpts)
vim.keymap.set('n', '<leader>xb', ":lua require'dap'.toggle_breakpoint()<CR>", defaultOpts)
vim.keymap.set('n', '<Leader>xc', ":lua require'dap'.continue()<CR>", defaultOpts)
vim.keymap.set('n', '<Leader>xl', ":lua require'dap'.run_last()<CR>", defaultOpts)
vim.keymap.set('n', '<Leader>xr', ":lua require'dap'.repl.open()<CR>", defaultOpts)
vim.keymap.set('n', '<Leader>xsi', ":lua require'dap'.step_into()<CR>", defaultOpts)
vim.keymap.set('n', '<Leader>xsu', ":lua require'dap'.step_out()<CR>", defaultOpts)
vim.keymap.set('n', '<Leader>xsv', ":lua require'dap'.step_over()<CR>", defaultOpts)

-- yank - LEADER y
vim.keymap.set('n', '<Leader>y', ':let @*=fnamemodify(expand("%"), ":~:.") . ":" . line(".")<CR>', defaultOpts)
