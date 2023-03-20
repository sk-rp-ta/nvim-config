local options = {noremap = true}

local keymap = vim.api.nvim_set_keymap

keymap("n", "<C-f>", ":Telescope current_buffer_fuzzy_find<CR>", options)
keymap("n", "<C-S>", ":Telescope live_grep", options)
keymap("n", "<A-Tab>", ":NvimTreeToggle<CR>", options)

