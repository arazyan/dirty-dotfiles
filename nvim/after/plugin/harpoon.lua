local harpoon = require("harpoon")

-- REQUIRED
harpoon:setup()
-- REQUIRED

-- mark
vim.keymap.set("n", "<leader>m", function() harpoon:list():add() end)
-- quick menu
vim.keymap.set("n", "<C-e>", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end)

vim.keymap.set("n", "<C-1>", function() harpoon:list():select(1) end)
vim.keymap.set("n", "<C-2>", function() harpoon:list():select(2) end)
vim.keymap.set("n", "<C-3>", function() harpoon:list():select(3) end)
vim.keymap.set("n", "<C-4>", function() harpoon:list():select(4) end)

-- Toggle previous & next buffers stored within Harpoon list
vim.keymap.set("n", "<leader>,", function() harpoon:list():prev() end)
vim.keymap.set("n", "<leader>.", function() harpoon:list():next() end)

--- new motions
--- ----------------------------------------------
--- remove <leader>a under "<leader>a" substring 
-- vim.keymap.set("n", "<leader>a", mark.add_file)
-- new motions: f (=from) t(=till)
-- motions: dt"
-- or for change motions: ct"
--
-- or i" Text Objects: ci" / di"
-- change in " / delete in "
-- also try di<
-- ctrl + e

--- ----------------------------------------------
--- <C-a> (or Ctrl+a) nearby the number increzes that number
--- <C-x> decreases the number
--- ----------------------------------------------

--- Window management in neovim
--- <C-w + [h,j,k,l] - move from one to another
--- <C-[n/c]> - add new window or close the current one
---
---
---
