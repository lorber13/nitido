return {
  "folke/trouble.nvim",
  opts = {},
  cmd = "Trouble",
  keys = {
    {
      "<leader>p",
      "<cmd>Trouble diagnostics toggle focus=true warn_no_results=false open_no_results=true<cr>",
      desc = "Open Diagnostics",
    },
  },
}
