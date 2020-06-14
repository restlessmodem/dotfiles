ZSH=/usr/share/oh-my-zsh/
ZSH_THEME="tjkirch"
DISABLE_AUTO_UPDATE="true"
plugins=(git archlinux npm sudo web-search)

ZSH_CACHE_DIR=$HOME/.cache/oh-my-zsh
if [[ ! -d $ZSH_CACHE_DIR ]]; then
  mkdir $ZSH_CACHE_DIR
fi

source $ZSH/oh-my-zsh.sh

# Manual config
alias telegram-cli='telegram-cli -N'
alias tty-clock='tty-clock -rscSbBn  -C $((1 + RANDOM % 7)) -f "%A, %Y-%m-%d"'
alias la='ls -al'
alias n26='python3 -m n26'

function latex_autocompile() {
	while true; do 
		inotifywait -qm --event modify --format '%w' $1 | pdflatex $1
	done
}

transfer() { if [ $# -eq 0 ]; then echo -e "No arguments specified. Usage:\necho transfer /tmp/test.md\ncat /tmp/test.md | transfer test.md"; return 1; fi
tmpfile=$( mktemp -t transferXXX ); if tty -s; then basefile=$(basename "$1" | sed -e 's/[^a-zA-Z0-9._-]/-/g'); curl --progress-bar --upload-file "$1" "https://transfer.sh/$basefile" >> $tmpfile; else curl --progress-bar --upload-file "-" "https://transfer.sh/$1" >> $tmpfile ; fi; cat $tmpfile; rm -f $tmpfile; } 

# Add Script folder to path
PATH=$PATH:/home/restlessmodem/Development/Scripts/
