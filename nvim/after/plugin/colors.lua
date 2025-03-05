-- custom script for transparrent bg

local function ColorMyPencils(color)
    color = color or "rose-pine"

    vim.g.everforest_background = "hard" -- Change to "medium" or "hard" if needed
    -- Safely apply the colorscheme
    local ok, err = pcall(vim.cmd.colorscheme, color)
    if not ok then
        vim.notify("Error loading colorscheme: " .. err, vim.log.levels.ERROR)
        return
    end

    -- Set transparency
    -- pcall(vim.api.nvim_set_hl, 0, "Normal", { bg = "none" })
    -- pcall(vim.api.nvim_set_hl, 0, "NormalFloat", { bg = "none" })
end

ColorMyPencils("everforest")

-- after package installing to enable the function call the next command:
 -- :lua ColorMyPencils()
