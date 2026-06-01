return {
    "windwp/nvim-autopairs",
    event = "InsertEnter", -- Loads only when you start typing to save startup time
    config = function()
        require("nvim-autopairs").setup({
            check_ts = true, -- Integrates with Treesitter so it doesn't auto-pair in weird spots (like inside comments)
        })
    end
}
