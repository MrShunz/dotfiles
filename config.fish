if status is-interactive
    set -x PATH /opt/homebrew/opt/whois/bin /opt/homebrew/bin /opt/homebrew/sbin $PATH
    set -x HOMEBREW_NO_ENV_HINTS 1
    set -x GPG_TTY (tty)
    set -x EDITOR "code --wait"
    if test -e $HOME/.iterm2_shell_integration.fish
        source $HOME/.iterm2_shell_integration.fish
    end
end

# Aliases as functions
function ls
    ls -hsFG $argv
end

function tmux
    tmux -u -CC $argv
end
