local M = {}

M.options, M.ui, M.mappings, M.plugins = {}, {}, {}, {}

M.mappings = {
  new_buffer = "<C-n>",
  close_buffer = "<C-w>",
}

M.mappings.plugins = {
  nvimtree = {
    toggle = "<C-e>"
  }
}

return M
