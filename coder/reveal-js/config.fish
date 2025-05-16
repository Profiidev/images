set fish_greeting
export EDITOR=nano

nvm use 22 > /dev/null

if status is-interactive
    # Commands to run in interactive sessions can go here
    starship init fish | source

    zoxide init --cmd cd fish | source

    fastfetch
end
