return {
    "nvim-treesitter/nvim-treesitter",
    branch = "master", -- Locks it to the archived, stable branch
    build = ":TSUpdate",
    config = function()
        require("nvim-treesitter.configs").setup({
            -- These are the core parsers Neovim relies on; we can add more later
            ensure_installed = { "c", "lua", "vim", "vimdoc", "query" },

            -- Automatically install missing parsers when opening a new file type
            auto_install = true,

            highlight = {
                enable = true,
                -- Disables the standard vim highlighting to prevent visual conflicts
                additional_vim_regex_highlighting = false,
            },
        })
    end,
}
