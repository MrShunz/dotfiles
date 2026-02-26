if status is-interactive
    set -x PATH /opt/homebrew/opt/whois/bin /opt/homebrew/bin /opt/homebrew/sbin $PATH
    set -x HOMEBREW_NO_ENV_HINTS 1
    set -x GPG_TTY (tty)
    set -x EDITOR "code --wait"
    if test -e $HOME/.iterm2_shell_integration.fish
        source $HOME/.iterm2_shell_integration.fish
    end

# Aliases as functions
    function ls
        command ls -hsFG $argv
    end

    function tmux
        command tmux -u -CC $argv
    end

    function patch
        command gpatch
    end
end

# Added by OrbStack: command-line tools and integration
# This won't be added again if you remove it.
source ~/.orbstack/shell/init2.fish 2>/dev/null || :
