-- editor related settings
vim.opt.nu = true
vim.opt.relativenumber = true

vim.opt.tabstop     = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth  = 4
vim.opt.expandtab   = true

vim.opt.smartindent = true

vim.opt.wrap = false

vim.opt.swapfile = false
vim.opt.backup   = false
vim.opt.undodir  = os.getenv("HOME") .. "/.vim/udnodir"
vim.opt.undofile = true

vim.opt.hlsearch  = false
vim.opt.incsearch = true

vim.opt.termguicolors = true

vim.opt.scrolloff  = 8
vim.opt.signcolumn = "yes"
vim.opt.isfname:append("@-@")

vim.opt.updatetime = 50

vim.opt.colorcolumn = "80"

vim.g.mapleader = " "

-- окно диагностики
vim.keymap.set("n", "<leader>e", vim.diagnostic.open_float, { desc = "Open diagnostic float" })



--highlight spaces
vim.opt.list = true -- Enable list mode
-- vim.opt.listchars:append("space:*") -- Show spaces as dots
vim.api.nvim_set_hl(0, "Whitespace", { fg = "gray" })
-- vim.opt.list = true
-- vim.opt.listchars:append("eol:↲") -- Show end-of-line markers

vim.api.nvim_create_autocmd("BufWinEnter", {
    pattern = "*",
    callback = function()
        -- Define a highlight for trailing spaces
        vim.cmd [[highlight TrailingWhitespace ctermfg=red guifg=gray]]

        -- Match only trailing spaces
        vim.cmd [[match TrailingWhitespace /\s\+$/]]
    end
})

