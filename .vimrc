set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
" call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

Plugin 'airblade/vim-gitgutter'                                                 
Plugin 'tpope/vim-endwise'                                                      
Plugin 'tpope/vim-rails'                                                        
Plugin 'tpope/vim-fugitive'                                                     
Plugin 'vim-airline/vim-airline'                                                
Plugin 'vim-airline/vim-airline-themes' 

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

" Git Gutter prefrences
set updatetime=250

" Airline prefrences
set laststatus=2
set ttimeoutlen=10

" 2 spaces not tabs
set autoindent
set smartindent
set tabstop=2
set shiftwidth=2
set expandtab

" side numbers
set number

" Strip whitespace on save
autocmd BufWritePre * :%s/\s\+$//e

"No arrow keys. :(
inoremap  <Up>     <NOP>
inoremap  <Down>   <NOP>
inoremap  <Left>   <NOP>
inoremap  <Right>  <NOP>
noremap   <Up>     <NOP>
noremap   <Down>   <NOP>
noremap   <Left>   <NOP>
noremap   <Right>  <NOP>

" 80 char delimeter
set colorcolumn=80

" Colorscheme
syntax enable
colorscheme monokai
let g:airline_theme='bubblegum'

"No .swp files
set noswapfile
set autoread

" Multiple buffers
set hidden
set runtimepath^=~/.vim/bundle/ag

" fzy
function! FzyCommand(choice_command, vim_command)
  try
    let output = system(a:choice_command . " | fzy ")
  catch /Vim:Interrupt/
    " Swallow errors from ^C, allow redraw! below
  endtry
  redraw!
  if v:shell_error == 0 && !empty(output)
    exec a:vim_command . ' ' . output
  endif
endfunction

nnoremap <C-p> :call FzyCommand("ag . --silent -l -g ''", ":e")<cr>
