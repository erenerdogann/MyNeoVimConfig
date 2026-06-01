return {
    "folke/which-key.nvim",
    event = "VeryLazy",
    init = function()
        vim.o.timeout = true
        vim.o.timeoutlen = 300 -- Milliseconds to wait before the popup appears
    end,
    opts = {
        -- You can leave this empty for default settings, which are fantastic
    }
}
