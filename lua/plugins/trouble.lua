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
    {
      "<leader>s",
      function()
        local trouble = require("trouble")
        trouble.toggle({
          mode = "lsp_document_symbols",
          multiline = false,
          win = {
            type = "split",
            position = "right",
            size = 50,
          },
        })
      end,
      desc = "Open Symbols",
    },
  },
}
