require "core"
require "core.options"

vim.defer_fn(function ()
  require("core.utils").load_mappings()
end, 0)

require("core.packer").bootstrap()
require "plugins"

--vim.g.catppuccin_flavour = "mocha" -- latte, frappe, macchiato, mocha
--vim.cmd[[colorscheme catppuccin]]

--pcall(require, "custom")
