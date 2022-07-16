local present, treesitter = pcall(require, "nvim-treesitter.configs")

if not present then
   return
end

local options = {

   ensure_installed = {
      "lua",
      "c",
      "cpp",
   },

   highlight = {
      enable = true,
      use_languagetree = true,
   },

   indenting = {
    enable = true,
    disable = {
      "yaml",
    }
   }
}

-- check for any override
options = require("core.utils").load_override(options, "nvim-treesitter/nvim-treesitter")

treesitter.setup(options)