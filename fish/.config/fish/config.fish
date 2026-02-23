if status is-interactive
    # Commands to run in interactive sessions can go here
    set -U fish_greeting

    alias ssh-github="ssh-add $HOME/.ssh/github"

    alias rm="rm -i"
    alias mv="mv -i"

    alias fetch="fastfetch"
    alias lg="lazygit"

    zoxide init fish | source

    # For auto starting zellij
    #set ZELLIJ_AUTO_ATTACH true
    #set ZELLIJ_AUTO_EXIT true
    #eval (zellij setup --generate-auto-start fish | string collect)
end
