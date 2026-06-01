local opt = vim.opt

-- Line numbers
opt.number = true          -- Show absolute line number
opt.relativenumber = true  -- Show relative line numbers (essential for fast vim movement)

-- Tabs & Indentation
opt.tabstop = 4            -- 4 spaces for a tab
opt.shiftwidth = 4         -- 4 spaces for indent width
opt.expandtab = true       -- Convert tabs to spaces
opt.autoindent = true      -- Copy indent from current line when starting a new one

-- Search
opt.ignorecase = true      -- Ignore case when searching
opt.smartcase = true       -- ...unless search contains capitals

-- Appearance & Theme preparation
opt.termguicolors = true   -- Enable 24-bit RGB true colors (bypasses terminal colors)
opt.signcolumn = "yes"     -- Always show the sign column (prevents text shifting when LSPs load)

-- System Integration
opt.clipboard:append("unnamedplus") -- Syncs Neovim clipboard with Windows system clipboard
opt.mouse = "a"            -- Enable mouse support (clicking, scrolling, etc.)

