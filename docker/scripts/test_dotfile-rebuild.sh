REPO_ROOT=$(dirname $(readlink -f $0))/../..

# remove last container
docker rm -f desktop-environment

# rebuild dotfiles
$REPO_ROOT/docker/scripts/build-dotfiles.sh

# start it up
$REPO_ROOT/docker/scripts/start.sh