local capabilities = require("cmp_nvim_lsp").default_capabilities()

require("typescript-tools").setup({
  capabilities = capabilities,
  settings = {
    expose_as_code_action = {
      "fix_all",
      "add_missing_imports",
      "remove_unused",
    },
    tsserver_plugins = {},
    -- ✅ enable hover support
    separate_diagnostic_server = false,
    publish_diagnostic_on = "insert_leave",
    expose_references_command = false,
    complete_function_calls = true,
  },
})

