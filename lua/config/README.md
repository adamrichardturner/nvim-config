# Neovim Config for TypeScript + AI (Claude via Avante)

This repository contains my custom Neovim configuration optimized for TypeScript development with AI-powered assistance. It integrates LSP, Treesitter, autocompletion, lazy-loading plugins, and advanced AI features via [Avante.nvim](https://github.com/yetone/avante.nvim) using Claude 3.7 Sonnet.

---

## Features

- **Theme & UI:**
  - [Monokai](https://github.com/tanvirtin/monokai.nvim) colorscheme with custom highlights
  - File explorer via [NvimTree](https://github.com/nvim-tree/nvim-tree.lua)
  - Status bar with [Lualine](https://github.com/nvim-lualine/lualine.nvim)
  - Git integration with [Gitsigns](https://github.com/lewis6991/gitsigns.nvim)
  - Fuzzy searching via [Telescope](https://github.com/nvim-telescope/telescope.nvim)

- **Development Tools:**
  - LSP using [nvim-lspconfig](https://github.com/neovim/nvim-lspconfig)
  - TypeScript support with [typescript-tools.nvim](https://github.com/pmizio/typescript-tools.nvim)
  - Auto-formatting with [none-ls.nvim](https://github.com/nvimtools/none-ls.nvim)
  - Autocompletion with [nvim-cmp](https://github.com/hrsh7th/nvim-cmp) and [LuaSnip](https://github.com/L3MON4D3/LuaSnip)

- **AI Assistance:**
  - [Avante.nvim](https://github.com/yetone/avante.nvim) configured for Claude 3.7 Sonnet
  - Inline code suggestions, interactive chat, and visual edits
  - RAG (Retrieval-Augmented Generation) for codebase indexing
  - Additional support for image pasting, markdown rendering, and file selectors

---

## Installation

1. **Clone this Repository:**

   ```bash
   git clone git@github.com:<your-username>/nvim-config.git ~/.config/nvim
   ```

2. **Set Your API Key:**

   Avante uses Anthropic's Claude API. Add your API key to your shell configuration (e.g., in ~/.zshrc or ~/.bashrc):

   ```bash
   export ANTHROPIC_API_KEY="sk-ant-..."
   source ~/.zshrc   # or source ~/.bashrc
   ```

3. **Install Plugins:**

   Open Neovim and run:

   ```vim
   :Lazy sync
   ```

4. **Build Avante.nvim:**

   Ensure Avante is built by running:

   ```vim
   :Lazy build avante.nvim
   ```

## Configuration Overview

The configuration is managed with lazy.nvim and is stored in ~/.config/nvim/lua/config. Key configuration files include:

- **lazy.lua** — Bootstrap and setup for lazy.nvim plugin manager
- **plugins.lua** — Plugin declarations, including the Avante configuration
- **lsp.lua** — Language Server Protocol settings with TypeScript support
- **cmp.lua** — Autocompletion configuration
- **formatter.lua** — Code formatting with null-ls
- **telescope.lua** — Fuzzy finder configuration
- **gitsigns.lua** — Git decoration in the gutter
- **statusline.lua** — Lualine status bar setup
- **highlights.lua** — Custom highlight group overrides for Monokai theme

### Avante.nvim Configuration

```lua
-- Avante AI (Claude 3.7 Sonnet)
{
  "yetone/avante.nvim",
  event = "VeryLazy",
  version = false, -- Never set this value to "*"! Never!
  opts = {
    provider = "claude",
    claude = {
      model = "claude-3-7-sonnet-latest",
      timeout = 30000,
      temperature = 0.5,
    },
    behaviour = {
      enable_claude_text_editor_tool_mode = true,
    },
    rag = {
      enabled = true,
      use_native = true,
      chunk_size = 512,
      recursive = true,
      exclude_files = {
        "node_modules/**",
        ".git/**",
        "dist/**",
        "build/**",
      },
    },
    ui = {
      window = {
        relative = "editor",
        width = 0.7,
        height = 0.8,
        row = 0.1,
        col = 0.15,
        border = "rounded",
        win_options = {
          winblend = 0,
        },
      },
    },
  },
  build = "make",
  dependencies = {
    -- Various UI and utility dependencies
    "nvim-treesitter/nvim-treesitter",
    "stevearc/dressing.nvim",
    "nvim-lua/plenary.nvim",
    "MunifTanjim/nui.nvim",
    "echasnovski/mini.pick",
    "nvim-telescope/telescope.nvim",
    "hrsh7th/nvim-cmp",
    "ibhagwan/fzf-lua",
    "nvim-tree/nvim-web-devicons",
    "zbirenbaum/copilot.lua",
    -- Image clip support
    {
      "HakonHarnes/img-clip.nvim",
      event = "VeryLazy",
      opts = {
        default = {
          embed_image_as_base64 = false,
          prompt_for_file_name = false,
          drag_and_drop = {
            insert_mode = true,
          },
          use_absolute_path = true,
        },
      },
    },
    -- Markdown rendering
    {
      "MeanderingProgrammer/render-markdown.nvim",
      opts = {
        file_types = { "markdown", "Avante" },
      },
      ft = { "markdown", "Avante" },
    },
  },
}
```

## Usage

- **File Explorer**: Toggle with `:NvimTreeToggle`
- **Telescope**: Use `:Telescope find_files`, `:Telescope live_grep`, `:Telescope buffers`, and `:Telescope help_tags`
- **LSP**: Automatic TypeScript support with hover information and completions
- **Formatting**: Automatic formatting on save for TypeScript files
- **Git**: Inline git blame and status indicators

### AI Features (Avante.nvim)

- **AI Chat**: Run `:AvanteToggle` to open the Claude chat panel
- **Code Context**: Use `@codebase` in your prompts to include information about your entire codebase
- **Visual Edit**: Select code in visual mode and run `:AvanteEdit <your prompt>` (e.g., `:AvanteEdit Refactor this function`)

## Troubleshooting

- **API Key**: Ensure that `ANTHROPIC_API_KEY` is set correctly in your shell
- **Plugin Sync**: Run `:Lazy sync` to update/install plugins after configuration changes
- **Build Errors**: If you encounter build errors with avante.nvim, try:
  ```bash
  rm -rf ~/.local/share/nvim/lazy/avante.nvim
  # Then in Neovim
  :Lazy sync
  ```
- **Window Errors**: If you encounter window ID errors with avante.nvim, restart Neovim completely

## References

- [Avante.nvim GitHub Repository](https://github.com/yetone/avante.nvim)
- [Anthropic Claude API Documentation](https://docs.anthropic.com/en/docs/about-claude/models/all-models)
- [lazy.nvim Documentation](https://github.com/folke/lazy.nvim)
- [Neovim Documentation](https://neovim.io/doc/)

## License

This configuration is released under the MIT License. 