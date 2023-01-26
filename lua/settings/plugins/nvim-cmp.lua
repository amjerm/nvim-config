vim.o.completeopt = 'menu'

-- Set up nvim-cmp.
local cmp = require 'cmp'

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
                                kind.menu = '    (' .. strings[2] .. ')'

                                return kind
                        end,
                },
                view = {
                        entries = { name = 'custom', selection_order = 'near_cursor' }
                },
                snippet = {
                        expand = function(args)
                                -- vim.fn['UltiSnips#Anon'](args.body)
                                require('luasnip').lsp_expand(args.body)
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
                        { name = 'nvim_lsp' },
                        { name = 'lsp_signature' },
                        -- { name = 'ultisnips' },
                        { name = 'luasnip' },
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

        -- Set up lspconfig.
        local capabilities = require('cmp_nvim_lsp').default_capabilities(vim.lsp.protocol.make_client_capabilities())
        local lsp_cmp_attach = function(client, buf)
                vim.api.nvim_buf_set_option(buf, 'formatexpr', 'v:lua.vim.lsp.formatexpr()')
                vim.api.nvim_buf_set_option(buf, 'omnifunc', 'v:lua.vim.lsp.omnifunc')
                vim.api.nvim_buf_set_option(buf, 'tagfunc', 'v:lua.vim.lsp.tagfunc')
        end

        require('lspconfig')['tsserver'].setup {
                capabilities = capabilities,
                on_attach = lsp_cmp_attach
        }
        require('lspconfig')['intelephense'].setup {
                capabilities = capabilities,
                on_attach = lsp_cmp_attach
        }
        require('lspconfig')['rust_analyzer'].setup {
                capabilities = capabilities,
                on_attach = lsp_cmp_attach,
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
end
