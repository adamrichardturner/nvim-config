require("gitsigns").setup({
  signs = {
    add = { text = "+" },
    change = { text = "~" },
    delete = { text = "_" },
  },
  current_line_blame = true, -- Shows who last edited each line
})

