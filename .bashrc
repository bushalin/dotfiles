case `uname` in
  "Linux") 
    export BREW_HOME="/home/linuxbrew/.linuxbrew/bin"
    export PATH="$PATH:$BREW_HOME"
  ;;
  Darwin) 
    echo "this is a mac filesystem"
  ;;
  *) echo default
esac

[ -f ~/.fzf.bash ] && source ~/.fzf.bash

export BAT_THEME=gruvbox-dark

eval $(thefuck --alias)

eval "$(zoxide init bash)"

alias cd="z"

eval "$(starship init bash)"
#

zstyle ':completion:*' matcher-list '' 'm:{a-zA-Z}={A-Za-z}' 'r:|=*' 'l:|=* r:|=*'
autoload -Uz compinit && compinit

# for docker to compile using the linux/amd64 instead of apple silicone

export DOCKER_DEFAULT_PLATFORM=linux/amd64

[ "$TERM" = "xterm-kitty" ] && alias ssh="kitty +kitten ssh"
# =================== hasib configuration ====================
#
# 
# tmux configuration for tmuxifier
export PATH="$HOME/.tmuxifier/bin:$PATH"
eval "$(tmuxifier init -)"
export TMUXIFIER_LAYOUT_PATH="$HOME/dotfiles/.tmux/tmux-layouts"

export EDITOR=nvim
source $HOME/dotfiles/.bash.alias
source $HOME/dotfiles/.bash.functions

# Set `Vi` mode for bash
set -o vi
