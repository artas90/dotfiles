local M = {}

M.options, M.ui, M.mappings, M.plugins = {}, {}, {}, {}

M.mappings = {
  misc = {
    new_buffer = "<C-n>",
    close_buffer = "<C-w>",
  }
}

M.mappings.plugins = {
  nvimtree = {
    toggle = "<C-e>"
  }
}

M.plugins = {
  options = {
    statusline = {
      style = "block"
    }
  }
}

return M

