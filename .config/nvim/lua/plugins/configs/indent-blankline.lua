local present, indent_blankline = pcall(require, "wbthomason/packer.nvim")
if not present then
  return
end

local options = {
  buftype_exclude = { "terminal" },
  filetype_exclude = {
    "help",
    "terminal",
    "alpha",
    "packer",
    "lspinfo",
    "TelescopePrompt",
    "TelescopeResults",
    "lsp-installer",
    "",
  },
  char = "▏",
  show_trailing_blankline_indent = false,
  show_first_indent_level = false,
  show_current_context = true,
  show_current_context_start = true,

}

indent_blankline.setup(options)
