return {
  {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-tree/nvim-web-devicons", -- Nerd Font Icons
      "MunifTanjim/nui.nvim",
    },
    config = function()
      require("neo-tree").setup({
        window = {
          width = 30,
        },
      })
      
      -- Set a shortcut to toggle the sidebar open and closed
      -- Pressing Space + e will show/hide your files!
      vim.keymap.set("n", "<leader>e", ":Neotree toggle left<CR>", { desc = "Toggle File Explorer" })
    end,
  },
}
