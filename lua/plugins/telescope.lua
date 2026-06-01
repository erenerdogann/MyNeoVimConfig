return {
    "nvim-telescope/telescope.nvim",
    branch = "0.1.x", -- We stick to the stable branch
    dependencies = {
        "nvim-lua/plenary.nvim"
    },
    config = function()
        local builtin = require("telescope.builtin")

        -- Your keybindings
        vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = 'Telescope find files' })
        vim.keymap.set('n', '<leader>fg', builtin.live_grep, { desc = 'Telescope live grep' })
        vim.keymap.set('n', '<leader>fb', builtin.buffers, { desc = 'Telescope buffers' })
        vim.keymap.set('n', '<leader>fh', builtin.help_tags, { desc = 'Telescope help tags' })

        require("telescope").setup({
            defaults = {
                -- We can customize the look and feel here later,
                -- but the defaults are great out of the box.
                file_ignore_patterns = { "node_modules", ".git/" },
            }
        })
    end,
}
