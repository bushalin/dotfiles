# ZSH has been customized to look and feel good for my taste.
# We need to install additional tools to use these functionalities
#
# fzf           fuzzy finding
# bat           alternative of cat
# delta         beautiful diff
# eza           for tree view
# tldr          alternative of MAN pages
# thefuck       auto-correction of commands
# zoxide        better way of navigation
# starship      customizable prompt for any shell/ basically beautiful looking paths
# oh-my-zsh     framwork for managing shell configuration

case `uname` in
  "Linux") 
    export BREW_HOME="/home/linuxbrew/.linuxbrew/bin"
    export PATH="$PATH:$BREW_HOME"
  ;;
  Darwin) 
    export PATH="/opt/homebrew/opt/openssl@3.1/bin:$PATH"
    export PATH=$PATH:/Users/hasibulhasan/go/bin/
    # If you come from bash you might have to change your $PATH.
    export PATH=$HOME/bin:/usr/local/bin:$PATH
  ;;
  *) echo default
esac

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# =================== hasib configuration ====================
#
export BAT_THEME=gruvbox-dark

alias ls="eza --color=always --long --git --no-filesize --icons=always --no-time --no-user --no-permissions"

eval $(thefuck --alias)

eval "$(zoxide init zsh)"


eval "$(starship init zsh)"
#

zstyle ':completion:*' matcher-list '' 'm:{a-zA-Z}={A-Za-z}' 'r:|=*' 'l:|=* r:|=*'
autoload -Uz compinit && compinit

alias cd="z"
alias d="kitty +kitten diff"
alias link="ln -sf"

# for docker to compile using the linux/amd64 instead of apple silicone

export DOCKER_DEFAULT_PLATFORM=linux/amd64

[ "$TERM" = "xterm-kitty" ] && alias ssh="kitty +kitten ssh"
# =================== hasib configuration ====================
