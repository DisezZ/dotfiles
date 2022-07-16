vim.cmd "packadd packer.nvim"

local plugins = {

  ["wbthomason/packer.nvim"] = {
    opt = false,
  },

  ["nvim-lua/plenary.nvim"] = { module = "plenary" },
  ["nvim-lua/popup.nvim"] = {},

  -- colorschemes

  ["catppuccin/nvim"] = {
    as = "catppuccin",
    config = function ()
      require "plugins.configs.catppuccin"
    end
  },

  ["navarasu/onedark.nvim"] = {
    config = function ()
      require "plugins.configs.onedark"
    end
  },

  ["kyazdani42/nvim-web-devicons"] = {
    module = "nvim-web-devicons",
    config = function ()
      require "plugins.configs.devicons"
    end,
  },

  ["folke/which-key.nvim"] = {
    disable = true,
    module = "which-key",
    config = function()
       require "plugins.configs.whichkey"
    end,
  },

  -- treesitter stuff

  ["nvim-treesitter/nvim-treesitter"] = {
    module = "nvim-treesitter",
    setup = function()
       require("core.lazy-load").on_file_open "nvim-treesitter"
    end,
    cmd = require("core.lazy-load").treesitter_cmds,
    run = ":TSUpdate",
    config = function()
       require "plugins.configs.treesitter"
    end,
  },

  -- git stuff

  ["lewis6991/gitsigns.nvim"] = {
    ft = "gitcommit",
    setup = function()
       require("core.lazy-load").gitsigns()
    end,
    config = function()
       require("plugins.configs.gitsigns")
    end,
 },

  -- lsp stuff

  ["williamboman/nvim-lsp-installer"] = {
    opt = true,
    cmd = require("core.lazy-load").lsp_cmds,
    setup = function()
      require("core.lazy-load").on_file_open "nvim-lsp-installer"
    end,
  },

  ["neovim/nvim-lspconfig"] = {
    after = "nvim-lsp-installer",
    module = "lspconfig",
    --event = "VimEnter",
    config = function()
      require "plugins.configs.lsp-installer"
      require "plugins.configs.lspconfig"
    end,
  },

  ["onsails/lspkind.nvim"] = {
  },

 -- load luasnips + cmp related in insert mode only

  ["rafamadriz/friendly-snippets"] = {
    module = "cmp_nvim_lsp",
    event = "InsertEnter",
  },

  ["hrsh7th/nvim-cmp"] = {
    after = "friendly-snippets",
    config = function()
      require "plugins.configs.cmp"
    end,
  },

  ["L3MON4D3/LuaSnip"] = {
    wants = "friendly-snippets",
    after = "nvim-cmp",
    config = function()
      require("plugins.configs.others").luasnip()
    end,
  },

  ["saadparwaiz1/cmp_luasnip"] = {
    after = "LuaSnip",
  },

  ["hrsh7th/cmp-nvim-lua"] = {
    after = "cmp_luasnip",
  },

  ["hrsh7th/cmp-nvim-lsp"] = {
    after = "cmp-nvim-lua",
  },

  ["hrsh7th/cmp-buffer"] = {
    after = "cmp-nvim-lsp",
  },

  ["hrsh7th/cmp-path"] = {
    after = "cmp-buffer",
  },

  -- misc

  ["windwp/nvim-autopairs"] = {
    after = "nvim-cmp",
    config = function()
       require("plugins.configs.autopairs")
    end,
  },

  ["lukas-reineke/indent-blankline.nvim"] = {
    config = function ()
      require "plugins.configs.indent-blankline"
    end
  },

  -- file manager, picker
  ["kyazdani42/nvim-tree.lua"] = {
    --ft = "alpha",
    cmd = { "NvimTreeToggle", "NvimTreeFocus" },
    config = function()
      require "plugins.configs.nvim-tree"
    end,
  },

  ["nvim-telescope/telescope.nvim"] = {
    cmd = "Telescope",
    config = function()
      require "plugins.configs.telescope"
    end,
  },

  -- status line
  ["nvim-lualine/lualine.nvim"] = {
    requires = { 'kyazdani42/nvim-web-devicons', opt = true },
    config = function ()
      require "plugins.configs.lualine"
    end
  },

  -- buffer-line, tab-page, window
  ["akinsho/bufferline.nvim"] = {
    config = function ()
      require "plugins.configs.bufferline"
    end
  },

  ["akinsho/toggleterm.nvim"] = {
    config = function ()
      require "plugins.configs.toggleterm"
    end
  },
}

require("core.packer").run(plugins)
