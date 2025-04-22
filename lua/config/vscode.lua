-- Configuration for VSCode-Neovim integration
if vim.g.vscode then
  -- Fix for "Buffer with this name already exists" error
  vim.api.nvim_create_autocmd("BufReadCmd", {
    pattern = "*",
    callback = function(event)
      -- Add a unique identifier to buffer names for VSCode integration
      local bufname = vim.api.nvim_buf_get_name(event.buf)
      if bufname and bufname ~= "" then
        -- Only add the unique identifier if buffer doesn't already have one
        if not string.match(bufname, "%%") then
          local unique_id = string.format("%d", math.random(1000000))
          local new_bufname = bufname .. "%" .. unique_id
          
          -- Use pcall to safely attempt to set buffer name
          local success, err = pcall(vim.api.nvim_buf_set_name, event.buf, new_bufname)
          if not success then
            -- If failed, log error but continue
            vim.notify("Failed to set unique buffer name: " .. tostring(err), vim.log.levels.WARN)
          end
        end
      end
      return true
    end,
    desc = "Add unique identifier to buffer names in VSCode",
  })
  
  -- Fix for LSP synchronization issue in VSCode-Neovim
  vim.api.nvim_create_autocmd("LspAttach", {
    callback = function(args)
      local client = vim.lsp.get_client_by_id(args.data.client_id)
      if not client then
        return
      end
      
      -- Disable document sync in VSCode environment to prevent conflicts
      if client.server_capabilities.textDocumentSync then
        client.server_capabilities.textDocumentSync.change = nil
      end
    end,
    desc = "Disable document sync in VSCode environment",
  })
  
  -- Fix for LSP synchronization error with nil prev_line
  local orig_compute_diff = vim.lsp.sync.compute_diff
  vim.lsp.sync.compute_diff = function(before_lines, after_lines, offset_encoding)
    -- Check if inputs are valid
    if not before_lines or not after_lines then
      return { {}, {}, {} }
    end
    
    for i, line in ipairs(before_lines) do
      if line == nil then
        before_lines[i] = ""
      end
    end
    
    for i, line in ipairs(after_lines) do
      if line == nil then
        after_lines[i] = ""
      end
    end
    
    return orig_compute_diff(before_lines, after_lines, offset_encoding)
  end
  
  -- Additional VSCode-specific settings
  vim.g.vscode_sync_ignore_error = true
end 