REPO_ROOT=$(dirname $(readlink -f $0))/../../..
IMAGE=$(basename $(dirname $0))

# Export desktop environment shell configuration
eval "$($REPO_ROOT/docker/scripts/environment.sh)"

echo $DESKTOP_ENVIRONMENT_CONTAINER_IMAGE-$IMAGE

# Start the desktop environment container
docker run \
  --detach \
  --device /dev/tty$DESKTOP_ENVIRONMENT_HOST_TTY \
  --env DISPLAY \
  --interactive \
  --name desktop-environment-tmux \
  --network host \
  --rm \
  --volume /var/run/docker.sock:/var/run/docker.sock \
  --volume DESKTOP_ENVIRONMENT_STATE_TMUX:$DESKTOP_ENVIRONMENT_STATE_TMUX \
  desktop-environment-tmux:latest
