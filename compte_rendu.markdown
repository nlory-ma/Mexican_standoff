## IV

### IV.I Fichier de config

#### Un code en C est automatiquement indenté avec des tabulations
:set autoindent
:set cindent
:set smartindent
:set tabstop=4

#### Une paire (parenthèse ou accolade) est automatique fermée lorsque vous saisissez l’élément ouvrant
:inoremap ( ()<Esc>i
:inoremap { {}<Esc>i
##### rajouter une ligne vide entre les {} :
inoremap { {<CR><BS>}<Esc>ko

#### La colonne de position du curseur est affichée
set ruler

#### Deux espaces côte-à-côte sont highlightés
:highlight DoubleWhitespace ctermbg=red guibg=red
:match DoubleWhitespace /  \+/

#### Un whitespace avant un retour à la ligne est highlighté
:hilight TrailingWhitespace
:match TrailingWhitespace /\s\+$/
##### Les deux en meme temps
match ExtraWhitespace ctermbg=red
match ExtaWhitespace /\s\+$\|  \+/

#### Les fichiers de sauvegarde (se terminant par ~) sont archivés dans un dossier spécifique à l’intérieur du dossier ~/.emacs.d
set backup()
set backupdir=~/.vim.d

### IV.2 Raccourcis clavier
20Gf<espace>10xx
3kP
3GwP
5G3dd3kp
<fn><F1>
gg=G
