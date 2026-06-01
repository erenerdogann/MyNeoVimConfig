return {
    {
        "hrsh7th/nvim-cmp",
        event = "InsertEnter", -- CRUCIAL: Forces the plugin to wake up the moment you press 'i'
        dependencies = {
            "hrsh7th/cmp-nvim-lsp",
            "hrsh7th/cmp-buffer", -- NEW: Will suggest words that already exist in your file
            "L3MON4D3/LuaSnip",
            "saadparwaiz1/cmp_luasnip",
            "rafamadriz/friendly-snippets",
        },
        config = function()
            local cmp = require("cmp")

            require("luasnip.loaders.from_vscode").lazy_load()

            cmp.setup({
                snippet = {
                    expand = function(args)
                        require("luasnip").lsp_expand(args.body)
                    end,
                },
                formatting = {
                    format = function(entry, vim_item)
                        -- Give each source a clear, clean label
                        vim_item.menu = ({
                            nvim_lsp = "[LSP]",
                            luasnip = "[Snippet]",
                            buffer = "[Text]",
                        })[entry.source.name]
                        return vim_item
                    end,
                },

                mapping = cmp.mapping.preset.insert({
                    ["<C-b>"] = cmp.mapping.scroll_docs(-4),
                    ["<C-f>"] = cmp.mapping.scroll_docs(4),
                    ["<C-Space>"] = cmp.mapping.complete(),            -- Use Ctrl+Space to force the menu open anytime
                    ["<CR>"] = cmp.mapping.confirm({ select = true }), -- Press Enter to choose
                    ["<Tab>"] = cmp.mapping(function(fallback)
                        if cmp.visible() then
                            cmp.select_next_item()
                        else
                            fallback()
                        end
                    end, { "i", "s" }),
                }),
                -- The order here prioritizes smart LSP answers first, then basic text answers
                sources = cmp.config.sources({
                    { name = "nvim-lsp" },
                    { name = "luasnip" },
                    { name = "buffer" }, -- The failsafe text source
                }),
            })
        end,
    },
}
