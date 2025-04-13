-- init.lua

-- Ensure lazy.nvim is installed
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  print("Lazy.nvim not found at: " .. lazypath)
  return
end
vim.opt.rtp:prepend(lazypath)

-- Load Plugins
require("lazy").setup("config.plugins")

-- Additional Configurations
require("config.gitsigns")
require("config.lsp")
require("config.cmp")
require("config.formatter")
require("config.telescope")

-- Treesitter Configuration
require("nvim-treesitter.configs").setup({
  ensure_installed = { "typescript", "tsx", "lua", "json" },
  highlight = { enable = true },
})

-- Set Colorscheme
vim.cmd[[colorscheme monokai]]

-- Additional Configurations
require("config.highlights")
require("config.statusline")

-- Remove italics globally (for common groups)
vim.api.nvim_set_hl(0, "Comment", { italic = false })
vim.api.nvim_set_hl(0, "Keyword", { italic = false })
vim.api.nvim_set_hl(0, "Function", { italic = false })
vim.api.nvim_set_hl(0, "Type", { italic = false })
vim.api.nvim_set_hl(0, "Statement", { italic = false })

-- Enable true color support
vim.o.termguicolors = true

-- Keybindings
vim.keymap.set("n", "<leader>e", ":NvimTreeToggle<CR>", { noremap = true, silent = true })

-- Automatically show hover after 1s on CursorHold
vim.o.updatetime = 1000 -- 1000 ms of no cursor movement triggers CursorHold

vim.api.nvim_create_autocmd("CursorHold", {
  callback = function()
    vim.lsp.buf.hover()
  end,
})

-- Telescope Keybindings
local builtin = require("telescope.builtin")
vim.keymap.set("n", "<leader>ff", builtin.find_files, {})
vim.keymap.set("n", "<leader>fg", builtin.live_grep, {})
vim.keymap.set("n", "<leader>fb", builtin.buffers, {})
vim.keymap.set("n", "<leader>fh", builtin.help_tags, {})

