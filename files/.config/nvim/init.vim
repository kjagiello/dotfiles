"set updatetime=250
set tags=.tags                  " Set ctags folder name
set ttimeoutlen=10              " faster leaving insert mode,
                                " makes e.g. airline snappier

" enable true colors support
set termguicolors

" Enable project specific configs
set exrc
set secure

" Map the leader key to SPACE
let mapleader="\<SPACE>"

" Plugins
call plug#begin('~/.vim/plugged')

" Make file browsing easier
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
let NERDTreeIgnore = ['\.pyc$', '__pycache__', '\.js.map$',
                    \ '\.DS_Store', 'venv']

" leader + n for finding current file in the file browser
nnoremap <leader>nf :NERDTreeFind<cr>

" leader + nn for toggling the file browser
nnoremap <Leader>nn :NERDTreeToggle<CR>

" Quick and easy file searching
" Plug '/usr/local/opt/fzf'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

" <C-p> to search files
nnoremap <silent> <C-p> :Files<CR>

" Buffer and ctag search
nmap <C-e> :Tags<CR>
nmap <Leader>f :Rg<Space>

" Search for visual selection
vnoremap <expr> <leader>f '"0y:Rg ' . @0 . '<CR>'

" Search for word under cursor i.e. usages
noremap <expr> ;; '"0yiw:Rg ' . @0 . '<CR>'

" Wrap only comments
set formatoptions-=t

" Seamless pane/window navigation for vim and tmux
Plug 'christoomey/vim-tmux-navigator'

" Dockerfile syntax support
Plug 'ekalinin/Dockerfile.vim'

" Fish script syntax
Plug 'dag/vim-fish'

" Mark which lines have changed
Plug 'airblade/vim-gitgutter'

" Git for VIM
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-rhubarb'

" Editor config
Plug 'editorconfig/editorconfig-vim'

" Molokai
Plug 'justinmk/molokai'
" Plug 'sonph/onehalf', {'rtp': 'vim/'}

" Dash integration
Plug 'rizzatti/dash.vim'
:nmap <Leader>d :Dash<CR>

" Solarized theme
" Plug 'altercation/vim-colors-solarized'

" Relative numbers toggle
" Plug 'jeffkreeftmeijer/vim-numbertoggle'

" Async linting
Plug 'dense-analysis/ale'

let g:ale_sign_error = "◉"
let g:ale_sign_warning = "◉"

let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'
let g:ale_sign_column_always = 1
let g:ale_fix_on_save = 1
let g:ale_lint_on_text_changed = 'never'
let g:ale_lint_on_enter = 0

let g:ale_open_list = 0
let g:ale_set_loclist = 1
let g:ale_set_quickfix = 0
let g:ale_list_window_size = 5

let g:ale_rust_cargo_use_clippy = executable('cargo-clippy')

let g:ale_fixers = {
    \ 'python': ['isort', 'black'],
    \ 'javascript': ['eslint', 'prettier'],
    \ 'typescript': ['eslint', 'prettier'],
    \ 'terraform': ['terraform'],
    \ 'javascriptreact': ['eslint'],
    \ 'rust': ['rustfmt']
    \ }
let g:ale_linters = {
    \ 'javascript': ['eslint'],
    \ 'terraform': [],
    \ 'python': ['flake8', 'mypy'],
    \ 'sql': [],
    \ 'rust': ['cargo']
    \}

" Map keys to navigate between lines with errors and warnings.
nnoremap <leader>an :ALENextWrap<cr>
nnoremap <leader>ap :ALEPreviousWrap<cr>

" Lightline instead of Airline
Plug 'itchyny/lightline.vim'
let g:lightline = {
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'fugitive', 'filename' ] ]
      \ },
      \ 'separator': { 'left': '', 'right': '' },
      \ 'subseparator': { 'left': '', 'right': '' }
      \ }

" Table mode
Plug 'dhruvasagar/vim-table-mode'

" Nomad syntax support
Plug 'b4b4r07/vim-hcl'

" Extended syntax support
Plug 'sheerun/vim-polyglot'
let g:polyglot_disabled = ['markdown', 'python']
let g:ftplugin_sql_omni_key = '<C-q>'

"Plug 'jiangmiao/auto-pairs'
Plug 'skywind3000/asyncrun.vim'
Plug 'easymotion/vim-easymotion'

" Livedown (Markdown live preview)
nmap gm :MarkdownPreview<CR>
Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }, 'for': ['markdown', 'vim-plug']}
let g:mkdp_auto_close = 0

" Indentation based object
Plug 'michaeljsmith/vim-indent-object'

Plug 'autozimu/LanguageClient-neovim', {'branch': 'next', 'do': 'bash install.sh'}
"
" Snippets
"Plug 'honza/vim-snippets'
"Plug 'SirVer/ultisnips'
"let g:UltiSnipsExpandTrigger="<c-g>"
"let g:UltiSnipsJumpBackwardTrigger="<A-h>"
"let g:UltiSnipsJumpForwardTrigger="<A-l>"
"let g:UltiSnipsEditSplit="vertical"
"let g:UltiSnipsSnippetsDir = "~/.vim/plugged/ultisnips/snips"

" Incremental tag generation
Plug 'ludovicchabant/vim-gutentags'
let g:gutentags_ctags_tagfile = '.tags'

" Performant highlightning
Plug 'norcalli/nvim-colorizer.lua'

" Colorscheme
" Plug 'arzg/vim-colors-xcode'

" Increment/decrement visual blocks
Plug 'triglav/vim-visual-increment'

" Test runner
Plug 'janko/vim-test'
let test#strategy = "neovim"
nmap <silent> t<C-n> :TestNearest<CR>
nmap <silent> t<C-f> :TestFile<CR>
nmap <silent> t<C-s> :TestSuite<CR>
nmap <silent> t<C-l> :TestLast<CR>
nmap <silent> t<C-g> :TestVisit<CR>

" Tree-sitter
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}

" Tree-sitter debugging utilities
Plug 'nvim-treesitter/playground'

" Debuger adapter protocol
Plug 'mfussenegger/nvim-dap'

" Tree-sitter compatible schema
Plug 'sainnhe/sonokai'

" Python scratchpad
Plug 'metakirby5/codi.vim'

" Plantumi support
Plug 'scrooloose/vim-slumlord'
Plug 'aklt/plantuml-syntax'

" Time logging
"Plug '/Users/kjagiello/Dev/private/timelog'
" nnoremap <Leader>ln :TimelogNewTask<CR>
" nnoremap <Leader>le :TimelogEndTask<CR>
" nnoremap <Leader>ld :TimelogCalculateSessionDuration<CR>
" nnoremap <Leader>ls :TimelogSummarise<CR>
" nnoremap <Leader>ljp :TimelogJumpToProject<CR>
" nnoremap <Leader>ljt :TimelogJumpToTask<CR>
" nnoremap <Leader>lje :TimelogJumpToEndTime<CR>

" Svelte
Plug 'evanleck/vim-svelte', {'branch': 'main'}

" Lezer grammar support
Plug 'nono/lezer.vim'
call plug#end()

" Settings
set ts=4 sw=4
set number
set noerrorbells
set nohlsearch
set hidden
colorscheme molokai

" Use the system clipboard
let g:clipboard = {'copy': {'+': 'pbcopy', '*': 'pbcopy'}, 'paste': {'+': 'pbpaste', '*': 'pbpaste'}, 'name': 'pbcopy', 'cache_enabled': 0}
set clipboard+=unnamedplus

" Whitespace
fun! TrimWhitespace()
    let l:save_cursor = getpos('.')
    %s/\s\+$//e
    call setpos('.', l:save_cursor)
endfun

" Shortcut for saving of buffers
nnoremap <Leader>w :w<CR>

" Column 80 marker
set colorcolumn=80

:set autoread

" Tab config for different syntaxes
set tabstop=2 softtabstop=2 expandtab shiftwidth=2 smarttab
autocmd FileType yaml setlocal ts=2 sts=2 sw=2 expandtab
autocmd FileType cpp setlocal tabstop=8 softtabstop=0 expandtab shiftwidth=4 smarttab
autocmd FileType vim setlocal tabstop=8 softtabstop=0 expandtab shiftwidth=4 smarttab
autocmd FileType erl setlocal tabstop=8 softtabstop=0 expandtab shiftwidth=4 smarttab
autocmd FileType tf setlocal ts=2 sts=2 sw=2 expandtab
autocmd FileType scss setlocal ts=2 sts=2 sw=2 expandtab
autocmd FileType html setlocal ts=2 sts=2 sw=2 expandtab
autocmd FileType ejs setlocal ts=2 sts=2 sw=2 expandtab
autocmd FileType make setlocal noexpandtab
autocmd BufRead,BufNewFile *.tf set filetype=terraform
autocmd BufRead,BufNewFile *.tfvars set filetype=terraform

" Python support
let g:python_host_prog = '/Users/kjagiello/.pyenv/shims/python'
let g:python3_host_prog = '/Users/kjagiello/.pyenv/shims/python3.9'

" Speeding up editorconfig by using the external command
let g:EditorConfig_core_mode = 'external_command'

" Enable modeline
set modeline
set modelines=5

" Mouse support
set mouse=a

" Expand pane
nmap + :only<CR>

" ctags
function! BuildPythonCTags()
    echohl Comment
    echo 'Building ctags... '
    silent! exe "!ctags -R -f .tags"
    redraw!
    echohl String
    echo "Successfully generated ctags!"
    echohl None
endfunction

nmap <F12> :call BuildPythonCTags()<CR>

" Close bufferr without closing split
:nmap <Leader>q :bp\|bd #<CR>

" Replace all occurences of word under the cursor
nmap <leader>r *Ncgn

" Hide split separators
set encoding=utf8
set fillchars=vert:│
highlight EndOfBuffer guifg=bg

" Relative line number on by default
" set relativenumber

augroup vimrc
    " Clean the autogroup
    autocmd!

    " Open quickfix window when text adds to it
    autocmd QuickFixCmdPost * botright copen 8

    " Trim whitespace
    autocmd BufWritePost * :call TrimWhitespace()

    " Update git gutter after ALE has run all the fixers
    autocmd User ALELintPost GitGutter
augroup END
set signcolumn=yes

" Nicer comment line joining SHIFT-J
if v:version > 703 || v:version == 703 && has('patch541')
  set formatoptions+=j
endif

" Needs to be set last in order to override the theme defaults
highlight ALEErrorSign ctermfg=9 ctermbg=235 guifg=#C30500 guibg=#232526
highlight ALEWarningSign ctermfg=11 ctermbg=235 guifg=#ED6237 guibg=#232526

" Live results
set inccommand=nosplit

" LSP support
let g:LanguageClient_autoStart = 1
let g:LanguageClient_loadSettings = 1
let g:LanguageClient_settingsPath = '~/.vim/settings.json'
let g:LanguageClient_serverCommands = {
    \ 'python': ['pyls'],
    \ 'javascript': ['javascript-typescript-stdio'],
    \ 'javascript.jsx': ['javascript-typescript-stdio'],
    \ 'typescript': ['javascript-typescript-stdio'],
    \ 'rust': ['rust-analyzer'],
    \ }

autocmd FileType python setlocal omnifunc=LanguageClient#complete
autocmd FileType javascript setlocal omnifunc=LanguageClient#complete
autocmd FileType javascript.jsx setlocal omnifunc=LanguageClient#complete
autocmd FileType ts setlocal omnifunc=LanguageClient#complete
autocmd FileType svelte setlocal omnifunc=LanguageClient#complete

nnoremap <leader>dp oimport pdb; pdb.set_trace()<Esc>
nnoremap <leader>db obreakpoint()<Esc>

function! SetLSPShortcuts()
  nnoremap <leader>ld :call LanguageClient#textDocument_definition()<CR>
  nnoremap <leader>lr :call LanguageClient#textDocument_rename()<CR>
  nnoremap <leader>lf :call LanguageClient#textDocument_formatting()<CR>
  nnoremap <leader>lt :call LanguageClient#textDocument_typeDefinition()<CR>
  nnoremap <leader>lx :call LanguageClient#textDocument_references()<CR>
  nnoremap <leader>la :call LanguageClient_workspace_applyEdit()<CR>
  nnoremap <leader>lc :call LanguageClient#textDocument_completion()<CR>
  nnoremap <leader>lh :call LanguageClient#textDocument_hover()<CR>
  nnoremap <leader>ls :call LanguageClient_textDocument_documentSymbol()<CR>
  nnoremap <leader>lm :call LanguageClient_contextMenu()<CR>
endfunction()

augroup LSP
  autocmd!
  autocmd FileType rust,cpp,c,python,javascript,javascript.jsx call SetLSPShortcuts()
augroup END

:command! -range FormatSQL <line1>,<line2>!sqlformat --reindent_aligned --keywords upper --identifiers lower -
:command! -range FormatJSON <line1>,<line2>!jq .

" Syntax fencing in Markdown
let g:markdown_fenced_languages = ['html', 'json', 'typescript', 'python']
autocmd BufNewFile,BufReadPost *.md set filetype=markdown

" Do not automatically select the first alternative in omni complete
:set completeopt=longest,menuone

" Git-related mappings
nnoremap <Leader>gs :Gstatus<CR>
nnoremap <Leader>gc :Gcommit<CR>
nnoremap <Leader>ga :GitGutterStageHunk<CR>
nnoremap <Leader>gr :GitGutterUndoHunk<CR>

" FZF floating window support
" let g:fzf_layout = { 'window': 'call FloatingFZF()' }
" function! FloatingFZF()
"   let buf = nvim_create_buf(v:false, v:true)
"   call setbufvar(buf, '&signcolumn', 'no')
"
"   let width = float2nr(&columns - (&columns * 2 / 10))
"   let height = &lines - 3
"   let y = &lines - 3
"   let x = float2nr((&columns - width) / 2)
"
"   let opts = {
"         \ 'relative': 'editor',
"         \ 'row': y,
"         \ 'col': x,
"         \ 'width': width,
"         \ 'height': height
"         \ }
"
"   call nvim_open_win(buf, v:true, opts)
" endfunction
"
" au FileType fzf set nonu nornu
" highlight NormalFloat cterm=NONE ctermfg=14 ctermbg=0 gui=NONE guifg=#d9d9d9 guibg=#242424

" lua require'colorizer'.setup()

" CTRL-A CTRL-Q to select all and build quickfix list
" Credit: https://github.com/junegunn/fzf.vim/issues/185#issuecomment-322120216
function! s:build_quickfix_list(lines)
  call setqflist(map(copy(a:lines), '{ "filename": v:val }'))
  copen
  cc
endfunction

let g:fzf_action = {
  \ 'ctrl-q': function('s:build_quickfix_list'),
  \ 'ctrl-t': 'tab split',
  \ 'ctrl-x': 'split',
  \ 'ctrl-v': 'vsplit' }

let $FZF_DEFAULT_OPTS = '--bind ctrl-a:select-all'

" Tree-sitter conf
lua <<EOF
require'nvim-treesitter.configs'.setup {
  ensure_installed = "maintained", -- one of "all", "maintained" (parsers with maintainers), or a list of languages
  highlight = {
    enable = true,              -- false will disable the whole extension
  },
  playground = {
    enable = true,
    disable = {},
    updatetime = 25, -- Debounced time for highlighting nodes in the playground from source code
    persist_queries = false -- Whether the query persists across vim sessions
  }
}
EOF

" Disable spellchecking for now as it is not really compatible with treesitter
autocmd FileType * setlocal nospell

" DAP configuration
lua <<EOF
local dap = require('dap')
dap.adapters.python = {
  type = 'executable';
  command = 'python';
  args = { '-m', 'debugpy.adapter' };
}
EOF
