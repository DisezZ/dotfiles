local M = {}
local api = vim.api

local merge_tb = vim.tbl_deep_extend

M.load_config = function ()
  local config = require "core.default-config"

  config.mappings.disabled = nil
  return config
end

M.load_mappings = function (mappings, mapping_opt)
  local map_func
  local whichkey_exists, wk = pcall(require, "which-key")

  if whichkey_exists then
    map_func = function (keybind, mapping_info, opts)
      wk.register({ [keybind] = mapping_info, opts })
    end
  else
    map_func = function (keybind, mapping_info, opts)
      local mode = opts.mode
      opts.mode = nil
      vim.keymap.set(mode, keybind, mapping_info[1], opts)
    end
  end

  mappings = mappings or vim.deepcopy(M.load_config().mappings)
  mappings.lspconfig = nil

  for _, section_mappings in pairs(mappings) do
    for mode, mode_mappings in pairs(section_mappings) do
       for keybind, mapping_info in pairs(mode_mappings) do
          local default_opts = merge_tb("force", { mode = mode }, mapping_opt or {})
          local opts = merge_tb("force", default_opts, mapping_info.opts or {})

          if mapping_info.opts then
             mapping_info.opts = nil
          end

          map_func(keybind, mapping_info, opts)
       end
    end
 end
end

M.merge_plugins = function(default_plugins)
  local user_plugins = M.load_config().plugins.user

  -- merge default + user plugin table
  default_plugins = merge_tb("force", default_plugins, user_plugins)

  local final_table = {}

  for key, _ in pairs(default_plugins) do
     default_plugins[key][1] = key

     final_table[#final_table + 1] = default_plugins[key]
  end

  return final_table
end

M.load_override = function(default_table, plugin_name)
  local user_table = M.load_config().plugins.override[plugin_name] or {}
  user_table = type(user_table) == "table" and user_table or user_table()
  return merge_tb("force", default_table, user_table)
end

M.packer_sync = function (...)
  local packer_exists, packer = pcall(require, "packer")

  if packer_exists then
    packer.sync(...)
  else
    error "Packer could not be loaded!"
  end
end

return M