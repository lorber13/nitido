return {
  "nvim-neo-tree/neo-tree.nvim",
  branch = "v3.x",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
    "MunifTanjim/nui.nvim",
    -- {"3rd/image.nvim", opts = {}}, -- Optional image support in preview window: See `# Preview Mode` for more information
  },
  lazy = false, -- neo-tree will lazily load itself
  ---@module "neo-tree"
  ---@type neotree.Config?
  opts = {
    -- sources = {
    --   "filesystem",
    --   "document_symbols",
    -- },
    window = {
      mappings = {
        ["<tab>"] = {
          "toggle_preview",
          config = {
            use_float = false,
          },
        },
      },
    },
    event_handlers = {
      {
        event = "file_open_requested",
        handler = function()
          -- auto close
          vim.cmd("Neotree close")
        end,
      },
      -- {
      --   event = "after_render",
      --   handler = function()
      --     local state = require("neo-tree.sources.manager").get_state("filesystem")
      --     if not require("neo-tree.sources.common.preview").is_active() then
      --       state.config = { use_float = false } -- or whatever your config is
      --       state.commands.toggle_preview(state)
      --     end
      --   end,
      -- },
    },
  },
  keys = {
    {
      "<leader>e",
      function()
        require("neo-tree.command").execute({
          action = "focus",
          toggle = true,
          source = "filesystem",
          position = "left",
        })
      end,
      desc = "File tree",
    },
  },
}
