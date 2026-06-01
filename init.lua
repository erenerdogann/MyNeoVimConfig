-- 1. Bootstrap lazy.nvim (tells Neovim to download the manager if missing)
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable",
        lazypath,
    })
end
vim.opt.rtp:prepend(lazypath)

-- 2. Load your core native configurations
require("core.options")
require("core.keymaps")

-- 3. Initialize lazy.nvim and tell it to look inside the "plugins" folder
require("lazy").setup("plugins")
