local present, devicons = pcall(require, "nvim-web-devicons")
if not present then
  return
end

local options = { override = require("ui.icons").devicons }
--options = require("core.utils").load_override(options, "kyazdani42/nvim-web-devicons")

options = {}
devicons.setup(options)
