return {
  {
    "folke/tokyonight.nvim",
    lazy = false,
    priority = 1000,
    config = function()
      require("tokyonight").setup({
        style = "night", -- Choose between 'storm', 'night', or 'moon'
        transparent = true, -- Crucial: Keeps your WezTerm frosted glass visible
        styles = {
          sidebars = "transparent",
          floats = "transparent",
        }
      })
      vim.cmd.colorscheme("tokyonight")
    end,
  },
}
