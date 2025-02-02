-- This file can be loaded by  calling `lua require('plugins')` from your init.vim
-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'

  use {
	  'nvim-telescope/telescope.nvim', tag = '0.1.8',
	  -- or                            , branch = '0.1.x',
	  requires = { {'nvim-lua/plenary.nvim'} }
}

-- color theme setup
use({ 
	'rose-pine/neovim', 
	as = 'rose-pine', 
	config = function()
		require('rose-pine').setup({
			--- @usage 'main' | 'moon' | 'dawn'
			variant = 'main',
			dark_variant = 'main',
		})
		vim.cmd('colorscheme rose-pine')
	end
})


-- Plug package manager installation
-- Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
--
-- Packer package manager installation
-- treesitter used to add more colors
use ('nvim-treesitter/nvim-treesitter', {run = ':TSUpdate'})

-- primeagen plugin
use "nvim-lua/plenary.nvim" -- don't forget to add this one if you don't have it yet!
use {
    "ThePrimeagen/harpoon",
    branch = "harpoon2",
    requires = { {"nvim-lua/plenary.nvim"} }
}

use 'mbbill/undotree'
use 'tpope/vim-fugitive' -- for git managing

-- lsp setup
use({'neovim/nvim-lspconfig'})
use({'hrsh7th/nvim-cmp'})
use({'hrsh7th/cmp-nvim-lsp'})

-- null-ls helps getting external formatters into neovim
use {
  "jose-elias-alvarez/null-ls.nvim",
  requires = { "nvim-lua/plenary.nvim" },
}

-- Add avante.nvim plugin configuration
-- vim-plug installation example
-- 
-- " Deps
-- Plug 'stevearc/dressing.nvim'
-- Plug 'nvim-lua/plenary.nvim'
-- Plug 'MunifTanjim/nui.nvim'
--
-- " Optional deps
-- Plug 'hrsh7th/nvim-cmp'
-- Plug 'nvim-tree/nvim-web-devicons' "or Plug 'echasnovski/mini.icons'
-- Plug 'HakonHarnes/img-clip.nvim'
-- Plug 'zbirenbaum/copilot.lua'
--
-- " Yay, pass source=true if you want to build from source
-- Plug 'yetone/avante.nvim', { 'branch': 'main', 'do': 'make' }
-- autocmd! User avante.nvim lua << EOF
-- require('avante_lib').load()
-- require('avante').setup()
-- EOF

-- -- translated packer installation
--  -- Dependencies
-- use 'stevearc/dressing.nvim'
-- use 'nvim-lua/plenary.nvim'
-- use 'MunifTanjim/nui.nvim'
--
-- -- Optional dependencies
-- use 'hrsh7th/nvim-cmp'
-- use 'nvim-tree/nvim-web-devicons' -- or 'echasnovski/mini.icons'
-- use {
-- 'HakonHarnes/img-clip.nvim',
-- opts = {
--   default = {
--     embed_image_as_base64 = false,
--     prompt_for_file_name = false,
--     drag_and_drop = {
--       insert_mode = true,
--     },
--     use_absolute_path = true,
--   },
-- },
-- }
-- use 'zbirenbaum/copilot.lua'
--
-- -- Main plugin
-- use {
-- 'yetone/avante.nvim',
-- branch = 'main',
-- build = 'make', -- Automatically runs `make` after installation
-- config = function()
--   local avante = require('avante')
--   require('avante_lib').load()
--   avante.setup()
-- end,
-- }

end)

