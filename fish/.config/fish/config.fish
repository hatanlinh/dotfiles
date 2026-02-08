if status is-interactive
    # Commands to run in interactive sessions can go here
    set -U fish_greeting

    alias ssh-github="ssh-add $HOME/.ssh/github"
    alias fetch="fastfetch"

    zoxide init fish | source
end
