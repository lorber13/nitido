return {
  "neovim/nvim-lspconfig",
  dependencies = {
    {
      "j-hui/fidget.nvim",
      opts = {
        notification = {
          window = {
            winblend = 0,
          },
        },
      },
    },
    "hrsh7th/cmp-nvim-lsp",
  },
  config = function()
    vim.diagnostic.config({
      severity_sort = true,
      signs = {
        text = {
          [vim.diagnostic.severity.ERROR] = "󰅚 ",
          [vim.diagnostic.severity.WARN] = "󰀪 ",
          [vim.diagnostic.severity.INFO] = "󰋽 ",
          [vim.diagnostic.severity.HINT] = "󰌶 ",
        },
      },
      virtual_text = {
        source = "if_many",
      },
    })

    local trouble = require("trouble")

    vim.api.nvim_create_autocmd("LspAttach", {
      callback = function(args)
        vim.keymap.set("n", "K", vim.lsp.buf.hover, {
          desc = "View information",
          buffer = args.buf,
        })
        vim.keymap.set("n", "gd", function()
          trouble.open({
            focus = true,
            mode = "lsp_definitions",
            keys = {
              ["<CR>"] = "jump_close",
            },
          })
        end, {
          desc = "[G]oto [D]efinition",
          buffer = args.buf,
        })
        vim.keymap.set("n", "gD", function()
          trouble.open({
            focus = true,
            mode = "lsp_declarations",
            keys = {
              ["<CR>"] = "jump_close",
            },
          })
        end, {
          desc = "[G]oto [D]eclaration",
          buffer = args.buf,
        })
        vim.keymap.set("n", "gr", function()
          trouble.open({
            focus = true,
            mode = "lsp_references",
            keys = {
              ["<CR>"] = "jump_close",
            },
          })
        end, {
          desc = "[G]oto [R]eferences",
          buffer = args.buf,
        })
        vim.keymap.set("n", "gi", function()
          trouble.open({
            focus = true,
            mode = "lsp_implementations",
            keys = {
              ["<CR>"] = "jump_close",
            },
          })
        end, {
          desc = "[G]oto [I]mplementations",
          buffer = args.buf,
        })
        vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, {
          desc = "[R]e[n]ame",
          buffer = args.buf,
        })
        vim.keymap.set({ "n", "x" }, "<leader>ca", vim.lsp.buf.code_action, {
          desc = "[C]ode [A]ction",
          buffer = args.buf,
        })
      end,
    })

    local capabilities = require("cmp_nvim_lsp").default_capabilities()

    -- lua-language-server
    require("lspconfig").lua_ls.setup({
      capabilities = capabilities,
      settings = {
        Lua = {
          hint = {
            enable = true,
            setType = true,
          },
        },
      },
    })

    require("lspconfig").ts_ls.setup({
      capabilities = capabilities,
    })

    -- pyright
    require("lspconfig").pyright.setup({
      capabilities = capabilities,
    })

    -- clangd
    require("lspconfig").clangd.setup({
      capabilities = capabilities,
    })
    vim.lsp.inlay_hint.enable(true)
  end,
}
