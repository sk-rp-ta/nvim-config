local options = {noremap = true}

local keymap = vim.api.nvim_set_keymap

keymap("n", "<C-f>", ":Telescope current_buffer_fuzzy_find<CR>", options)
keymap("n", "<S-f>", ":Telescope live_grep<CR>", options)
keymap("n", "<C-b>", ":NvimTreeToggle<CR>", options)
keymap("n", "<S-Left>", ":BufferLineCyclePrev<CR>", options)
keymap("n", "<S-Right>", ":BufferLineCycleNext<CR>", options)
keymap("n", "<S-q>", ":Bdelete!<CR>", options)
keymap("n", "<C-\\>", ":vsplit<CR>", options)
keymap("n", "fmt", ":lua vim.lsp.buf.format()<CR>", options)
