local present, lsp_installer = pcall(require, "nvim-lsp-installer")

if not present then
  return
end

local present, lspconfig = pcall(require, "lspconfig")
if not present then
   return
end

local M = {}
local utils = require "core.utils"

require "ui.lsp"

M.on_attach = function(client, bufnr)
   local vim_version = vim.version()

   if vim_version.minor > 7 then
      -- nightly
      client.server_capabilities.documentFormattingProvider = false
      client.server_capabilities.documentRangeFormattingProvider = false
   else
      -- stable
      client.resolved_capabilities.document_formatting = false
      client.resolved_capabilities.document_range_formatting = false
   end

   local lsp_mappings = utils.load_config().mappings.lspconfig
   utils.load_mappings({ lsp_mappings }, { buffer = bufnr })

   -- document highlighting
   if client.server_capabilities.documentHighlightProvider then
      vim.api.nvim_create_augroup("lsp_document_highlight", { clear = true })
      vim.api.nvim_clear_autocmds { buffer = bufnr, group = "lsp_document_highlight" }
      vim.api.nvim_create_autocmd("CursorHold", {
          callback = vim.lsp.buf.document_highlight,
          buffer = bufnr,
          group = "lsp_document_highlight",
          desc = "Document Highlight",
      })
      vim.api.nvim_create_autocmd("CursorMoved", {
          callback = vim.lsp.buf.clear_references,
          buffer = bufnr,
          group = "lsp_document_highlight",
          desc = "Clear All the References",
      })
  end

   --[[if client.server_capabilities.signatureHelpProvider then
      require("nvchad.ui.signature").setup(client)
   end]]
end

local present, cmp_nvim_lsp = pcall(require, "cmp_nvim_lsp")
if not present then
   return
end

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = cmp_nvim_lsp.update_capabilities(capabilities)

lspconfig.util.default_config = vim.tbl_extend(
   "force",
   lspconfig.util.default_config,
   {
      on_attach = M.on_attach
   }
)

for _, server in ipairs(lsp_installer.get_installed_servers()) do
   local options = {}

   if server.name == "sumneko_lua" then
      options = require "plugins.configs.lsp.sumneko_lua"
   end

   lspconfig[server.name].setup(options)
end

--[[local sumneko_options = {
   settings = {
      Lua = {
         diagnostics = {
            globals = { "vim" },
         },
         workspace = {
            library = {
               [vim.fn.expand "$VIMRUNTIME/lua"] = true,
               [vim.fn.expand "$VIMRUNTIME/lua/vim/lsp"] = true,
               [vim.fn.stdpath("config") .. "/lua"] = true,
            },
            maxPreload = 100000,
            preloadFileSize = 10000,
         },
      }
   }
}

for _, server in ipairs(servers) do
   local options = {
      on_attach = M.on_attach,
      capabilities = capabilities,
   }
   
   if server.name == "sumneko_lua" then
      options = vim.tbl_deep_extend("force", sumneko_options, options)
   end

   lspconfig[server].setup(options)
end]]

--[[lspconfig.sumneko_lua.setup {
   on_attach = M.on_attach,
   capabilities = capabilities,
   settings = {
      Lua = {
         diagnostics = {
            globals = { "vim" },
         },
         workspace = {
            library = {
               [vim.fn.expand "$VIMRUNTIME/lua"] = true,
               [vim.fn.expand "$VIMRUNTIME/lua/vim/lsp"] = true,
               [vim.fn.stdpath("config") .. "/lua"] = true,
               vim.api.nvim_get_runtime_file("", true),
            },
            maxPreload = 100000,
            preloadFileSize = 10000,
         },
      },
   },
}]]

--[[ requires a file containing user's lspconfigs
local addlsp_confs = utils.load_config().plugins.options.lspconfig.setup_lspconf

if #addlsp_confs ~= 0 then
   require(addlsp_confs).setup_lsp(M.on_attach, capabilities)
end]]

return M