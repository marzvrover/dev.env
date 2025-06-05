## Expected variables:
## - MACHINE_KERNEL
## - MACHINE_ARCH
## - RUBY_VERSION_MANAGER

# starship
eval "$(starship init zsh)"

# zoxide
eval "$(zoxide init zsh)"

# GPG
export GPG_TTY=$(tty)

# SSH AGENT
if [[ "$MACHINE_KERNEL" == "darwin" ]]; then
  export SSH_AUTH_SOCK="$HOME/Library/Group\ Containers/2BUA8C4S2C.com.1password/t/agent.sock"
fi

# bun completions
[ -s "$HOME/.bun/_bun" ] && source "$HOME/.bun/_bun"

### PATH updates
## Excludes paths better defined in other sections

# Add /opt/bin to PATH for user-installed binaries
export PATH="$PATH:/opt/bin"
# Add $HOME/.composer/vendor/bin to PATH for composer-installed binaries
export PATH="$PATH:$HOME/.composer/vendor/bin"
# Add local user bin
export PATH="$PATH:$HOME/bin"
# Add cargo
export PATH="$PATH:$HOME/.cargo/bin"

### VERSION MANAGERS

# node version manager https://github.com/nvm-sh/nvm
export NVM_DIR="$HOME/.nvm"
[ -s "/opt/homebrew/opt/nvm/nvm.sh" ] && \. "/opt/homebrew/opt/nvm/nvm.sh"  # This loads nvm
[ -s "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm" ] && \. "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm"  # This loads nvm bash_completion

# python version manager https://github.com/pyenv/pyenv
export PYENV_ROOT="$HOME/.pyenv"
[[ -d $PYENV_ROOT/bin ]] && export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"
source "$HOME/.zsh_pyvenv"

# ruby version management
if [[ $RUBY_VERSION_MANAGER == "rbenv" ]]; then
  # ruby environment https://github.com/rbenv/rbenv
  eval "$(rbenv init -)"
elif [[ $RUBY_VERSION_MANAGER == "rvm" ]]; then
  # ruby virtual manager https://github.com/rvm/rvm
  export PATH="$PATH:$HOME/.rvm/bin"
fi

### Source additional configuration files
## Excludes paths better defined in other sections

source "$HOME/.zsh_copilot"
source "$HOME/.aliases"
