local wk = require("which-key")
wk.setup {}

wk.register(
  {
    ["<Space>"] = {
      name = "Jump",
      w = {"Jump Word"},
      c = {"Jump Char"},
      l = {"Jump Line"},
      ["/"] = {"Jump Pattern"}
    }
  },
  {prefix = "<leader>"}
)

-- optional group name
--         f = {"<cmd>Telescope find_files<cr>", "Find File"}, -- create a binding with label
--         r = {"<cmd>Telescope oldfiles<cr>", "Open Recent File", noremap = false, buffer = 123}, -- additional options for creating the keymap
--         n = {"New File"}, -- just a label. don't create any mapping
--         e = "Edit File", -- same as above
--         ["1"] = "which_key_ignore", -- special label to hide it in the popup
--         b = {
--           function()
--             print("bar")
--           end,
--           "Foobar"
--         } -- you can also pass functions!
--       }
--     },
--     {prefix = "<leader>"}
--   )
--

-- " Map leader to which_key
-- nnoremap <silent> <leader> :<c-u> WhichKey '<Space>'<CR>
-- vnoremap <silent> <leader> :<c-u> WhichKeyVisual '<Space>'<CR>
-- " Create map to add keys to
-- let g:which_key_map =  {}
-- " Define a separator
-- let g:which_key_sep = '→'
-- set timeoutlen=750
-- " Not a fan of floating windows for this
-- let g:which_key_use_floating_win = 0
-- " Change the colors if you want
-- highlight default link WhichKey          Operator
-- highlight default link WhichKeySeperator DiffAdded
-- highlight default link WhichKeyGroup     Identifier
-- highlight default link WhichKeyDesc      Function
-- " Hide status line
-- autocmd! FileType which_key
-- autocmd  FileType which_key set laststatus=0 noshowmode noruler
-- \| autocmd BufLeave <buffer> set laststatus=2 noshowmode ruler
-- " Single mappings
-- let g:which_key_map['0'] = 'last tab'
-- let g:which_key_map['1'] = 'tab 1'
-- let g:which_key_map['2'] = 'tab 2'
-- let g:which_key_map['3'] = 'tab 3'
-- let g:which_key_map['4'] = 'tab 4'
-- let g:which_key_map['5'] = 'tab 5'
-- let g:which_key_map['6'] = 'tab 6'
-- let g:which_key_map['7'] = 'tab 7'
-- let g:which_key_map['8'] = 'tab 8'
-- let g:which_key_map['9'] = 'tab 9'
-- let g:which_key_map['='] = 'code format'
-- let g:which_key_map['s'] = 'save'
-- let g:which_key_map['h'] = 'win-left'
-- let g:which_key_map['j'] = 'win-down'
-- let g:which_key_map['k'] = 'win-up'
-- let g:which_key_map['l'] = 'win-right'
-- let g:which_key_map['/'] = [ '<Plug>NERDCommenterToggle'  , 'comment-toggle' ]
-- let g:which_key_map['q'] = 'quit'
-- let g:which_key_map['p'] = {
-- \  'name' : '+telescope',
-- \ 'f': 'files',
-- \ 'g': 'live grep',
-- \ 'w': 'search word at currsor',
-- \ 's': 'search input word',
-- \ 'd': 'dot files',
-- \ 'h': 'help tags',
-- \ 'c': 'git branch',
-- \ 'b': 'buffers'
-- \}
-- let g:which_key_map['v'] = {
-- \  'name' : '+vim',
-- \ 'e': 'edit .vimrc',
-- \ 'r': 'source .vimrc',
-- \ 'd': 'dot files',
-- \ 'h': 'help tags',
-- \}
-- let g:which_key_map['`'] = {
-- \ 'name' : '+wiki' ,
-- \ 'd' : 'diary',
-- \ 's' : 'export all to HTML',
-- \ 't' : 'open index in new tab',
-- \ 'w' : 'open wiki index',
-- \ ' ' :  {
-- \ 'name' : '+diary',
-- \ 'i' : 'diary generate links',
-- \ 't' : 'make diary in new tab',
-- \ 'y' : 'make yesterday diary',
-- \ 'm' : 'make tomorrow diary',
-- \ 'w' : 'make today diary',
-- \ },
-- \}
-- let g:which_key_map[' '] = {
-- \ 'name' : '+easymotion' ,
-- \}
-- let g:which_key_map['b'] = {
-- \ 'name' : '+buffer' ,
-- \ 'd' : ['bd', 'delete'],
-- \ 'n' : ['bnext'     , 'next-buffer'],
-- \ 'p' : ['bprevious' , 'previous-buffer'],
-- \ 's' : 'search-buffer'
-- \}
-- let g:which_key_map['K'] = {
-- \ 'name' : '+cheat-sheet' ,
-- \}
-- let g:which_key_map['c'] = {
-- \ 'name' : '+code',
-- \ 'c' : 'comment',
-- \ 'C' : 'code-snippets',
-- \ 'u' : 'uncomment',
-- \ '/' : 'toggle-comment',
-- \ 'f' : 'formatting',
-- \ '.' : 'code-action',
-- \ '>' : 'range-code-action',
-- \ 'r' : 'reference',
-- \ 'e' : 'rename',
-- \ 'i' : 'incomming-calls',
-- \ 'o' : 'outgoing-calls',
-- \ 'h' : 'signature-help',
-- \ 's' : 'document-symbol',
-- \ 'S' : 'workspace-symbol',
-- \ 'd' : 'document-diagnostics',
-- \ 'D' : 'workspace-diagnostics',
-- \ 'n' : 'next-diagnostic',
-- \ 'p' : 'prev-diagnostic',
-- \ 'k' : 'buf-hover',
-- \ 'g' : {
-- \ 'name': '+goto',
-- \ 'd' : 'definition'      ,
-- \ 'D' : 'declaration'      ,
-- \ 't' : 'type-definition' ,
-- \ 'i' : 'implementation'  ,
-- \ },
-- \}
-- let g:which_key_map['w'] = {
-- \ 'name' : '+windows' ,
-- \ 'w' : ['<C-W>w'     , 'other-window']          ,
-- \ 'd' : ['<C-W>c'     , 'delete-window']         ,
-- \ 'm' : ['<C-W>h'     , 'window-left']           ,
-- \ 'n' : ['<C-W>j'     , 'window-below']          ,
-- \ 'i' : ['<C-W>l'     , 'window-right']          ,
-- \ 'e' : ['<C-W>k'     , 'window-up']             ,
-- \ 'M' : ['<C-W>5<'    , 'expand-window-left']    ,
-- \ 'N' : [':resize +5'  , 'expand-window-below']   ,
-- \ 'I' : ['<C-W>5>'    , 'expand-window-right']   ,
-- \ 'E' : [':resize -5'  , 'expand-window-up']      ,
-- \ '=' : ['<C-W>='     , 'balance-window']        ,
-- \ 'h' : ['<C-W>s'     , 'split-window-below']    ,
-- \ 'v' : ['<C-W>v'     , 'split-window-right']    ,
-- \ 'r' : ['<C-W>r'     , 'rotate-window-up/left']    ,
-- \ 'R' : ['<C-W>R'     , 'rotate-window-bottom/right']    ,
-- \ }
-- " \ '?' : ['Windows'    , 'fzf-window']            ,
-- " " Register which key map
-- call which_key#register('<Space>', "g:which_key_map")
