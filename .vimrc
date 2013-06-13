" Kompatibilitätsmodus zu vi abschalten
set nocompatible

" Use pathogen to easily modify the runtime path to include all
" plugins under the ~/.vim/bundle directory
execute pathogen#infect()
filetype plugin indent on

" change the mapleader from \ to ,
let mapleader=","

set hidden        " hide buffers instead of closing them
set wrap          " wrap lines (soft linebreaks)
set tabstop=4     " tab = 4 spaces
set backspace=indent,eol,start " allow backspacing over everything in insert mode
set autoindent    " always set autoindenting on
set copyindent    " copy the previous indentation on autoindenting
set cindent       " c-like indentation
set number        " always show line numbers
set shiftwidth=2  " number of spaces to use for autoindenting
set shiftround    " use multiple of shiftwidth when indenting with < and >

set showmatch     " show matching parenthesis
set ignorecase    " ignore case on search
set smartcase     " ignore case if search pattern is all lowercase, case-sensitive otherwise
set smarttab      " insert tabs on the start of a line according to shiftwidth, not tabstop
set hlsearch      " highlight search results
set incsearch     " show search matches as you type
set gdefault      " search/replace "globally" (on a line) by default

set pastetoggle=<F2> " when in insert mode, press <F2> to go to
                     "    paste mode, where you can paste mass data
                     "    that won't be autoindented

set mouse=a       " enable mouse
set switchbuf=useopen           " reveal already opened files from the
                                " quickfix window instead of opening new
                                " buffers
if v:version >= 730
    set undofile                " keep a persistent backup file
    set undodir=~/.vim/.undo,~/tmp,/tmp
endif
set nobackup                    " do not keep backup files, it's 70's style cluttering
set noswapfile                  " do not write annoying intermediate swap files,
                                "    who did ever restore from swap files anyway?
set directory=~/.vim/.tmp,~/tmp,/tmp
                                " store swap files in one of these directories
                                "    (in case swapfile is ever turned on)

set wildmenu                    " make tab completion for files/buffers act like bash
set wildmode=list:full          " show a list when pressing tab and complete
                                "    first full match
set wildignore=*.swp,*.bak,*.pyc,*.class
set visualbell                  " don't beep
set noerrorbells                " don't beep
set showcmd                     " show (partial) command in the last line of the screen
                                "    this also shows visual selection info
set nomodeline                  " disable mode lines (security measure)
set ttyfast                     " always use a fast terminal
set cursorline                  " underline the current line, for quick orientation

set history=1000         " remember more commands and search history
set undolevels=1000      " use many muchos levels of undo
set title                " change the terminal's title

" make p in Visual mode replace the selected text with the yank register
vnoremap p <Esc>:let current_reg = @"<CR>gvdi<C-R>=current_reg<CR><Esc>

" Easy window navigation
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l
nnoremap <leader>w <C-w>v<C-w>l

" navigation in long lines across visual wrap
nnoremap <buffer> k gk
nnoremap <buffer> j gj

" sudo write
cmap w!! w !sudo tee > /dev/null %

" Syntaxhervorhebung
syntax on

" Farbschema
" weitere Schemata sind im Verzeichnis /usr/local/share/vim/vim63/colors/
" aufgelistet
colors evening

" Einstellung des Zeichensatzes
"set encoding=iso-8859-15

" immer die Statuszeile mit dem Dateinamen anzeigen
set ls=2

" Ersetze Tabulatoren durch Leerzeichen
set expandtab


" zeigt unten links diverse Positionsinformationen der Schreibmarke
set ruler

" die Shell, die beim Starten von Programmen aus dem Editor heraus
" verwendet werden soll
set shell=/bin/bash


" zeigt beim Schließen von Klammern kurz an, wo sie geöffnet wurde

" zeigt in der Statuszeile an, ob man sich im Einfügemodus (INSERT) oder im
" Ersetzungsmodus (REPLACE) befindet
set showmode


" Function Keys
" run uncrustify on current file
map <F5> :%!uncrustify --replace --no-backup -l CPP -q<RETURN>
" toggle NerdTree
nmap <F6> :NERDTree<CR>
" toggle tagbar
nmap <F8> :TagbarToggle<CR>


" Kommentar einfuegen
"map <F8> :s:\(\s*\):\1// :<RETURN>j

" Kommentar loeschen                    
"map <F9> :s:\(\s*\)//\(\s*\):\1:<RETURN>j

" Korrupte (durch copy-paste entstandene) Zeilenanfaenge loeschen
"map <F7> :s:\s*\d*::<RETURN>j

"

"  einige Tastenbelegungen
" " Einfg
" map ^[[2~ i
" " Entf
" map ^? x
" " Pos1
" map ^[[1~ ^
" " Ende
" map ^[[4~ $
" " Bild auf
" map ^[[5~ <C-B>
" " Bild ab
" map ^[[6~ <C-F>
" " Rückschritt
" map ^H X
" " Pfeiltasten
" map ^[[B j
" map ^[[D h
" map ^[[C l
" map ^[[A k
"
"  Beispiel einer F-Tastenbelegung
" " F11 = zweimaliges Drücken von d
" " aktuelle Zeile löschen und im Puffer speichern
" map <F11> dd
" " F12 = betätigen von P (Achtung, ein kleines P hat eine leicht andere
" Bedeutung)
" " im Puffer gespeicherte Zeile(n) an aktueller Position einfügen
" map <F12> P
"
"  F9 schaltet syntaxhervorhebung ein und aus
" map <F9> :if has("syntax_items")<CR>syntax off<CR>else<CR>syntax
" on<CR>endif<CR><CR>
"
"  nicht an den Zeilenanfang bei Benutzung von Bild auf und Bild ab gehen
set nostartofline
"

" backspace taste
set bs=2

" highlight long lines
":au BufWinEnter * let w:m1=matchadd('Search', '\%<118v.\%>76v', -1)
":au BufWinEnter * let w:m2=matchadd('ErrorMsg', '\%>120v.\+', -1)
":au BufWinEnter * let w:m2=matchadd('Search', '\%>80v.\+', -1)
autocmd FileType c,cpp,h,hpp,hxx,py highlight OverLength ctermbg=DarkBlue ctermfg=white guibg=#FFD9D9
autocmd FileType c,cpp,h,hpp,hxx,py match OverLength /\%81v.\+/

" autorun ctags
" :au BufWritePost .c,.cpp,*.h silent! !ctags -R &

set path=.,,..,../..,./*,./*/*,../*,~/,~/**,/usr/include/*

function! Mosh_Flip_Ext()
  " Switch editing between .c* and .h* files (and more).
  " Since .h file can be in a different dir, call find.
  if match(expand("%"),'\.c') > 0
    let s:flipname = substitute(expand("%"),'\.c\(.*\)','.h',"")
    exe ":find " s:flipname
  elseif match(expand("%"),"\\.h") > 0
    let s:flipname = substitute(expand("%"),'\.h\(.*\)','.cpp',"")
    exe ":vsp " s:flipname
  endif
endfun

map <F4> :call Mosh_Flip_Ext()<CR>

" syntax highlighting for custom file extensions
au BufNewFile,BufRead *.launch set filetype=xml
au BufNewFile,BufRead *.gp,*.plot,*.plt,*.gnuplot set filetype=gnuplot
au BufNewFile,BufRead *.rst setlocal spell

" do not expand tabs for makefiles
:autocmd FileType make set noexpandtab
