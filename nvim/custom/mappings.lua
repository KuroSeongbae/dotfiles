local M = {}

M.abc = {
  n = {
    ["\'"] = { ":", "", opts = { nowait = true } }, -- I don't know how to achieve a remap otherwise :(
    ["\""] = { ":", "", opts = { nowait = true } },

    ["j"] = { "<Left>", "Navigate right" },
    ["k"] = { "<Down>", "Navigate down" },
    ["l"] = { "<Up>", "Navigate up" },
    [";"] = { "<Right>", "Navigate right" },
    -- switch between windows
    ["<C-j>"] = { "<C-w>h", "Window left" },
    ["<C-k>"] = { "<C-w>j", "Window right" },
    ["<C-l>"] = { "<C-w>k", "Window down" },
    ["<C-;>"] = { "<C-w>l", "Window up" },
  },
  i = {
    ["<C-j>"] = { "<Left>", "Move left" },
    ["<C-k>"] = { "<Down>", "Move right" },
    ["<C-l>"] = { "<Up>", "Move down" },
    ["<C-;>"] = { "<Right>", "Move up" },
  },
  v = {
    ["j"] = {"<Left>", "Navigate right"},
    ["k"] = {"<Down>", "Navigate down"},
    ["l"] = {"<Up>", "Navigate up"},
    [";"] = {"<Right>", "Navigate right"},
  }
}

return M
