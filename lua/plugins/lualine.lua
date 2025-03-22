return {
  "nvim-lualine/lualine.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  ---@module "lualine"
  opts = {
    options = {
      component_separators = {
        left = "│",
        right = "│",
        -- right = "┆",
      },
      section_separators = {
        left = "",
        right = "",
      },
      globalstatus = true,
      theme = "catppuccin",
    },
  },
}
