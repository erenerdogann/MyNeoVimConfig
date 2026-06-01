return {
    "nvim-lualine/lualine.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
        require("lualine").setup({
            options = {
                theme = "auto",      -- Automatically matches your current Neovim colorscheme
                globalstatus = true, -- Uses one status line at the bottom instead of one per window
            }
        })
    end
}
