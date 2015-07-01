" Jeames’ vimrc file

" Use Vim settings instead of Vi
set nocompatible

" Enable project-specific .vimrc files
set exrc

" Stop unsafe commands running in a .vimrc
set secure

" Automatically load changes in disk if the buffer hasn’t changed
set autoread

" Allot backspace in insert mode
set backspace=indent,eol,start

" Enable hidden buffers
set hidden

" put vim swap files into a shared directory rather than the standard '.%.swp'
" location alongside the file being edited
set dir=~/.vimswap

if has("vms")
  set nobackup          " do not keep a backup file, use versions instead
else
  set backup            " keep a backup file (restore to previous version)
  set backupdir=~/.vimbackup,.,~/tmp,~/
  set undofile          " keep an undo file (undo changes after closing)
  set undodir=~/.vimundo,.,~/tmp,~/
endif
set history=50          " keep 50 lines of command line history
set ruler               " show the cursor position all the time
set laststatus=2        " always show the status line
set showcmd             " display incomplete commands
set incsearch           " do incremental searching
set ignorecase          " case insensitive searching
set smartcase           " override ignorecase when pattern contains upper case characters
set expandtab           " use spaces instead of tabs by default
set sts=4 ts=4 sw=4     " default indentation

" Show invisible characters
set list
set listchars+=tab:‣\ ,eol:¬

" Line wrapping
set nowrap              " disable line wrapping
set sidescroll=5        " minimal number of columns to scroll horizontally
set listchars+=precedes:←,extends:→ " visual indicator of long lines

" Use an interesting status line, including shortened filenames (like in tabs)
set statusline=%{pathshorten(fnamemodify(expand('%f'),':~:.'))}[%{strlen(&fenc)?&fenc:'none'},%{&ff}]%h%m%r%y%=%c,%l/%L\ %P

" CTRL-U in insert mode deletes a lot.  Use CTRL-G u to first break undo,
" so that you can undo CTRL-U after inserting a line break.
inoremap <C-U> <C-G>u<C-U>

" In many terminal emulators the mouse works just fine, thus enable it.
if has('mouse')
  set mouse=a
endif

" Turn on syntax highliting
syntax on

" Color scheme
set background=dark
colorscheme solarized

" Only do this part when compiled with support for autocommands.
if has("autocmd")

  " Enable file type detection.
  " Use the default filetype settings, so that mail gets 'tw' set to 72,
  " 'cindent' is on in C files, etc.
  " Also load indent files, to automatically do language-dependent indenting.
  filetype plugin indent on

  " Put these in an autocmd group, so that we can delete them easily.
  augroup vimrcEx
  au!

  " Set up text width and format options
  autocmd FileType text,markdown,notes  setlocal autoindent
  autocmd FileType text,markdown,notes  setlocal formatoptions+=2
  autocmd FileType text,markdown,notes  setlocal sts=4 ts=4 sw=4
  autocmd FileType text,markdown,c,cpp,objc,objcpp setlocal textwidth=78
  autocmd FileType c,cpp,objc,objcpp    setlocal formatoptions+=ro
  autocmd FileType c,cpp,objc,objcpp    setlocal comments=b:///,sr:/**,mb:*\ ,ex:*/,b://,sr:/*,mb:*,ex:*/

  " Set up some file types
  autocmd BufRead,BufNewFile *.m set filetype=objc
  autocmd BufRead,BufNewFile Podfile,*.podspec,Gemfile set filetype=ruby

  " Swift files
  autocmd BufRead,BufNewFile *.swift set ts=2 sts=2 sw=2
  autocmd BufRead,BufNewFile *.swift set expandtab
  autocmd BufRead,BufNewFile *.swift set smartindent

  " When editing a file, always jump to the last known cursor position.
  " Don't do it when the position is invalid or when inside an event handler
  " (happens when dropping a file on gvim).
  " Also don't do it when the mark is in the first line, that is the default
  " position when opening a file.
  autocmd BufReadPost *
    \ if line("'\"") > 1 && line("'\"") <= line("$") |
    \   exe "normal! g`\"" |
    \ endif

  augroup END

else

  set autoindent                " always set autoindenting on

  set expandtab                 " always set expandtab on

endif " has("autocmd")
