return {
  "norcalli/nvim-colorizer.lua",
  config = function()
    require("colorizer").setup()
  end,
  init = function()
    vim.opt.termguicolors = true
  end,
}
