-- https://www.chrisatmachine.com/Neovim/29-neovim-lua-development/
-- install luarocks
-- luarocks install --server=https://luarocks.org/dev luaformatter
--
-- install efm
-- go get github.com/mattn/efm-langserver
--
require"lspconfig".efm.setup {
    init_options = {documentFormatting = true},
    filetypes = {"lua"},
    settings = {
        rootMarkers = {".git/"},
        languages = {
            lua = {
                {
                    formatCommand = "lua-format -i --no-keep-simple-function-one-line --no-break-after-operator --column-limit=150 --break-after-table-lb",
                    formatStdin = true
                }
            }
        }
    }
}

