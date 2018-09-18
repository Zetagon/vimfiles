if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')

Plug 'prabirshrestha/async.vim'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-sleuth'
Plug 'tpope/vim-commentary'
Plug 'christoomey/vim-tmux-navigator'
Plug 'morhetz/gruvbox'
Plug 'rust-lang/rust.vim'
Plug 'vim-syntastic/syntastic'



Plug 'autozimu/LanguageClient-neovim', {
    \ 'branch': 'next',
    \ 'do': 'bash install.sh',
    \ }
Plug 'shougo/denite.nvim'
Plug 'majutsushi/tagbar'
call plug#end()

" Colorscheme
  set t_Co=256
  let g:gruvbox_contrast_dark = "hard"
  set background=dark
  colorscheme gruvbox

" Folding
  set foldmethod=indent 
  set foldlevel=3

"misc
  set relativenumber      

"LSP
  " Required for operations modifying multiple buffers like rename.
  set hidden
  let g:LanguageClient_serverCommands = {
  \ 'rust': ['~/.cargo/bin/rustup', 'run', 'nightly', 'rls'],
  \ 'haskell': ['hie-wrapper'],
  \ }

" Syntastic
  set statusline+=%#warningmsg#
  set statusline+=%{SyntasticStatuslineFlag()}
  set statusline+=%*

  let g:syntastic_always_populate_loc_list = 1
  let g:syntastic_auto_loc_list = 1
  let g:syntastic_check_on_open = 1
  let g:syntastic_check_on_wq = 0

" General Keymaps 
  let mapleader = "\<space>"
  let maplocalleader = ','
  inoremap jk <ESC>
  set pastetoggle=<F5>
  nnoremap <F8> :TagbarToggle<CR>
  nnoremap <leader>fs :w<CR>
  nnoremap <leader>feR :so ~/.vim/vimrc<CR>
  nnoremap <leader>fed :e ~/.vim/vimrc<CR>
  " LSP keymaps
    nnoremap <silent> K :call LanguageClient#textDocument_hover()<CR>
    nnoremap <silent> gd :call LanguageClient#textDocument_definition()<CR>
    nnoremap <silent> <F2> :call LanguageClient_contextMenu()<CR>
    nmap  cr :call LanguageClient#textDocument_rename()<CR>
    nmap <silent> <LocalLeader>=  :call LanguageClient#textDocument_formatting()<CR>
    nmap <silent> ,rr :call LanguageClient#textDocument_references()<CR>
    nmap <silent> <LocalLeader>la :call LanguageClient#textDocument_codeAction()<CR>
    nmap <silent> <LocalLeader>ls :call LanguageClient#textDocument_documentSymbol()<CR>
