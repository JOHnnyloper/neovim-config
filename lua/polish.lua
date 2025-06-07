-- Set up custom filetypes
vim.filetype.add {
  extension = {
    foo = "fooscript",
  },
  filename = {
    ["Foofile"] = "fooscript",
  },
  pattern = {
    ["~/.config/foo/.*"] = "fooscript",
  },
}

-- Fix nvim-notify background color to avoid transparency issues
pcall(function()
  require("notify").setup {
    background_colour = "#000000",
  }
end)
