return {
  "gen740/SmoothCursor.nvim",
  config = function()
    require("smoothcursor").setup {
      type = "exp", -- smooth movement
      cursor = "", -- optional cursor symbol
      speed = 35, -- animation speed
    }
  end,
}
