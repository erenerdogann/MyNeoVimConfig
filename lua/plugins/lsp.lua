return {
    {
        "neovim/nvim-lspconfig",
        dependencies = {
            "williamboman/mason.nvim",
            "williamboman/mason-lspconfig.nvim",
            "hrsh7th/cmp-nvim-lsp", -- We add the bridge dependency here
        },
        config = function()
            require("mason").setup()

            require("mason-lspconfig").setup({
                ensure_installed = { "lua_ls", "rust_analyzer", "jsonls" }
            })
            -- ==========================================
            -- DIAGNOSTICS: Virtual Text & UI
            -- ==========================================
            vim.diagnostic.config({
                virtual_text = {
                    prefix = '●', -- Adds a nice symbol before the error text
                    source = "if_many", -- Shows which LSP is complaining if you have multiple
                },
                signs = true, -- Keeps the icons in the gutter
                update_in_insert = false, -- Prevents errors from shifting around while you actively type
                underline = true,
                float = {
                    border = "rounded",
                },
            })

            -- ==========================================
            -- THE BRIDGE: Connect LSP to Autocomplete
            -- ==========================================
            local capabilities = vim.lsp.protocol.make_client_capabilities()
            capabilities = require('cmp_nvim_lsp').default_capabilities(capabilities)

            -- ==========================================
            -- THE NEW NEOVIM NATIVE LSP SETUP
            -- ==========================================
            vim.lsp.config("lua_ls", {
                capabilities = capabilities, -- Attach the bridge
                settings = {
                    Lua = {
                        diagnostics = { globals = { "vim" } }
                    }
                }
            })

            vim.lsp.config("rust_analyzer", { capabilities = capabilities })
            vim.lsp.config("jsonls", { capabilities = capabilities })

            vim.lsp.enable("lua_ls")
            vim.lsp.enable("rust_analyzer")
            vim.lsp.enable("jsonls")

            -- Global LSP Shortcuts
            vim.keymap.set('n', 'K', vim.lsp.buf.hover, { desc = "Show documentation popup" })
            vim.keymap.set('n', 'gd', vim.lsp.buf.definition, { desc = "Go to definition" })
            vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, { desc = "See available code actions" })
            vim.keymap.set('n', '<leader>d', vim.diagnostic.open_float, { desc = "Show line error details" })
        end
    }
}
