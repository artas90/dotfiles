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
    nvimtree = {
      view = {
        hide_root_folder = false
      }
    }
  }
}


return M
