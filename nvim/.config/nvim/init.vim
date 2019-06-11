"set updatetime=250
set tags=.tags                  " Set ctags folder name
set ttimeoutlen=10              " faster leaving insert mode,
                                " makes e.g. airline snappier
"set ttyfast
"set lazyredraw

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
nnoremap <leader>H :NERDTreeFind<cr>

" leader + nn for toggling the file browser
nnoremap <Leader>nn :NERDTreeToggle<CR>

" Quick and easy file searching
Plug '/usr/local/opt/fzf'
Plug 'junegunn/fzf.vim'

" Use tmux split instead of a vim split as a workaround
" for messed up pane layout in vim
"let g:fzf_prefer_tmux = 0

" <C-p> to search files
nnoremap <silent> <C-p> :Files<CR>
"let g:fzf_layout = { 'window': '-tabnew' }

" Buffer and ctag search
nmap <C-e> :Tags<CR>
" nmap <C-e> :Tags<CR>
" nmap <C-S-e> :BTags<CR>
nmap <Leader>f :Ag<Space>
" nmap <C-s> :CtrlPBuffer<CR>
" nmap ;; :CtrlPtjump<CR>
" let g:ctrlp_tjump_only_silent = 1
" let g:ctrlp_map = ''

" Flake8 linting with async support
"Plug 'neomake/neomake'
"let g:neomake_python_enabled_makers = ['flake8']
"let g:neomake_python_flake8_maker = {
"  \ 'exe': '/opt/flake8/2.7.9/bin/flake8'
"  \ }
"let g:neomake_open_list = 1 " Open the quickfix list on make
":noremap <Leader>f :Neomake<CR>
"autocmd BufWritePost *.py Neomake

" Improved code folding for Python
"Plug 'tmhedberg/SimpylFold'
"set foldlevel=99 " Not autofolding by default

" Seamless pane/window navigation for vim and tmux
Plug 'christoomey/vim-tmux-navigator'

" For easy searching in files
Plug 'mileszs/ack.vim'
if executable('ag')
  let g:ackprg = 'ag --vimgrep'
endif

" Dockerfile syntax support
Plug 'ekalinin/Dockerfile.vim'

" JSX syntax support
" Plug 'chemzqm/vim-jsx-improve'
" Plug 'pangloss/vim-javascript'
" Plug 'mxw/vim-jsx'
" let g:jsx_ext_required = 0 " Enable the scheme for all JS-files

" Fish script syntax
Plug 'dag/vim-fish'

" Mark which lines have changed
Plug 'airblade/vim-gitgutter'

" Git for VIM
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-rhubarb'

" Typescript
"Plug 'leafgarland/typescript-vim'

" Better YAML support
" Plug 'chase/vim-ansible-yaml'

" Editor config
Plug 'editorconfig/editorconfig-vim'

" Molokai
" let g:molokai_original = 0
" let g:rehash256 = 1
Plug 'justinmk/molokai'
Plug 'sonph/onehalf', {'rtp': 'vim/'}

" Nginx configx syntax
"Plug 'nginx.vim'

" Dash integration
Plug 'rizzatti/dash.vim'
:nmap <Leader>d :Dash<CR>

" Fuzzy buffer, tag search
" Plug 'ctrlpvim/ctrlp.vim'

" Far
" Plug 'brooth/far.vim'
" let g:far#window_height = 11
" let g:far#preview_window_height = 20
" let g:far#window_min_content_height = 80
" let g:far#file_mask_favorites = ['**/*.py', '**/*.html', '**/*.js', '**/*.css', '**/*.*', '%']
" let g:far#source = 'agnvim'
" nmap <leader>f :F<space>

" Search for visual selection
vnoremap <expr> <leader>f '"0y:F ' . @0 . ' .<CR>'
" Search for word under cursor i.e. usages
" noremap <expr> ;; '"0yiw:F ' . @0 . ' .<CR>'


" Bufferline
"Plug 'bling/vim-bufferline'
"Plug 'ap/vim-buftabline'
"Plug 'vim-airline/vim-airline'
"Plug 'vim-airline/vim-airline-themes'

" Pretty icons
Plug 'ryanoasis/vim-devicons'

" Solarized theme
Plug 'altercation/vim-colors-solarized'

" Python import sorting
" Plug 'fisadev/vim-isort'
" let g:vim_isort_map = ''

" Relative numbers toggle
Plug 'jeffkreeftmeijer/vim-numbertoggle'

" Async linting
Plug 'w0rp/ale'

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

let g:ale_fixers = {'python': ['black', 'isort'], 'javascript': ['eslint'], 'terraform': ['terraform']}
let g:ale_linters = {'javascript': ['eslint'], 'terraform': ['tflint']}

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
      \ 'component_function': {
      \   'fugitive': 'LightlineFugitive',
      \ },
      \ 'separator': { 'left': '', 'right': '' },
      \ 'subseparator': { 'left': '', 'right': '' }
      \ }

function! LightlineFugitive()
    if exists("*fugitive#head")
        let branch = fugitive#head()
        return branch !=# '' ? ' '.branch : ''
    endif
    return ''
endfunction

" Table mode
Plug 'dhruvasagar/vim-table-mode'

" Nomad syntax support
Plug 'b4b4r07/vim-hcl'

" Flow support
"Plug 'flowtype/vim-flow'
"let g:flow#autoclose = 1
"let g:flow#qfsize = 0

" JS autolint
"Plug 'ruanyl/vim-fixmyjs'
"let g:fixmyjs_rc_path = '.eslintrc.js'
"au BufWritePre *.js :Fixmyjs
"au BufWritePre *.jsx :Fixmyjs
let g:javascript_plugin_flow = 1
Plug 'sheerun/vim-polyglot'
let g:polyglot_disabled = ['markdown']

"Plug 'jiangmiao/auto-pairs'
Plug 'skywind3000/asyncrun.vim'
Plug 'easymotion/vim-easymotion'
"Plug 'benmills/vimux'

" Livedown (Markdown live preview)
nmap gm :LivedownPreview<CR>
let g:livedown_open = 1
let g:livedown_port = 7331
let g:livedown_browser = 'chrome'
Plug 'shime/vim-livedown'

" Deoplete for async autocompletion
" if has('nvim')
"   Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
" else
"   Plug 'Shougo/deoplete.nvim'
"   Plug 'roxma/nvim-yarp'
"   Plug 'roxma/vim-hug-neovim-rpc'
" endif
" let g:deoplete#enable_at_startup = 1
"
" Plug 'davidhalter/jedi-vim'
" let g:jedi#completions_command = '<leader>j'
" Indentation based object
Plug 'michaeljsmith/vim-indent-object'

" Extra themes
" Plug 'ayu-theme/ayu-vim'
" Plug 'morhetz/gruvbox'
" Plug 'shinchu/lightline-gruvbox.vim'

Plug 'autozimu/LanguageClient-neovim', {'branch': 'next', 'do': 'bash install.sh'}
"
" Plug 'ncm2/ncm2'
" set completeopt=noinsert,menuone,noselect

" Plug 'roxma/nvim-yarp'

" Snippets
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
call plug#end()

" Settings
set ts=4 sw=4
set number
set noerrorbells
set nohlsearch
set hidden
colorscheme molokai
" let ayucolor="light"
" colorscheme ayu

" Use the system clipboard
let g:clipboard = {'copy': {'+': 'pbcopy', '*': 'pbcopy'}, 'paste': {'+': 'pbpaste', '*': 'pbpaste'}, 'name': 'pbcopy', 'cache_enabled': 0}
set clipboard+=unnamedplus
"set clipboard=unnamed

" Whitespace
":highlight ExtraWhitespace ctermbg=red guibg=red
":match ExtraWhitespace /\s\+$/

fun! TrimWhitespace()
    let l:save_cursor = getpos('.')
    %s/\s\+$//e
    call setpos('.', l:save_cursor)
endfun

" :noremap <Leader>W :call TrimWhitespace()<CR>
nnoremap <Leader>w :w<CR>
nnoremap R "_d

" Column 80 marker
set colorcolumn=80

:set autoread

" Highlight current line in the active window
" autocmd WinEnter * setlocal cursorline
" autocmd WinLeave * setlocal nocursorline

set tabstop=2 softtabstop=2 expandtab shiftwidth=2 smarttab
autocmd FileType yaml setlocal ts=2 sts=2 sw=2 expandtab
autocmd FileType cpp setlocal tabstop=8 softtabstop=0 expandtab shiftwidth=4 smarttab
autocmd FileType vim setlocal tabstop=8 softtabstop=0 expandtab shiftwidth=4 smarttab
autocmd FileType erl setlocal tabstop=8 softtabstop=0 expandtab shiftwidth=4 smarttab
"autocmd FileType js setlocal ts=2 sts=2 shiftwidth=2 expandtab
"autocmd FileType jsx setlocal ts=2 sts=2 shiftwidth=2 expandtab
"autocmd FileType javascript.jsx setlocal ts=2 sts=2 shiftwidth=2 expandtab
autocmd FileType tf setlocal ts=2 sts=2 sw=2 expandtab
autocmd FileType scss setlocal ts=2 sts=2 sw=2 expandtab
autocmd FileType html setlocal ts=2 sts=2 sw=2 expandtab
autocmd FileType ejs setlocal ts=2 sts=2 sw=2 expandtab
autocmd FileType make setlocal noexpandtab

" Python support
let g:python_host_prog = '/Users/kjagiello/.pyenv/shims/python'
" let g:python3_host_prog = '/Users/kjagiello/.pyenv/shims/python3'
let g:python3_host_prog = '/Users/kjagiello/.vim/neovim/bin/python'

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
    silent! exe "!ctags -R -f .tags --options=/Users/kjagiello/.ctags.cnf"
    redraw!
    echohl String
    echo "Successfully generated ctags!"
    echohl None
endfunction

nmap <F12> :call BuildPythonCTags()<CR>

" Airline config
" let g:airline#extensions#tabline#enabled = 1
" let g:airline#extensions#tabline#show_buffers=1
" let g:airline#extensions#tabline#show_tabs=1
" let g:airline_powerline_fonts = 1
" let g:airline_symbols = {}
" let g:airline_symbols.space = "\ua0"
" let g:airline_extensions = ['branch', 'tabline']

" Close bufferr without closing split
:nmap <Leader>q :bp\|bd #<CR>

" Replace all occurences of word under the cursor
nmap <leader>r *Ncgn

" Hide split separators
set encoding=utf8
set fillchars=vert:│
highlight EndOfBuffer guifg=bg

" Devicons
let g:webdevicons_enable = 1
let g:webdevicons_enable_nerdtree = 1
let g:webdevicons_conceal_nerdtree_brackets = 1
let g:WebDevIconsUnicodeGlyphDoubleWidth = 1
let g:WebDevIconsNerdTreeAfterGlyphPadding = ''

" Relative line number on by default
set relativenumber

augroup vimrc
    " Clean the autogroup
    autocmd!

    " Open quickfix window when text adds to it
    autocmd QuickFixCmdPost * botright copen 8

    " Trim whitespace
    autocmd BufWritePost * :call TrimWhitespace()

    " Update git gutter after ALE has run all the fixers
    autocmd User ALELintPost GitGutter

    " Place a dummy sign in the gutter to keep it always open
    " autocmd BufEnter * sign define dummy
    " autocmd BufEnter * execute 'sign place 9999 line=1 name=dummy buffer=' . bufnr('')

    " autocmd BufEnter * call ncm2#enable_for_buffer()
augroup END
set signcolumn=yes
" Abbreviations
ab pdb!! import pdb; pdb.set_trace()

" Nicer comment line joining SHIFT-J
if v:version > 703 || v:version == 703 && has('patch541')
  set formatoptions+=j
endif

" Needs to be set last in order to override the theme defaults
highlight ALEErrorSign ctermfg=9 ctermbg=235 guifg=#C30500 guibg=#232526
highlight ALEWarningSign ctermfg=11 ctermbg=235 guifg=#ED6237 guibg=#232526

" Live results
set inccommand=nosplit

" LSP (language server client)
" ----------------------------
let g:LanguageClient_autoStart = 1
let g:LanguageClient_loadSettings = 1
let g:LanguageClient_settingsPath = '~/.vim/settings.json'
let g:LanguageClient_serverCommands = {
    \ 'python': ['pyls'],
    \ 'javascript': ['javascript-typescript-stdio'],
    \ 'javascript.jsx': ['javascript-typescript-stdio'],
    \ }

" --conf pyls.plugins.pycodestyle.enabled=False --conf pyls.plugins.flake8.enabled=False

autocmd FileType python setlocal omnifunc=LanguageClient#complete
autocmd FileType javascript setlocal omnifunc=LanguageClient#complete
autocmd FileType javascript.jsx setlocal omnifunc=LanguageClient#complete

"nnoremap <silent> K :call LanguageClient#textDocument_hover()<CR>
"nnoremap <silent> gd :call LanguageClient#textDocument_definition()<CR>
"nnoremap <silent> gr :call LanguageClient#textDocument_rename()<CR>

function SetLSPShortcuts()
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
  autocmd FileType cpp,c,python,javascript,javascript.jsx call SetLSPShortcuts()
augroup END

"
" let g:ale_completion_enabled = 1
" call ale#linter#Define('javascript', {
" \   'name': 'mypyls',
" \   'lsp': 'socket',
" \   'address_callback': {-> '127.0.0.1:2088'},
" \   'language': 'javascript',
" \   'project_root_callback': 'ale#python#FindProjectRoot',
" \})

:command! -range FormatSQL <line1>,<line2>!sqlformat --reindent_aligned --keywords upper --identifiers lower -
:command! -range FormatJSON <line1>,<line2>!jq .

" Syntax fencing in Markdown
let g:markdown_fenced_languages = ['html', 'json', 'typescript', 'python']
autocmd BufNewFile,BufReadPost *.md set filetype=markdown


let g:UltiSnipsExpandTrigger="<c-g>"
let g:UltiSnipsJumpBackwardTrigger="<A-h>"
let g:UltiSnipsJumpForwardTrigger="<A-l>"
let g:UltiSnipsEditSplit="vertical"
let g:UltiSnipsSnippetsDir = "~/.vim/plugged/ultisnips/snips"
"inoremap <c-g> <c-r>=UltiSnips#ExpandSnippet()<cr>
