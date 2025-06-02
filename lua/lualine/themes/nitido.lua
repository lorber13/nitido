local palette = require("palette.nitido-dark")
return {
  normal = {
    a = { bg = palette.blue, fg = palette.black, gui = "bold" },
    b = { bg = palette.dp01, fg = palette.blue },
    c = { bg = palette.black, fg = palette.mtext },
  },

  insert = {
    a = { bg = palette.green, fg = palette.black, gui = "bold" },
    b = { bg = palette.dp01, fg = palette.green },
  },

  -- terminal = {
  --   a = { bg = C.green, fg = C.base, gui = "bold" },
  --   b = { bg = C.surface0, fg = C.green },
  -- },
  --
  -- command = {
  --   a = { bg = C.peach, fg = C.base, gui = "bold" },
  --   b = { bg = C.surface0, fg = C.peach },
  -- },
  --
  visual = {
    a = { bg = palette.purple, fg = palette.black, gui = "bold" },
    b = { bg = palette.dp01, fg = palette.purple },
  },
  --
  replace = {
    a = { bg = palette.orange, fg = palette.black, gui = "bold" },
    b = { bg = palette.dp01, fg = palette.orange },
  },
}
