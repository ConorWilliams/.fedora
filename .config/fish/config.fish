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


function fish_prompt
    set -l last_status $status
    # Prompt status only if it's not 0
    set -l stat
    if test $last_status -ne 0
        set stat (set_color red)"[$last_status] "(set_color normal)
    end

    string join '' -- (set_color green) (prompt_pwd) (set_color normal) (fish_git_prompt) ' $ ' $stat
end

