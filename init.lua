local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  print("Lazy.nvim not found at: " .. lazypath)
  return
end
vim.opt.rtp:prepend(lazypath)

-- Load Plugins
require("lazy").setup("config.plugins")


require("config.lsp")
require("config.cmp")
require("nvim-treesitter.configs").setup({
  ensure_installed = { "typescript", "tsx", "lua", "json" },
  highlight = { enable = true },
})

vim.cmd[[colorscheme monokai]]
vim.o.termguicolors = true
vim.keymap.set("n", "<leader>e", ":NvimTreeToggle<CR>", { noremap = true, silent = true })

-- Automatically show hover after 1s on CursorHold
vim.o.updatetime = 1000 -- 1000 ms of no cursor movement triggers CursorHold

vim.api.nvim_create_autocmd("CursorHold", {
  callback = function()
    vim.lsp.buf.hover()
  end,
})

