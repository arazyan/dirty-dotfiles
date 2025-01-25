-- Reserve a space in the gutter
vim.opt.signcolumn = 'yes'

-- Add cmp_nvim_lsp capabilities settings to lspconfig
local lspconfig_defaults = require('lspconfig').util.default_config
lspconfig_defaults.capabilities = vim.tbl_deep_extend(
  'force',
  lspconfig_defaults.capabilities,
  require('cmp_nvim_lsp').default_capabilities()
)

-- LSP keybindings for actions
vim.api.nvim_create_autocmd('LspAttach', {
  desc = 'LSP actions',
  callback = function(event)
    local opts = {buffer = event.buf}

    vim.keymap.set('n', 'K', '<cmd>lua vim.lsp.buf.hover()<cr>', opts)
    vim.keymap.set('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<cr>', opts)
    vim.keymap.set('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<cr>', opts)
    vim.keymap.set('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<cr>', opts)
    vim.keymap.set('n', 'go', '<cmd>lua vim.lsp.buf.type_definition()<cr>', opts)
    vim.keymap.set('n', 'gr', '<cmd>lua vim.lsp.buf.references()<cr>', opts)
    vim.keymap.set('n', 'gs', '<cmd>lua vim.lsp.buf.signature_help()<cr>', opts)
    vim.keymap.set('n', '<F2>', '<cmd>lua vim.lsp.buf.rename()<cr>', opts)
    vim.keymap.set({'n', 'x'}, '<F3>', '<cmd>lua vim.lsp.buf.format({async = true})<cr>', opts)
    vim.keymap.set('n', '<F4>', '<cmd>lua vim.lsp.buf.code_action()<cr>', opts)
  end,
})

-- Configure Python (Pyright)
require('lspconfig').pyright.setup({})

-- Configure Bash (Bash Language Server)
require('lspconfig').bashls.setup({})

-- Example for other servers (retain or remove as needed)
require('lspconfig').gleam.setup({})
require('lspconfig').rust_analyzer.setup({})

-- Lua lsp configuration
require('lspconfig').lua_ls.setup({
  settings = {
    Lua = {
      runtime = {
        -- Tell the language server which version of Lua you're using
        version = 'LuaJIT',
        -- Setup your Lua path
        path = vim.split(package.path, ';'),
      },
      diagnostics = {
        -- Get the language server to recognize the `vim` global
        globals = {'vim'},
      },
      workspace = {
        -- Make the server aware of Neovim runtime files
        library = vim.api.nvim_get_runtime_file("", true),
        checkThirdParty = false, -- Disable third-party suggestions
      },
      telemetry = {
        enable = false, -- Do not send telemetry data
      },
    },
  },
})



-- CMP Setup for autocompletion
local cmp = require('cmp')

cmp.setup({
  snippet = {
    expand = function(args)
      vim.fn["vsnip#anonymous"](args.body) -- Replace if you're using a different snippet engine
    end,
  },
  mapping = cmp.mapping.preset.insert({
    -- Confirm the selected completion item
    ['<CR>'] = cmp.mapping.confirm({ select = true }),

    -- Navigate completion menu
    ['<C-n>'] = cmp.mapping.select_next_item(),
    ['<C-p>'] = cmp.mapping.select_prev_item(),

    -- Trigger completion manually
    ['<C-Space>'] = cmp.mapping.complete(),

    -- Abort completion
    ['<C-e>'] = cmp.mapping.abort(),
  }),
  sources = {
    { name = 'nvim_lsp' }, -- LSP source
    { name = 'vsnip' },    -- Snippet source
  },
})


--
-- -- null-ls config
-- local null_ls = require("null-ls")
--
-- null_ls.setup({
--     -- debug=true,
--     sources = {
--         null_ls.builtins.formatting.black, -- Black for Python
--     },
--     on_attach = function(client, bufnr)
--         print("null-ls attached") -- to see when attached to window
--         if client.supports_method("textDocument/formatting") then
--             -- Keybinding for formatting
--             vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>f', '<cmd>lua vim.lsp.buf.format({ async = true })<CR>', { noremap = true, silent = true, desc = "Format buffer" })
--
--             -- -- Auto-format on save
--             -- vim.api.nvim_create_autocmd("BufWritePre", {
--             --     buffer = bufnr,
--             --     callback = function()
--             --         vim.lsp.buf.format({ async = false })
--             --     end,
--             -- })
--         end
--     end,
-- })


local null_ls = require("null-ls")

null_ls.setup({
    -- debug=true,
    sources = {
        -- not pep-8
        null_ls.builtins.formatting.black.with({
            extra_args = { "--line-length", "80" }, -- Set line length for black
        }),
        -- pep-8
        null_ls.builtins.formatting.autopep8.with({
            extra_args = { "--max-line-length", "80" }, -- Set max line length for autopep8
        }),
    },
    on_attach = function(client, bufnr)
        print("null-ls attached") -- to see when attached to window
        if client.supports_method("textDocument/formatting") then
            -- Keybinding for formatting
            vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>f', '<cmd>lua vim.lsp.buf.format({ async = true })<CR>', { noremap = true, silent = true, desc = "Format buffer" })

            -- -- Auto-format on save
            -- vim.api.nvim_create_autocmd("BufWritePre", {
            --     buffer = bufnr,
            --     callback = function()
            --         vim.lsp.buf.format({ async = false })
            --     end,
            -- })
        end
    end,
})

