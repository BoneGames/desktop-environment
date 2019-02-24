REPO_ROOT=$(dirname $(realpath $0))/../..

# Export desktop environment shell configuration
export $($REPO_ROOT/docker/scripts/environment.sh)

docker build \
  --build-arg DESKTOP_CONTAINER_BUILD_DATE=$(date +%s) \
  --build-arg DESKTOP_CONTAINER_GIT_SHA=$(git --git-dir $REPO_ROOT/.git rev-parse HEAD | cut -b 1-7) \
  --tag $DESKTOP_ENVIRONMENT_REGISTRY/$DESKTOP_ENVIRONMENT_CONTAINER:$DESKTOP_ENVIRONMENT_BRANCH \
  $REPO_ROOT
