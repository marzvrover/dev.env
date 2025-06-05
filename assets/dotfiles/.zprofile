### CONFIGURATION

## OPTIONS
# rbenv | rvm
RUBY_VERSION_MANAGER="rbenv"

## COMPUTED
# arm64 | x86_64
MACHINE_ARCH="$(uname -m)"
# darwin | linux
MACHINE_KERNEL="$(uname -s | tr '[:upper:]' '[:lower:]')"

### / CONFIGURATION

# homebrew
if [[ "$MACHINE_KERNEL" == "darwin" ]]; then
  if [[ "$MACHINE_ARCH" == "arm64" ]]; then
    eval $(/opt/homebrew/bin/brew shellenv)
  elif [[ "$MACHINE_ARCH" == "x86_64" ]]; then
    eval $(/usr/local/bin/brew shellenv)
  fi
elif [[ "$MACHINE_KERNEL" == "linux" ]]; then
  eval $(/home/linuxbrew/.linuxbrew/bin/brew shellenv)
fi
