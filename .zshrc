# No flow control if interactive
[[ $- == *i* ]] && $(whence -f stty) -ixon

NEWLINE=$'\n'
PROMPT="{%F{128}%D - %T%f} : [%F{green}%1~]${NEWLINE}%F{cyan}%n@%F{yellow}%m%f %# "

# Word boundaries
WORDCHARS=''

# Prefer Homebrew installed packages
export PATH=/opt/homebrew/opt/whois/bin:/opt/homebrew/bin:/opt/homebrew/sbin:$PATH

# History
export HISTSIZE=100000
export SAVEHIST=$HISTSIZE
setopt hist_ignore_all_dups
setopt hist_ignore_space
setopt hist_verify

# Custom aliases
alias ctags="ctags -R --c++-kinds=+p --fields=+iaS --extra=+qf --exclude=build --exclude='.git*' --exclude=CMakeLists.txt --append -f .tags"
alias ptags="\ctags -R --fields=+l --languages=python --python-kinds=-iv --exclude='.git*' --append -f .tags"
alias phptags="\ctags -R --totals=yes --tag-relative=yes --PHP-kinds=+cf --exclude='.git*' --exclude='*.js' --append -f .tags"
alias ls='eza'
alias updatedb='sudo /usr/libexec/locate.updatedb'
alias cat='bat --style=auto --theme="Solarized (dark)"'
alias pcat='bat --style=plain'
alias find='fd -s'
alias grep='rg'
alias diff='colordiff'
alias md2pdf='pandoc'
alias top='bpytop'

# Setup Homebrew autocompletion
FPATH=$(brew --prefix)/share/zsh/site-functions:$FPATH
# Disable dev hints
export HOMEBREW_NO_ENV_HINTS=1

# GPG for git
export GPG_TTY=$(tty)

# At Last, load autocompletion
autoload -Uz compinit && compinit
