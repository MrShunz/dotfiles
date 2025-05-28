# No flow control if interactive
[[ $- == *i* ]] && $(whence -f stty) -ixon

# Prefer Homebrew installed packages
export PATH=/opt/homebrew/opt/whois/bin:/opt/homebrew/bin:/opt/homebrew/sbin:$PATH

# Remove / from wordchars
export WORDCHARS='*?_-.[]~=&;!#$%^(){}<>'

# History
export HISTSIZE=100000
export SAVEHIST=$HISTSIZE
setopt hist_ignore_all_dups
setopt hist_ignore_space
setopt hist_verify

# Setup Homebrew autocompletion
FPATH=$(brew --prefix)/share/zsh/site-functions:$FPATH

# Disable dev hints
export HOMEBREW_NO_ENV_HINTS=1

# GPG for git
export GPG_TTY=$(tty)

# Use vscode as text editor
export EDITOR="code --wait"

# iTerm2 Shell Integration
test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"

# Aliases
alias ls='ls -hsFG'
alias tmux='tmux -u -CC'

# At Last, load autocompletion
autoload -Uz compinit && compinit
