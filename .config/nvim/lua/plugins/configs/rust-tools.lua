local present, rust_tools = pcall(require, "rust-tools")
if not present then
  return
end

local options = {
  server = {
    cmd = {"~/.local/share/nvim/lsp_servers/rust_analyzer/rust-analyzer"},
  },
}

rust_tools.setup(options)
