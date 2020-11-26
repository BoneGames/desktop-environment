REPO_ROOT=$(dirname $(readlink -f $0))/../..

# Export desktop environment shell configuration
eval "$($REPO_ROOT/docker/scripts/environment.sh)"

# Ensure the desktop environment network exists
docker network create $DESKTOP_ENVIRONMENT_DOCKER_NETWORK

VIDEO_SOCKET=''

# If vmware machine
if [ -c /dev/vsock ]; then
    echo "you are using a vmware machine u little fucker"
    VIDEO_SOCKET='vsock'
elif [ -c /dev/vhost-vsock ]; then
    echo "you are using a virtualbox machine u little cunt"
    VIDEO_SOCKET='vhost-vsock'
else
    echo "you are using a host machine u braggart"
    VIDEO_SOCKET='video0'
fi
    
# Start the desktop environment container
$REPO_ROOT/docker/scripts/run.sh tmux

# Wait until the desktop environment container is running before proceeding
until docker inspect $(docker ps | grep desktop-environment | grep tmux | cut -f1 -d' ') | grep Status | grep -m 1 running >/dev/null; do sleep 1; done

# Start the desktop environment inside the container
$REPO_ROOT/docker/scripts/exec.sh /home/$DESKTOP_ENVIRONMENT_USER/.config/scripts/startup.sh
