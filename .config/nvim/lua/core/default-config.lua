local M = {}

M.options = {
  user = function() end,

}

M.ui = {
  hl_add = {},
  hl_override = {},
  changed_themes = {},
  theme_toggle = {"dark", "light"},
  theme = "onedark",
  transparency = false,
  statusline = {
    seperator_style = "default",
    config = "",
    override = {},
  },
  tabufline = {
    enabled = true,
    lazyload = true,
    override = {},
  },
}

M.plugins = {
  override = {},
  remove = {},
  user = {},
  options = {
    lspconfig = {
      setup_lspconfig = "",
    }
  }
}

M.mappings = require "core.mappings"

return M
