local present, catppuccin = pcall(require, "catpuccin")

if not present then
  return
end

local options = {

}

catppuccin.setup(options)

