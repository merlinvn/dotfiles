-------------------- HELPERS -------------------------------
-- local api, cmd, fn, g = vim.api, vim.cmd, vim.fn, vim.g
-- local opt, wo = vim.opt, vim.wo
-- local fmt = string.format
-- set leader to space early
vim.g.mapleader = " "
vim.g.isColemakDH = true

require("settings")
require("plugins")

-- Plugins Configs
vim.cmd 'colorscheme gruvbox'

require("plugins.lsp")
require("plugins.nvim-compe")
require("plugins.neoformat")
require("plugins.telescope")
require("plugins.treesitter")

-- Key maps
require("settings.keymap")

-- Hook

vim.api.nvim_exec([[
function! StripTrailingWhitespaces()
  if !&binary && &filetype != 'diff'
    let l:save = winsaveview()
    keeppatterns %s/\s\+$//e
    call winrestview(l:save)
  endif
endfun
autocmd BufWritePre,FileWritePre,FileAppendPre,FilterWritePre * :call StripTrailingWhitespaces()
" autocmd FileType c,cpp,java,php,ruby,python autocmd BufWritePre <buffer> :call StripTrailingWhitespaces()
]], true)
--
-------------------- PLUGINS -------------------------------
-- git clone https://github.com/wbthomason/packer.nvim\
-- ~/.local/share/nvim/site/pack/packer/start/packer.nvim

--
--

-- install plugins manager git clone --depth=1 https://github.com/savq/paq-nvim.git \
--    "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/pack/paqs/start/paq-nvim
-- require "paq"{
-- "savq/paq-nvim";                  -- Let Paq manage itself

-- "gruvbox-community/gruvbox";

-- "easymotion/vim-easymotion";        -- easy moving around

-- "machakann/vim-highlightedyank";    -- highlight yanked text for 1 second

-- "tpope/vim-surround";               -- quick add, delete, change surround

-- "tpope/vim-repeat";

---- NerdCommenter
---- https://github.com/preservim/nerdcommenter
---- <Leader>cc comment
---- <Leader>cu uncomment
---- <Leader>ci toggle
-- "preservim/nerdcommenter";

---- "itchyny/lightline.vim";

---- for neovim install `pip3 install neovim-remote` to allow floaterm to open
---- windows in side neovim
---- "voldikss/vim-floaterm";

---- "mhinz/vim-startify";

---- other language enhancements
----  "octol/vim-cpp-enhanced-highlight";
----  "bfrg/vim-cpp-modern";

---- "rust-lang/rust.vim";
---- "tweekmonster/gofmt.vim";

---- "cespare/vim-toml";

---- Cheat Sheet
---- "dbeniamine/cheat.sh-vim";

---- Vim Wiki
-- "vimwiki/vimwiki";

---- Vim css color
-- "ap/vim-css-color";
-- "chrisbra/Colorizer";

-- "liuchengxu/vim-which-key";

---- "unblevable/quick-scope";

---- autocompletion with language server by nvim built-in
---- "neovim/nvim-lspconfig";
---- "nvim-lua/completion-nvim";
---- "tjdevries/nlua.nvim";
---- "tjdevries/lsp_extensions.nvim";

---- need to call :TSInstall {language} later
---- "nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate";}

---- "onsails/lspkind-nvim";

---- Snippet engine
---- "SirVer/ultisnips";
---- Sippets manager
---- "mhonza/vim-snippets";
----
-- }

