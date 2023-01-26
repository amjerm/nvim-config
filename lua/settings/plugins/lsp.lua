vim.o.completeopt = 'menu'

local lspconfig = require('lspconfig')
local cmp = require('cmp')
require('lsp-format').setup {}

local capabilities = require('cmp_nvim_lsp').default_capabilities(vim.lsp.protocol.make_client_capabilities())

local custom_on_attach = function(client, bufnr)
        -- keybinding
        local bufopts = { noremap = true, silent = true, buffer = bufnr }
        -- vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, bufopts)
        vim.keymap.set('n', 'gd', vim.lsp.buf.definition, bufopts)
        vim.keymap.set('n', 'gt', vim.lsp.buf.type_definition, bufopts)
        vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, bufopts)
        vim.keymap.set('n', 'gr', vim.lsp.buf.references, bufopts)
        vim.keymap.set('n', '<C-a>', vim.lsp.buf.code_action, bufopts)
        vim.keymap.set('n', 'K', vim.lsp.buf.hover, bufopts)
        vim.keymap.set('n', '<Leader>ch', vim.lsp.buf.signature_help, bufopts)
        vim.keymap.set('n', '<Leader>cf', function() vim.lsp.buf.format { async = true } end, bufopts)

        -- formatting
        require('lsp-format').on_attach(client)

        -- cmp
        vim.api.nvim_buf_set_option(bufnr, 'formatexpr', 'v:lua.vim.lsp.formatexpr()')
        vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')
        vim.api.nvim_buf_set_option(bufnr, 'tagfunc', 'v:lua.vim.lsp.tagfunc')
end

local servers = { 'tsserver', 'emmet_ls', 'dockerls' }
for _, lsp in ipairs(servers) do
        lspconfig[lsp].setup {
                on_attach = custom_on_attach,
                capabilities = capabilities,
        }
end

lspconfig['rust_analyzer'].setup {
        capabilities = capabilities,
        on_attach = custom_on_attach,
        settings = {
                ["rust-analyzer"] = {
                        imports = {
                                granularity = {
                                        group = "module",
                                },
                                prefix = "self",
                        },
                        cargo = {
                                buildScripts = {
                                        enable = true,
                                },
                        },
                        procMacro = {
                                enable = true
                        },
                }
        }
}

lspconfig.intelephense.setup {
        licenceKey = '00X4DEE3J8RY9D5',
        on_attach = custom_on_attach
}

lspconfig.sumneko_lua.setup {
        on_attach = custom_on_attach,
        settings = {
                Lua = {
                        runtime = {
                                -- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
                                version = 'LuaJIT',
                        },
                        diagnostics = {
                                -- Get the language server to recognize the `vim` global
                                globals = { 'vim' },
                        },
                        workspace = {
                                -- Make the server aware of Neovim runtime files
                                library = vim.api.nvim_get_runtime_file('', true),
                        },
                        -- Do not send telemetry data containing a randomized but unique identifier
                        telemetry = {
                                enable = false,
                        },
                },
        },
}

if cmp
then
        cmp.setup({
                window = {
                        completion = {
                                winhighlight = 'Normal:Pmenu,FloatBorder:Pmenu,Search:None',
                                col_offset = -3,
                                side_padding = 0,
                        },
                },
                formatting = {
                        -- format = require('lspkind').cmp_format({
                        --         mode = 'symbol', -- show only symbol annotations
                        -- })
                        fields = { 'kind', 'abbr', 'menu' },
                        format = function(entry, vim_item)
                                local kind = require('lspkind').cmp_format({ mode = 'symbol_text', maxwidth = 50 })(entry
                                        , vim_item)
                                local strings = vim.split(kind.kind, '%s', { trimempty = true })
                                kind.kind = ' ' .. strings[1] .. ' '
                                if strings[2]
                                then
                                        kind.menu = '    (' .. strings[2] .. ')'
                                end

                                return kind
                        end,
                },
                view = {
                        entries = { name = 'custom', selection_order = 'near_cursor' }
                },
                snippet = {
                        expand = function(args)
                                vim.fn['UltiSnips#Anon'](args.body)
                        end,
                },
                mapping = cmp.mapping.preset.insert({
                        ['<C-b>'] = cmp.mapping.scroll_docs(-4),
                        ['<C-f>'] = cmp.mapping.scroll_docs(4),
                        ['<C-Space>'] = cmp.mapping.complete(),
                        ['<C-e>'] = cmp.mapping.abort(),
                        ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
                }),
                sources = cmp.config.sources({
                        { name = 'ultisnips' },
                        { name = 'nvim_lsp' },
                        { name = 'lsp_signature' },
                        { name = 'path' },
                }, {
                        { name = 'buffer', keyword_length = 3 },
                })
        })

        -- Set configuration for specific filetype.
        cmp.setup.filetype('gitcommit', {
                sources = cmp.config.sources({
                        { name = 'cmp_git' }, -- You can specify the `cmp_git` source if you were installed it.
                }, {
                        { name = 'buffer' },
                })
        })

        -- Use buffer source for `/` and `?` (if you enabled `native_menu`, this won't work anymore).
        cmp.setup.cmdline({ '/', '?' }, {
                mapping = cmp.mapping.preset.cmdline(),
                sources = {
                        { name = 'buffer' }
                }
        })

        -- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
        cmp.setup.cmdline(':', {
                mapping = cmp.mapping.preset.cmdline(),
                sources = cmp.config.sources({
                        { name = 'path' }
                }, {
                        { name = 'cmdline' }
                })
        })
end

-- neoformat
vim.g.neoformat_try_node_exe = 1
vim.cmd [[ autocmd BufWritePre *.{js,jsx,ts,tsx} Neoformat ]]

-- rustfmt on save
vim.cmd [[ autocmd BufWritePre *.{rs,html,php} lua vim.lsp.buf.format() ]]
