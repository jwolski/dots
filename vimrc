" Bootstrap the vim; use the pathogen
runtime bundle/vim-pathogen/autoload/pathogen.vim
execute pathogen#infect()
syntax on
filetype plugin indent on

let mapleader=","

" Settings
set autoread
set autowrite
set background=dark
set cul
set encoding=utf-8
set expandtab
set foldmethod=indent
set hlsearch
set ignorecase
set incsearch
set lcs=nbsp:¬,tab:\ \ ,extends:»,precedes:«,trail:•
set list       " <list>        Turn list on and set characters below
set omnifunc=syntaxcomplete#Complete
set nornu
set number
set rtp+=~/.vim/bundle/powerline/powerline/bindings/vim
set shiftwidth=4
set showmatch " highlight matching [{()}]
set softtabstop=4 " number of spaces in tab when editing
set splitbelow
set splitright
set t_Co=256
set tabstop=4
set textwidth=80

" Colors
highlight Folded ctermbg=black ctermfg=blue

" Commands
command! TrimAll %s/\s\+$//e
command! FormatAll gqG<CR><Esc>

" Auto Commands
" Change color of active line when in and out of insert mode
autocmd FileType go nmap <leader>b <Plug>(go-build)
autocmd FileType go nmap <leader>c :GoCallees<CR>
autocmd FileType go nmap <leader>d :GoDef<CR>
autocmd FileType go nmap <leader>e :GoCallers<CR>
autocmd FileType go nmap <leader>i <Plug>(go-info)
autocmd FileType go nmap <leader>j :GoImplements<CR>
autocmd FileType go nmap <leader>k :GoInstall<CR>
autocmd FileType go nmap <leader>o :GoDoc<CR>
autocmd FileType go nmap <leader>r :GoReferrers<CR>
autocmd FileType go nmap <leader>s :call SameIdsToggle()<CR>
autocmd FileType markdown inoremap <expr> <C-l> AddListItem()
autocmd FileType markdown inoremap <expr> <C-r> ClearListItemCounter()
autocmd FileType markdown nmap <leader>p :LivedownPreview<CR>
autocmd InsertEnter * highlight CursorLine ctermbg=234 ctermfg=none
autocmd InsertLeave * highlight CursorLine ctermbg=233 ctermfg=None
autocmd QuickFixCmdPost *grep* cwindow

" Functions
function! NumberToggle()
  if(&relativenumber == 1)
      set norelativenumber
  else
      set relativenumber
  endif
endfunc

let g:same_ids_on = 0

function! SameIdsToggle()
    if g:same_ids_on
        GoSameIdsClear
        let g:same_ids_on = 0
    else
        GoSameIds
        let g:same_ids_on = 1
    endif
endfunction

" This is for easily adding numbered list items in Markdown documents.
let counter = 0

function! AddListItem()
    let g:counter += 1
    return g:counter . '. '
endfunction

function! ClearListItemCounter()
    let g:counter = 0
    return ''
endfunction

" Highlight text when lines goes beyond 80 characters.
highlight OverLength ctermbg=red ctermfg=white guibg=#592929
match OverLength /\%81v.\+/


" rainbox parens
let g:rainbow_active = 1 " 0 if you want to enable it later via :RainbowToggle

" Toggles
nnoremap <C-n> :call NumberToggle()<CR><Esc>

" Split/tab navigation
nnoremap <S-n> :tabprevious<CR>
nnoremap <S-m> :tabnext<CR>

nmap <C-i> :TagbarToggle<CR>
nmap <C-e> :NERDTreeToggle <Enter>

" Move selected lines of text easily
nnoremap <C-j> :m .+1<CR>==
nnoremap <C-k> :m .-2<CR>==
vnoremap <C-j> :m '>+1<CR>gv=gv
vnoremap <C-k> :m '<-2<CR>gv=gv

nnoremap <C-w><C-D> :let _A=@/<Bar>:%A/\A\+$//e<Bar>:let @/=_A<Bar>:nohl<CR>
nnoremap <C-w><C-v> :e ~/.vimrc<CR>
nnoremap <C-w><C-p> :quitall
nnoremap <C-w><C-l> :lclose<CR>

" Fancy Plugin Configuration

" Cmd+T
let g:CommandTCancelMap='<C-z>'
let g:CommandTMaxHeight=10
let g:CommandTHighlightColor='CursorLineNr'
set wildignore+=*.pyc,*.so,*.o,**/node_modules/**/*,*.png,*.tap,**/target/* " Have Cmd+T ignore these files

" neocomplete
let g:acp_enableAtStartup = 0
let g:neocomplete#enable_at_startup = 1
let g:neocomplete#enable_smart_case = 1
inoremap <expr> <TAB> pumvisible() ? "\<C-n>" : "\<TAB>"
inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>

function! s:my_cr_function()
    return (pumvisible() ? "\<C-y>" : "" ) . "\<CR>"
endfunction

" NERDTree
" <m> to open help menu (create, delete, move files)
" <C> to change root to selected dir
" <s> to open file in vertical split
" <i> to open file in horizontal split

" Tagbar
let g:tagbar_type_markdown = {
    \ 'ctagstype': 'markdown',
    \ 'ctagsbin' : '~/.vim/markdown2ctags/markdown2ctags.py',
    \ 'ctagsargs' : '-f - --sort=yes',
    \ 'kinds' : [
        \ 's:sections',
        \ 'i:images'
    \ ],
    \ 'sro' : '|',
    \ 'kind2scope' : {
        \ 's' : 'section',
    \ },
    \ 'sort': 0,
\ }
let g:tagbar_type_thrift = {
    \ 'ctagstype' : 'thrift',
    \ 'kinds'     : [
        \ 'e:enum',
        \ 'E:exception',
        \ 's:struct',
        \ 'S:service'
    \ ]
\ }

" vim-go
let g:go_fmt_command = "goimports"
" g:go_highlight_types kills Vim performance. Use only if you want your vim to
" be slow as a dog.
" let g:go_highlight_types = 1

" vim-markdown
let g:vim_markdown_new_list_item_indent = 0

" UltiSnips
let g:UltiSnipsExpandTrigger="<tab>"

set completeopt-=preview

cd ~/code/uber
