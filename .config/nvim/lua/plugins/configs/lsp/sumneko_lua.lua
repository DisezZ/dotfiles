local options = {
  settings = {
    Lua = {
       diagnostics = {
          globals = { "vim", "awesome" },
       },
       workspace = {
          library = {
             [vim.fn.expand "$VIMRUNTIME/lua"] = true,
             --[vim.fn.stdpath("config") .. "/lua"] = true,
          },
          maxPreload = 100000,
          preloadFileSize = 10000,
       },
    }
  }
}

return options
