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
		-- vim.cmd('colorscheme rose-pine')
	end
})


-- Plug package manager installation
-- Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}

-- Packer package manager installation
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

-- everforest theme
use {
  "sainnhe/everforest",
  config = function()
    -- Set the colorscheme
    vim.g.everforest_background = "hard"  -- Options: 'hard', 'medium', 'soft'
    vim.g.everforest_enable_italic = 1
    -- vim.g.everforest_disable_italic_comment = 1
    vim.cmd("colorscheme everforest")
    -- vim.g.everforest_transparent_background = 1

  end
}

-- glow plugin for markdown render inside neovim
use {"ellisonleao/glow.nvim", config = function()
    require("glow").setup()
    end}
end)

