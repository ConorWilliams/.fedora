if status is-interactive
    # Commands to run in interactive sessions can go here
end

alias config='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'

# Setup an agent
eval (ssh-agent -c) >/dev/null 

# Add other keys here
ssh-add ~/.ssh/github &>/dev/null

# Disable the greeting
function fish_greeting
end
