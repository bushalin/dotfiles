# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

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
# fzf-tab       autocomplete replacement for default zsh autocomplete

case `uname` in
  "Linux") 
    export BREW_HOME="/home/linuxbrew/.linuxbrew/bin"
    export PATH="$PATH:$BREW_HOME"
    ;;
  "Darwin") 
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
# Set Vi mode for zsh
set -o vi

export BAT_THEME=gruvbox-dark

eval $(thefuck --alias)

eval "$(zoxide init zsh)"

# eval "$(starship init zsh)"
#

zstyle ':completion:*' matcher-list '' 'm:{a-zA-Z}={A-Za-z}' 'r:|=*' 'l:|=* r:|=*'
autoload -Uz compinit && compinit

# for docker to compile using the linux/amd64 instead of apple silicone
export DOCKER_DEFAULT_PLATFORM=linux/amd64

[ "$TERM" = "xterm-kitty" ] && alias ssh="kitty +kitten ssh"

# Mac related
if [[ "$OS_VERSION" = "Darwin" ]]; then
  source /opt/homebrew/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
  source /opt/homebrew/share/powerlevel10k/powerlevel10k.zsh-theme

  # Load fzf-tab for better tab completion
  autoload -U compinit; compinit
  source ~/dotfiles/.config/fzf-tab/fzf-tab.plugin.zsh

  # disable sort when completing `git checkout`
  zstyle ':completion:*:git-checkout:*' sort false
  # set descriptions format to enable group support
  # NOTE: don't use escape sequences here, fzf-tab will ignore them
  zstyle ':completion:*:descriptions' format '[%d]'
  # set list-colors to enable filename colorizing
  zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}
  # force zsh not to show completion menu, which allows fzf-tab to capture the unambiguous prefix
  zstyle ':completion:*' menu no
  # preview directory's content with eza when completing cd
  zstyle ':fzf-tab:complete:cd:*' fzf --preview 'eza -1 --color=always $realpath'
  # switch group using `<` and `>`
  zstyle ':fzf-tab:*' switch-group '<' '>'
  zstyle ':fzf-tab:*' fzf-command ftb-tmux-popup
fi

# Linux related
if [[ "$OS_VERSION" = "Linux" ]]; then
  source /home/linuxbrew/.linuxbrew/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
  source ~/powerlevel10k/powerlevel10k.zsh-theme
  export NVM_DIR="$HOME/.nvm"
  [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
  [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
fi

# tmux configuration for tmuxifier
export PATH="$HOME/.tmuxifier/bin:$PATH"
eval "$(tmuxifier init -)"
export TMUXIFIER_LAYOUT_PATH="$HOME/dotfiles/.tmux/tmux-layouts"
export PATH="$PATH:/Applications/WezTerm.app/Contents/MacOS:$PATH"

# =================== hasib configuration ====================
# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

export EDITOR=nvim

source ~/.zsh.alias
source ~/.zsh.functions
