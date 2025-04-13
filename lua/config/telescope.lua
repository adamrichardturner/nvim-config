local telescope = require("telescope")

telescope.setup({
  defaults = {
    layout_strategy = "vertical",
    layout_config = {
      vertical = { width = 0.9 },
    },
  },
})

