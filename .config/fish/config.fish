if status is-interactive
    # Commands to run in interactive sessions can go here
end

alias config='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'

eval (ssh-agent -c) && ssh-add ~/.ssh/github
