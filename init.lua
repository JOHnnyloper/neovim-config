local colorscheme = "catppuccin-mocha"

-- This file simply bootstraps the installation of Lazy.nvim and then calls other files for execution
-- This file doesn't necessarily need to be touched, BE CAUTIOUS editing this file and proceed at your own risk.
local lazypath = vim.env.LAZY or vim.fn.stdpath "data" .. "/lazy/lazy.nvim"
if not (vim.env.LAZY or (vim.uv or vim.loop).fs_stat(lazypath)) then
  vim.fn.system {
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable",
    lazypath,
  }
end
vim.opt.rtp:prepend(lazypath)

if not pcall(require, "lazy") then
  vim.api.nvim_echo(
    { { ("Unable to load lazy from: %s\n"):format(lazypath), "ErrorMsg" }, { "Press any key to exit...", "MoreMsg" } },
    true,
    {}
  )
  vim.fn.getchar()
  vim.cmd.quit()
end

require "lazy_setup"
require "polish"

-- Setup Catppuccin
require("catppuccin").setup {
  flavour = "mocha", -- latte, frappe, macchiato, mocha
  transparent_background = true,
  term_colors = true,
  integrations = {
    cmp = true,
    gitsigns = true,
    nvimtree = true,
    telescope = true,
    treesitter = true,
    notify = false,
    mini = false,
  },
  -- Turn off all italics
  styles = {
    comments = {},
    conditionals = {},
    loops = {},
    functions = {},
    keywords = {},
    strings = {},
    variables = {},
    numbers = {},
    booleans = {},
    properties = {},
    types = {},
    operators = {},
  },
  custom_highlights = function(colors)
    return {
      Normal = { bg = "none" },
      NormalNC = { bg = "none" },
      NormalFloat = { bg = "none" },
      FloatBorder = { bg = "none" },
      VertSplit = { bg = "none" },
      SignColumn = { bg = "none" },
      StatusLine = { bg = "none" },
      StatusLineNC = { bg = "none" },
      CursorLine = { bg = "none" },
      CursorLineNr = { bg = "none" },
      LineNr = { bg = "none" },
      Folded = { bg = "none" },
      EndOfBuffer = { bg = "none" },
    }
  end,
}
-- Apply the colorscheme
vim.cmd.colorscheme(colorscheme)
-- Ensure conceallevel is set for obsidian.nvim
vim.opt.conceallevel = 2
vim.opt.concealcursor = "nc"
vim.cmd [[
  highlight NeoTreeTabInactive guibg=NONE guifg=#555555
  highlight NeoTreeTabSeparatorInactive guibg=NONE guifg=#555555
  highlight NeoTreeTabActive guibg=NONE guifg=#ffffff gui=bold
  highlight NeoTreeTabSeparatorActive guibg=NONE guifg=#ffffff
]]
