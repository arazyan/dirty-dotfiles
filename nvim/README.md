# Description of my neovim configuration tree
    .
    ├── after
    │   └── plugin
    │       ├── colors.lua
    │       ├── fugitive.lua
    │       ├── harpoon.lua
    │       ├── lsp.lua
    │       ├── null-ls.lua
    │       ├── readme.lua
    │       ├── telescope.lua
    │       ├── treesitter.lua
    │       └── undotree.lua
    ├── ftdetect
    │   └── pdl.vim
    ├── init.lua
    ├── lua
    │   └── mad
    │       ├── init.lua
    │       ├── packer.lua
    │       ├── remap.lua
    │       └── set.lua
    ├── plugin
    │   └── packer_compiled.lua
    ├── README.md
    └── syntax
        └── pdl.vim

## First layer
* init.lua: The main Lua configuration file that bootstraps the Neovim setup. It serves as the entry point, loading settings, plugins, and user configurations, akin to index.html in web projects.
* lua/: Contains custom Lua modules organized under the mad/ folder, which encapsulates user-specific configurations.
* after/: Holds scripts that should execute only after Neovim has initialized and plugins have been fully loaded. This ensures plugin configurations do not conflict with Neovim's startup process.
* plugin/: Automatically managed by the Packer plugin manager. Contains packer_compiled.lua, which caches plugin setups to speed up Neovim startup.
* README.md: Provides documentation for understanding and maintaining this configuration.

## Second Layer
* after/plugin/: Plugin-specific configuration files:
    * colors.lua: Configures colorschemes and themes.
    * fugitive.lua: Git integration settings for the Fugitive plugin.
    * harpoon.lua: Keybindings and preferences for navigating with Harpoon.
    * lsp.lua: Configures the built-in LSP client and language servers.
    * null-ls.lua: Integrates formatters and linters via Null-ls.
    * readme.lua: Placeholder or test file for experimenting with configurations.
    * telescope.lua: Settings for the Telescope fuzzy finder plugin.
    * treesitter.lua: Syntax highlighting and code navigation powered by Treesitter.
    * undotree.lua: Customization for managing undo history with Undotree.

* lua/mad/: User-defined configurations:
    * init.lua: Entry point for user settings. This file typically imports packer.lua, remap.lua, and set.lua.
    * packer.lua: Manages plugins using the Packer plugin manager. Includes plugin specifications and setup.
    * remap.lua: Custom key mappings to enhance productivity and navigation.
    * set.lua: Contains global Neovim settings (e.g., tab width, line numbers, and clipboard behavior).

* syntax/pdl.vim: easy to adjust PDL syntax highlighter. Works on pair with ftdetect/pdl.vim that indicates .pdl files.
