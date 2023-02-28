-- global configuration mostly taken from my vimrc
vim.cmd('syntax on')  -- Enable syntax highlightng
vim.opt.errorbells = false  -- Disable the horrible bell sound
vim.opt.tabstop = 4  -- How many spaces when pressing <Tab>
vim.opt.softtabstop = 4  -- How many spaces to add when pressing <Tab>
vim.opt.shiftwidth = 4  -- How many spaces when identing
vim.opt.expandtab = true  -- Use spaces and not tabs
vim.opt.smartindent = true  -- Enable smart indentation
vim.opt.number = true  -- Show line number
vim.opt.relativenumber = true  -- Show relative line number, both is called hybrid number
vim.opt.colorcolumn = '80'  -- Show a vertical line at 80 characters
vim.opt.wrap = false  -- Do not wrap line
vim.opt.ignorecase = true  -- Ignore case when searching
vim.opt.smartcase = true  -- Enable case only if your search contains an uppercase
vim.opt.swapfile = false  -- Désactive la création de fichiers d'échange
vim.opt.backup = false  -- Do not create backups
vim.opt.undofile = true  -- Store the undo branch in a file
vim.opt.undodir = vim.fs.normalize('$XDG_CACHE_HOME/nvim/undo')  -- Store the undo files in cache
vim.opt.incsearch = true  -- Go and highlight the searched pattern
vim.opt.hlsearch = false  -- Do not highlight all the search results
vim.opt.cursorline = true  -- Underline/highlight the current line
vim.g.mapleader = ' '  -- The <leader> key is space
vim.opt.hidden = true  -- Modify multiple buffers at the same time
vim.opt.autoread = true  -- If a buffer has been modified read it before editing it
vim.opt.nrformats:append('alpha') -- <C-a>/<C-x> also on letters
vim.g.pastetoggle = '<F3>'  -- Use the F3 key to go to toggle pasting
vim.opt.lazyredraw = true  -- Do not redraw while executing a macro or some command
vim.opt.background = 'dark'
-- Netrw
vim.g.netrw_banner = 0 -- No banner
vim.g.netrw_liststyle = 3 -- Setting nerdtree like style
vim.g.netrw_winsize = 25 -- Setting size
vim.g.netrw_browse_split = 4 -- Open in previous window (the editing one)
-- Open netrw with leader p
vim.api.nvim_set_keymap('n', '<leader>p', ':Lexplore<CR>', {})

-- Disable remote providers
vim.g.loaded_ruby_provider = 0
vim.g.loaded_node_provider = 0
vim.g.loaded_perl_provider = 0
vim.g.loaded_python3_provider = 0

-- Use lazy.nvim as package manager
-- Install it in $XDG_DATA_HOME if it is not the case
local lazypath = vim.fn.stdpath('data') .. '/lazy/lazy.nvim'
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    'git',
    'clone',
    '--filter=blob:none',
    'https://github.com/folke/lazy.nvim.git',
    '--branch=stable', -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

local plugins = {
    -- Theming
    'ellisonleao/gruvbox.nvim', -- the best colorscheme ❤️, this version is in LUA and support treesitter
    'nvim-treesitter/nvim-treesitter', -- Treesitter
    'stevearc/dressing.nvim', -- Better vim.ui ✔️
    'lukas-reineke/indent-blankline.nvim', -- and vertical lines to show indents ✔️
    -- LSP and DAP
    'williamboman/mason.nvim', -- LSP/DAP manager ✔️
    -- LSP
    'neovim/nvim-lspconfig', -- configuration for the built-in LSP client ✔️
    'williamboman/mason-lspconfig.nvim', -- bridge between mason and lspconfig ✔️
    {"jose-elias-alvarez/null-ls.nvim", -- LSP formatter and linters
        dependencies = {
            'nvim-lua/plenary.nvim',
        }
    },
    "jay-babu/mason-null-ls.nvim", -- bridge between mason and null-ls
    -- DAP
    -- 'mfussenegger/nvim-dap', -- DAP client ?
    -- 'jay-babu/mason-nvim-dap.nvim',  -- bridge between mason and nvim-dap ?
    -- Utils
    'numToStr/Comment.nvim', -- toggle comments ✔️
    'ibhagwan/fzf-lua', -- fzf with les buffers, LSP, DAP, les tags, git, grep, etc. ✔️
}
local opts = {}

require('lazy').setup(plugins, opts)

vim.opt.termguicolors = true
vim.cmd[[colorscheme gruvbox]]

require('Comment').setup()
require('mason').setup()

-- Automatically setup installed language servers
require("mason-lspconfig").setup()
require("mason-lspconfig").setup_handlers {
    -- :help mason-lspconfig-automatic-server-setup
    function (server_name) -- default handler (optional)
        require("lspconfig")[server_name].setup {}
    end,
}

-- Automatically setup installed formatter/linters
require("mason-null-ls").setup({
    automatic_setup = true,
})
require 'mason-null-ls'.setup_handlers()
-- Setup a keymap for formatting sync, TODO: find a way to always use null-ls and format on save
--
vim.api.nvim_create_autocmd('LspAttach', {
  callback = function(args)
    vim.keymap.set('n', 'K', vim.lsp.buf.hover, { buffer = args.buf })
    vim.api.nvim_set_keymap('n', '<leader>lf', ':lua vim.lsp.buf.format()<CR>', {})
    vim.api.nvim_set_keymap('n', '<leader>a', ':lua vim.lsp.buf.code_action()<CR>', {})
  end,
})

-- fzf mapping
vim.api.nvim_set_keymap('n', '<leader>ff', ':FzfLua files<CR>', {})
vim.api.nvim_set_keymap('n', '<leader>fg', ':FzfLua live_grep<CR>', {})
vim.api.nvim_set_keymap('n', '<leader>ft', ':FzfLua tagstack<CR>', {})
vim.api.nvim_set_keymap('n', '<leader>flr', ':FzfLua lsp_references<CR>', {})
vim.api.nvim_set_keymap('n', '<leader>fld', ':FzfLua lsp_workspace_diagnostics<CR>', {})
vim.api.nvim_set_keymap('n', '<leader>fli', ':FzfLua lsp_implementations<CR>', {})