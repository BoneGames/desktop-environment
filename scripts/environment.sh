# Desktop environment container user
DESKTOP_ENVIRONMENT_CONTAINER=desktop-environment
DESKTOP_ENVIRONMENT_GITHUB_TOKEN=9a70dae197ea089653e1dca5a43ff75057b3cf83
DESKTOP_ENVIRONMENT_USER=jackson
DESKTOP_ENVIRONMENT_HOME=/$DESKTOP_ENVIRONMENT_USER/home
DESKTOP_ENVIRONMENT_REGISTRY=sabrehagen

# Desktop environment configuration
echo DESKTOP_ENVIRONMENT_CONTAINER=$DESKTOP_ENVIRONMENT_CONTAINER
echo DESKTOP_ENVIRONMENT_GITHUB_TOKEN=$DESKTOP_ENVIRONMENT_GITHUB_TOKEN
echo DESKTOP_ENVIRONMENT_HOME=$DESKTOP_ENVIRONMENT_HOME
echo DESKTOP_ENVIRONMENT_USER=$DESKTOP_ENVIRONMENT_USER
echo DESKTOP_ENVIRONMENT_REGISTRY=$DESKTOP_ENVIRONMENT_REGISTRY

# Desktop environment application cache volumes
echo DESKTOP_ENVIRONMENT_CACHE_CHROME=$DESKTOP_ENVIRONMENT_HOME/.cache/google-chrome
echo DESKTOP_ENVIRONMENT_CACHE_CODE=$DESKTOP_ENVIRONMENT_HOME/.vscode
echo DESKTOP_ENVIRONMENT_CACHE_JUMP=$DESKTOP_ENVIRONMENT_HOME/.jump
echo DESKTOP_ENVIRONMENT_CACHE_YARN=$DESKTOP_ENVIRONMENT_HOME/.cache/yarn
echo DESKTOP_ENVIRONMENT_CACHE_ZSH=$DESKTOP_ENVIRONMENT_HOME/.cache/zsh

# Desktop environment application configuration volumes
echo DESKTOP_ENVIRONMENT_CONFIG_CHROME=$DESKTOP_ENVIRONMENT_HOME/.config/google-chrome
echo DESKTOP_ENVIRONMENT_CONFIG_CODE=$DESKTOP_ENVIRONMENT_HOME/.config/Code
echo DESKTOP_ENVIRONMENT_CONFIG_GITHUB=$DESKTOP_ENVIRONMENT_HOME/.config/github/hub
echo DESKTOP_ENVIRONMENT_CONFIG_MUSIKCUBE=$DESKTOP_ENVIRONMENT_HOME/.musikcube
