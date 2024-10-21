# Kill running processes
function pkill() {
    ps aux | fzf --height 40% --layout=reverse --prompt="SELECT process to kill: " | awk '{print $2}' | xargs -r sudo kill
}

# Kill tmux sessions
function tkill() {
    tmux kill-session -t $(tmux ls | fzf --height 40% --layout=reverse --prompt="SELECT session to kill: " | awk '{print $1}' )
}

function t_list() {
    PARAM=$1
    DIRS=$(find -L ~/AWL ~/hasib ~/dotfiles ~/hasib/repo ~/Hasib/Repositories -mindepth 1 -maxdepth 1 -type d 2> /dev/null)

    if [[ -z $PARAM ]]; then
        TMUX=$(tmux ls | awk '{print substr($1,1,length($1)-1)}')
        ZOXIDE=$(zoxide query --list)
        printf "%s\n%s\n%s" "$TMUX" "$ZOXIDE" "$DIRS" | sort --reverse
    fi

    case "$PARAM" in
        "-t")
            TMUX=$(tmux ls | awk '{print substr($1,1,length($1)-1)}')
            printf "%s\n" $TMUX
            ;;
        "-a")
            if [[ $(command -v zoxide) ]]; then
                DIRS=$(zoxide query --list)
                printf "%s" "$DIRS"
            fi
            ;;
        "-c")
            CONFIG=$(find -L ~/dotfiles -mindepth 1 -maxdepth 2 -type d 2> /dev/null)
            printf "%s" "$CONFIG"
            ;;
        *)
            TMUX=$(tmux ls | awk '{print substr($1,1,length($1)-1)}')
            ZOXIDE=$(zoxide query --list)
            printf "%s\n%s\n%s" "$TMUX" "$ZOXIDE" "$DIRS" | sort --reverse
            ;;
    esac
}

function t() {
    PARAM=$1
    DIRS=$(find -L ~/AWL ~/hasib ~/dotfiles ~/hasib/repo ~/Hasib/Repositories -mindepth 1 -maxdepth 1 -type d 2> /dev/null)

    if [[ -z $PARAM ]]; then
        if [ $(command -v zoxide) 2> /dev/null ]; then
            DIRS=$(zoxide query --list)
        fi
        SELECTED=$(printf "%s" "$DIRS" | fzf --height 40% --layout=reverse --border=rounded --border-label="Connect TMUX session" --bind 'tab:down,btab:up')
    else
        SELECTED=$PARAM
        if [ $(command -v zoxide) ] && [ $(zoxide query $PARAM) ]; then
            SELECTED=$(zoxide query $PARAM)
        fi
    fi

    SELECTED_NAME=$(basename "$SELECTED" | tr . _)
    TMUX_RUNNING=$(pgrep tmux)

    if [[ -z $SELECTED_NAME ]]; then
        return
    fi

    # OK - tmux is not running
    if [[ -z $TMUX_RUNNING ]]; then
        tmux new-session -s $SELECTED_NAME -c "$SELECTED"
        return
    fi

    # OK - tmux is running but client is not attached, session with selected_name does not exist
    if [[ -z $TMUX ]] && ! tmux has-session -t=$SELECTED_NAME 2> /dev/null; then
        tmux new-session -s $SELECTED_NAME -c "$SELECTED"
        tmux a -t $SELECTED_NAME
        return
    fi

    # OK - tmux is running but client is not attached, session with selected_name exists
    if [[ -z $TMUX ]] && tmux has-session -t=$SELECTED_NAME 2> /dev/null; then
        tmux a -t $SELECTED_NAME
        return
    fi

    # OK - tmux is running and client is attached, session with selected_name does not exist
    if [[ ! -z $TMUX ]] && ! tmux has-session -t=$SELECTED_NAME 2> /dev/null; then
        tmux new-session -ds $SELECTED_NAME -c "$SELECTED"
        tmux switch-client -t $SELECTED_NAME
        return
    fi

    # OK - tmux is running and client is attached, session with selected_name exists
    if [[ ! -z $TMUX ]] && tmux has-session -t=$SELECTED_NAME 2> /dev/null; then
        tmux switch-client -t $SELECTED_NAME
        return
    fi
}
