# So Homebrew is at the front of the PATH
export PATH=/usr/local/bin:$PATH


export PYTHONPATH="${PYTHONPATH}:/Users/quentin.laurent/models:/Users/quentin.laurent/models/slim"

export MALMO_XSD_PATH=~/reinforcement_learning/minecraft/Malmo-0.30.0-Mac-64bit_withBoost/Schemas


# TMUX Aliases
alias tmux-dev='tmux new-session -s dev -n ide "tmux source-file ~/.tmux/dev.conf"'

alias tmux-monitor='tmux new-session -s run -n monitor "tmux source-file ~/.tmux/monitor.conf"'

tmx () {
    tmux new-session -s dev$1 -n ide "tmux source-file ~/.tmux/dev.conf";
}
