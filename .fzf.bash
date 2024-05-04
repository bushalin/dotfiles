# Setup fzf
# ---------

ARCH=`uname`

case "$ARCH" in
  Linux) 
    if [[ ! "$PATH" == */home/bushalin/.fzf/bin* ]]; then
      PATH="${PATH:+${PATH}:}/home/bushalin/.fzf/bin"
    fi
  ;;
  Darwin) 
    if [[ ! "$PATH" == */opt/homebrew/opt/fzf/bin* ]]; then
      export PATH="${PATH:+${PATH}:}/opt/homebrew/opt/fzf/bin"
    fi
    # Auto-completion
    [[ $- == *i* ]] && source "/opt/homebrew/opt/fzf/shell/completion.bash" 2> /dev/null

    # Key bindings
    source "/opt/homebrew/opt/fzf/shell/key-bindings.bash"
  ;;
  *)
    echo "unknown System Detected"
  ;;
esac

export FZF_CTRL_T_OPTS="--preview 'bat -n --color=always --line-range :500 {}'"
export FZF_ALT_C_OTPS="--preview 'eza --tree --color=always {} | head -200'"

# Advanced customization of fzf options via _fzf_comprun function
# - The first argument to the function is the name of the command.
# - You should make sure to pass the rest of the arguments to fzf.

_fzf_comprun() {
  local command=$1
  shift

  case "$command" in
    cd)           fzf --preview 'eza --tree --color=always {} | head -200' "$@" ;;
    export|unset) fzf --preview "eval 'echo \$' {}" "$@" ;;
    ssh)          fzf --preview 'dig {}'            "$@" ;;
    *)            fzf --preview "--preview 'bat -n --color=always --line-range :500 {}'" "$@" ;;
  esac
}

eval "$(fzf --bash)"
