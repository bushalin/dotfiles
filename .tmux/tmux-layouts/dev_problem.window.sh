# Set window root path. Default is `$session_root`.
# Must be called before `new_window`.
# window_root "~/hasib/problem-solving"

# Create new window. If no argument is given, window name will be based on
# layout file name.
new_window "dev"

# Split window into panes.
split_v 20
split_h 50

# Run commands.
run_cmd "nvim" 1     # runs in active pane
run_cmd "git status" 2
#run_cmd "date" 1  # runs in pane 1

# Paste text
#send_keys "top"    # paste into active pane
#send_keys "date" 1 # paste into pane 1

# Set active pane.
select_pane 1
