if [ "$(uname)" == 'Darwin' ]; then
    export MY_IS_MAC=1
fi

if [[ "$(uname -r)" == *microsoft* ]]; then
    export MY_IS_WSL=1
fi

if [ -f "$HOME/.env" ]; then
    . "$HOME/.env"
fi

if [ -f "/opt/homebrew/bin/brew" ]; then
    eval "$(/opt/homebrew/bin/brew shellenv)"
fi

if [ -n "`builtin command -v brew 2>/dev/null`" ]; then
    HOMEBREW_PREFIX="$(brew --prefix)"
    if [[ -r "${HOMEBREW_PREFIX}/etc/profile.d/bash_completion.sh" ]]
    then
        source "${HOMEBREW_PREFIX}/etc/profile.d/bash_completion.sh"
    else
        for COMPLETION in "${HOMEBREW_PREFIX}/etc/bash_completion.d/"*
        do
            [[ -r "${COMPLETION}" ]] && source "${COMPLETION}"
        done
    fi
fi

export PATH="$HOME/.anyenv/bin:$PATH"

if [ -n "`builtin command -v anyenv 2>/dev/null`" ]; then
    eval "$(anyenv init -)"
    # いらないかも
    # if [ -n "`builtin command -v pyenv 2>/dev/null`" ]; then
    #     if [ -d "$(pyenv root)/plugins/pyenv-virtualenv" ] ; then
    #         eval "$(pyenv virtualenv-init -)"
    #     fi
    # fi
fi

export GOENV_DISABLE_GOPATH=1
export GOPATH=$HOME/go

export PATH="$PATH:$HOME/Library/Application Support/JetBrains/Toolbox/scripts"
export PATH="/opt/homebrew/opt/mysql-client/bin:$PATH"
export PATH="$PATH:$HOME/Library/Application Support/Coursier/bin"
export PATH=$PATH:$HOME/.bin

# if running bash
if [ -n "$BASH_VERSION" ]; then
    # include .bashrc if it exists
    if [ -f "$HOME/.bashrc" ]; then
        . "$HOME/.bashrc"
    fi
fi

# if type brew &>/dev/null
# then
#   HOMEBREW_PREFIX="$(brew --prefix)"
#   if [[ -r "${HOMEBREW_PREFIX}/etc/profile.d/bash_completion.sh" ]]
#   then
#     source "${HOMEBREW_PREFIX}/etc/profile.d/bash_completion.sh"
#   else
#     for COMPLETION in "${HOMEBREW_PREFIX}/etc/bash_completion.d/"*
#     do
#       [[ -r "${COMPLETION}" ]] && source "${COMPLETION}"
#     done
#   fi
# fi

