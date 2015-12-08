" **************************************************************************** #
"                                                                             #
"                                                        :::      ::::::::    #
"    .myvirmc                                           :+:      :+:    :+:    #
"                                                    +:+ +:+         +:+      #
"    By: nlory-ma <marvin@42.fr>                    +#+  +:+       +#+         #
"                                               +#+#+#+#+#+   +#+            #
"   Created: 2015/12/05 19:01:05 by nlory-ma          #+#    #+#              #
"    Updated: 2015/12/05 19:23:36 by nlory-ma         ###   ########.fr        #
"                                                                             #
" **************************************************************************** #



"-------INITIALISATION VIM

set nocompatible
set encoding=utf-8
set fileencoding=utf-8
filetype on
filetype plugin indent on


"---------PARTIE OBLIGATOIRE

"Show current line
set cursorline

"Show current column
set ruler


" Un code en C est automatiquement indenté avec des tabulations
set autoindent
set cindent
set tabstop=4
set shiftwidth=4
set smartindent
set backspace=indent,eol,start

"Tout ce qui est au dela de 80 caractere est en rouge

set textwidth=80
highlight OverLength ctermbg=red ctermfg=white guibg=#592929
match OverLength /\%81v.*/
set colorcolumn=80



" Une paire (parenthèse ou accolade) est automatique fermée lorsque vous saisissez l’élément ouvrant
inoremap ( ()<Esc>i
inoremap { {}<Esc>i

" rajouter une ligne vide entre les {} :
inoremap { {<CR><BS>}<Esc>ko

"Ls tabs sont des >>> et les espaces de ...
"Deux espaces coteacote sont highlihtes
"Un espace avant un retour a la ligne est highlighte
exec "set listchars=tab:\uBB\uBB,trail:\uB7,nbsp:~"
set list

"Les espaces au dela de la ligne sont en rouges

highlight NoSpacesEOL ctermbg=red ctermfg=white guibg=#592929
match NoSpacesEOL / \+$/

"highlight NoTabsEOL ctermbg=red ctermfg=white guibg=#592929
"match NoTabsEOL /\+$/


"------Better command completion

set wildmenu
set wildmode=list:longest
set hlsearch
set incsearch
set ignorecase
set showmatch
set showcmd
set showmode
set clipboard=autoselect
set autoread



"----utils tools


set noerrorbells
set completeopt=longest,menuone
set visualbell t_vb=
syntax on
colorscheme pablo
set number
set mouse=a
augroup PatchDiffHighlight
	autocmd!
	autocmd BufEnter *.patch, *.rej, *.diff syntax enable
augroup END
let mapleader = ','
noremap <C-h> <C-w>h
noremap <C-j> <C-w>j
noremap <C-k> <C-w>k
noremap <C-l> <C-w>l
noremap <leader>l :Align
nnoremap <leader>a :Ag<space>
nnoremap <leader>b :CtrlPBuffer<CR>
nnoremap <leader>d :NERDTreeToggle<CR>
nnoremap <leader>f :NERDTreeFind<CR>
nnoremap <leader>t :CtrlP<CR>
nnoremap <leader>T :CtrlPClearCache<CR>:CtrlP<CR>
nnoremap <leader>] :TagbarToggle<CR>
nnoremap <leader><space> :call whitespace#strip_trailing()<CR>
nnoremap <leader>g :GitGutterToggle<CR>
noremap <silent> <leader>V :source ~/.vimrc<CR>:filetype detect<CR>:exe ":echo 'vimrc reloaded'"<CR>




"----Creation du Dossier de sauvegarde s'il n'existe pas
"---- Les fichiers de sauvegarde sont archives dans ~/.vim.d

"if !exists("~/.vim.d")
" set backupdir=~/.vim.d
" set backup()
"endif

function! InitBackupDir()
  if has('win32') || has('win32unix') "windows/cygwin
    let l:separator = '_'
  else
    let l:separator = '.'
  endif
  let l:parent = $HOME . '/' . l:separator . 'vim/'
  let l:backup = l:parent . 'backup/'
  let l:tmp = l:parent . 'tmp/'
  if exists('*mkdir')
    if !isdirectory(l:parent)
      call mkdir(l:parent)
    endif
    if !isdirectory(l:backup)
      call mkdir(l:backup)
    endif
    if !isdirectory(l:tmp)
      call mkdir(l:tmp)
    endif
  endif
  let l:missing_dir = 0
  if isdirectory(l:tmp)
    execute 'set backupdir=' . escape(l:backup, ' ') . '/,.'
  else
    let l:missing_dir = 1
  endif
  if isdirectory(l:backup)
    execute 'set directory=' . escape(l:tmp, ' ') . '/,.'
  else
    let l:missing_dir = 1
  endif
  if l:missing_dir
    echo 'Warning: Unable to create backup directories:' l:backup 'and' l:tmp
    echo 'Try: mkdir -p' l:backup
    echo 'and: mkdir -p' l:tmp
    set backupdir=.
    set directory=.
  endif
endfunction
call InitBackupDir()
