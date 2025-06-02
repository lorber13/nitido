return {
  "nvim-telescope/telescope.nvim",
  tag = "0.1.8",
  -- or                              , branch = '0.1.x',
  dependencies = { "nvim-lua/plenary.nvim" },
  keys = {
    {
      "<leader><leader>",
      "<cmd>Telescope live_grep<cr>",
      desc = "Global [S]earch",
    },
  },
}
