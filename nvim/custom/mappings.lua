local M = {}

M.abc = {
  n = {
    ["j"] = {"<Left>", "Navigate right"},
    ["k"] = {"<Down>", "Navigate down"},
    ["l"] = {"<Up>", "Navigate up"},
    [";"] = {"<Right>", "Navigate right"},
  },
  i = {
    ["<C-j>"] = { "<Left>", "Move left" },
    ["<C-k>"] = { "<Right>", "Move right" },
    ["<C-l>"] = { "<Down>", "Move down" },
    ["<C-;>"] = { "<Up>", "Move up" },
  },
  v = {
    ["j"] = {"<Left>", "Navigate right"},
    ["k"] = {"<Down>", "Navigate down"},
    ["l"] = {"<Up>", "Navigate up"},
    [";"] = {"<Right>", "Navigate right"},
  }
}

return M
