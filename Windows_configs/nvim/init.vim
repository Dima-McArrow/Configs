" Enable syntax highlighting
syntax on

" Status bar
set laststatus=2

" Show line numbers
set number

" Encoding
set encoding=utf-8
set backspace=indent,eol,start
set tabstop=2
set shiftwidth=2
set expandtab
set autoindent
set showmatch
set mouse=a
set incsearch
set hlsearch
set cc=100

" FILE BROWSING
let g:netrw_banner=0
let g:netrw_browse_split=4
let g:netrw_altv=1
let g:netrw_liststyle=3
let g:netrw_list_hide=netrw_gitignore#Hide()
let g:netrw_list_hide.=',\(^\|\s\s\)\zs\.\S\+'

" vim-plug
call plug#begin()

Plug 'tpope/vim-sensible'
Plug 'preservim/nerdtree', { 'on': 'NERDTreeToggle' }
Plug 'loctvl842/monokai-pro.nvim'
Plug 'neovim/nvim-lspconfig'
Plug 'hrsh7th/nvim-cmp'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'mhartington/formatter.nvim'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'nvim-tree/nvim-web-devicons'  " Required for file icons
Plug 'ryanoasis/vim-devicons'  " Needed by NERDTree to display icons
Plug 'mattn/emmet-vim'  " Emmet plugin for snippet expansion
Plug 'lukas-reineke/indent-blankline.nvim'
Plug 'p00f/nvim-ts-rainbow'

call plug#end()

" Lua Configuration
lua << EOF

-- Formatter Setup
require('formatter').setup({
  filetype = {
    javascript = { require('formatter.filetypes.javascript').prettier },
    typescript = { require('formatter.filetypes.typescript').prettier },
    python = { require('formatter.filetypes.python').black },
    lua = { require('formatter.filetypes.lua').stylua },
    html = { require('formatter.filetypes.html').prettier },
    css = { require('formatter.filetypes.css').prettier }
  }
})

-- Treesitter Setup
require'nvim-treesitter.configs'.setup {
  ensure_installed = { "javascript", "typescript", "html", "css", "lua", "python" },
  highlight = { enable = true},
  rainbow = {
    enable = false,
    extended_mode = true,
    max_file_lines = 1000,
  },
}

-- Dev icons
require('nvim-web-devicons').setup()

-- Indent rainbow
vim.cmd [[highlight IndentBlanklineIndent1 guifg=#E06C75 gui=nocombine]]
vim.cmd [[highlight IndentBlanklineIndent2 guifg=#E5C07B gui=nocombine]]
vim.cmd [[highlight IndentBlanklineIndent3 guifg=#98C379 gui=nocombine]]
vim.cmd [[highlight IndentBlanklineIndent4 guifg=#56B6C2 gui=nocombine]]
vim.cmd [[highlight IndentBlanklineIndent5 guifg=#61AFEF gui=nocombine]]
vim.cmd [[highlight IndentBlanklineIndent6 guifg=#C678DD gui=nocombine]]

-- Set options for whitespace display
vim.opt.list = true
vim.opt.listchars:append("space:⋅")
vim.opt.listchars:append("eol:↴")

-- Indent-blankline settings for version 3
require("ibl").setup {
  indent = {
    char = "▏",
      highlight = {
        "IndentBlanklineIndent1",
        "IndentBlanklineIndent2",
        "IndentBlanklineIndent3",
        "IndentBlanklineIndent4",
        "IndentBlanklineIndent5",
        "IndentBlanklineIndent6",
      },
  },
  scope = { 
    show_start = false, 
    show_end = false,
  }
}

-- Monokai Pro Theme Setup
require("monokai-pro").setup({
  transparent_background = false,
  terminal_colors = true,
  devicons = true,
  styles = {
    comment = { italic = true },
    keyword = { italic = true },
    type = { italic = true },
    storageclass = { italic = true },
    structure = { italic = true },
    parameter = { italic = true },
    annotation = { italic = true },
    tag_attribute = { italic = true },
  },
  filter = "pro",
  day_night = { enable = false, day_filter = "pro", night_filter = "spectrum" },
  inc_search = "background",
  background_clear = { "telescope", "renamer", "notify" },
  plugins = {
    bufferline = { underline_selected = false, underline_visible = false },
    indent_blankline = { context_highlight = "default", context_start_underline = false },
  },
  override = function(cs, p, Config, hp) end,
})

local cmp = require('cmp')

cmp.setup({
  mapping = {
    -- Use <C-y> for confirming the snippet expansion
    ['<C-y>'] = cmp.mapping.confirm({ select = true })
  },
  sources = {
    { name = 'emmet' },  -- Emmet source for HTML/CSS
    { name = 'buffer' }, -- Standard buffer completion
  }
})

EOF

" Autoformat on save
autocmd BufWritePost * FormatWrite

" Vim Script
colorscheme monokai-pro

" Emmet Setup for HTML, CSS, etc.
let g:user_emmet_install_global=1

let NERDTreeMapOpenInTab = 1

" Automatically enable Emmet for HTML, CSS, JavaScript, etc.
autocmd FileType html,css EmmetInstall

" Key Mapping to expand Emmet abbreviation
autocmd FileType html,css imap <C-y> <Plug>(emmet-expand-abbr)

command! NTE NERDTreeExplore
command! NT NERDTreeToggle
