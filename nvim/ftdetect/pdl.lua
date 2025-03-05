vim.api.nvim_create_autocmd("FileType", {
    pattern = "pdl",
    callback = function()
        vim.cmd [[highlight ExtraWhitespace ctermbg=red guibg=red]]
        vim.cmd [[match ExtraWhitespace /\s\+$/]]
    end
})
--
-- vim.api.nvim_create_autocmd("FileType", {
--     pattern = "pdl",
--     callback = function()
--         -- Define a highlight for excess blank lines
--         vim.cmd [[highlight ExtraBlankLines ctermbg=darkgray guibg=gray]]
--
--         -- Match 3 or more consecutive blank lines
--         vim.cmd [[match ExtraBlankLines /\v^(\n){3,}$]]
--     end
-- })
-- --
--
vim.api.nvim_create_autocmd("FileType", {
    pattern = "pdl",
    callback = function()
        -- Enable list mode and show EOL markers
        vim.opt.list = true
        -- vim.opt.listchars = { eol = "↲" }  -- Show EOL markers as ↲

        -- Highlight trailing spaces and trailing EOL
        vim.api.nvim_set_hl(0, "TrailingWhitespace", { fg = "gray" })
        vim.cmd [[match TrailingWhitespace /\s\+$/]]  -- Match trailing spaces
    end
})

