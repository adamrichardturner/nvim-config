-- Disable italics in both standard and Treesitter highlight groups
local groups = {
  "Comment",
  "Keyword",
  "Function",
  "Type",
  "Statement",
  "Operator",
  "Conditional",
  "Repeat",
  "Identifier",
  "@comment",
  "@keyword",
  "@keyword.return",
  "@keyword.function",
  "@type",
  "@type.builtin",
  "@function",
  "@parameter",
  "@variable",
}

for _, group in ipairs(groups) do
  local ok, hl = pcall(vim.api.nvim_get_hl, 0, { name = group })
  if ok and hl then
    hl.italic = false
    vim.api.nvim_set_hl(0, group, hl)
  else
    vim.api.nvim_set_hl(0, group, { italic = false })
  end
end

-- Override Editor Background Colour
vim.api.nvim_set_hl(0, "Normal", { bg = "#272822" })
vim.api.nvim_set_hl(0, "NormalNC",     { bg = "#272822" })
vim.api.nvim_set_hl(0, "NormalFloat",  { bg = "#272822" })
vim.api.nvim_set_hl(0, "SignColumn",   { bg = "#272822" })
vim.api.nvim_set_hl(0, "VertSplit",    { bg = "#272822" })

