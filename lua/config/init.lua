-- Basic Neovim settings
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.hlsearch = true
vim.opt.wrap = false
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true
vim.opt.termguicolors = true

-- Ensure lazy.nvim is available
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

-- Load plugin manager and plugins
require("config.lazy")

-- Load other configurations
require("config.cmp")
require("config.lsp")
require("config.telescope")
require("config.statusline")
require("config.gitsigns")

-- Load VSCode-specific configuration if present
local ok, _ = pcall(require, "config.vscode")
if not ok and vim.g.vscode then
  vim.notify("VSCode configuration file not found but VSCode is active", vim.log.levels.WARN)
end

-- Set colorscheme
vim.cmd("colorscheme monokai") 