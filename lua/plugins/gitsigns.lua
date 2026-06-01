return {
    "lewis6991/gitsigns.nvim",
    event = { "BufReadPre", "BufNewFile" }, -- Loads only when you open a file
    config = function()
        require("gitsigns").setup({
            -- These are the visual markers that will appear in the gutter
            signs = {
                add          = { text = '│' },
                change       = { text = '│' },
                delete       = { text = '_' },
                topdelete    = { text = '‾' },
                changedelete = { text = '~' },
                untracked    = { text = '┆' },
            },

            -- Setting up specific keymaps only for files where gitsigns is active
            on_attach = function(bufnr)
                local gs = package.loaded.gitsigns

                local function map(mode, l, r, opts)
                    opts = opts or {}
                    opts.buffer = bufnr
                    vim.keymap.set(mode, l, r, opts)
                end

                -- Jump between changes in the current file
                map('n', ']c', function()
                    if vim.wo.diff then return ']c' end
                    vim.schedule(function() gs.next_hunk() end)
                    return '<Ignore>'
                end, { expr = true, desc = "Next git hunk" })

                map('n', '[c', function()
                    if vim.wo.diff then return '[c' end
                    vim.schedule(function() gs.prev_hunk() end)
                    return '<Ignore>'
                end, { expr = true, desc = "Previous git hunk" })

                -- Actions: Preview what changed, or see who wrote the line
                map('n', '<leader>gp', gs.preview_hunk, { desc = "Preview git hunk" })
                map('n', '<leader>gb', function() gs.blame_line { full = true } end, { desc = "Git blame line" })
            end
        })
    end
}
