-- after/null-ls.lua

-- -- Make sure `null-ls` is loaded before setting up sources
-- local null_ls = require("null-ls")
--
-- null_ls.setup({
--   sources = {
--     -- Black formatter with 80-character line length
--     null_ls.builtins.formating.black.with({
--       extra_args = { "--line-length", "80" },
--     }),
--
--     -- Flake8 linter with 80-character line length
--     -- null_ls.builtins.diagnostics.flake8.with({
--       -- extra_args = { "--max-line-length", "80" },
--     -- }),
--   },
-- })


local null_ls = require("null-ls")

null_ls.setup({
  sources = {
    null_ls.builtins.formatting.autopep8.with({
      extra_args = { "--max-line-length", "80" },
    }),
    null_ls.builtins.formatting.black.with({
      extra_args = { "--line-length", "80" },
    }),
  },
})

