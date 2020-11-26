REPO_ROOT=$(dirname $(readlink -f $0))/../..

# Export desktop environment shell configuration
eval "$($REPO_ROOT/docker/scripts/environment.sh)"

# Start the desktop environment container
$REPO_ROOT/docker/scripts/run.sh tmux
