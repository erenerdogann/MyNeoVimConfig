return {
  {
    "stevearc/conform.nvim",
    event = { "BufReadPre", "BufNewFile" },
    config = function()
      local conform = require("conform")

      conform.setup({
        formatters_by_ft = {
          lua = { "stylua" },
          rust = { "rustfmt" },
          json = { "prettierd", "prettier" },
        },
        -- Enable format-on-save
        format_on_save = {
          lsp_fallback = true, -- If a formatter isn't installed, try using the LSP instead
          async = false,
          timeout_ms = 500,
        },
      })
    end,
  },
}
