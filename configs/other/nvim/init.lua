local map = require("core.utils").map

-- duplicate line
map("n", "<c-D>", "yyp", opt)
map("i", "<c-D>", "<Esc>yyp", opt)

-- save (default is set only for normal mode)
map("i", "<c-s>", "<Esc>:w<CR>", opt)

-- quit
map("n", "<c-q>", ":qa!<CR>", opt)
map("i", "<c-q>", "<Esc>:qa!<CR>", opt)

-- buffers
map("n", "<c-p>", ":Telescope find_files<CR>", opt)

-- misc
map("n", "<leader>tt", ":Telescope builtin<CR>", opt)
