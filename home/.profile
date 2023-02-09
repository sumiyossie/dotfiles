# ~/.profile: executed by the command interpreter for login shells.
# This file is not read by bash(1), if ~/.bash_profile or ~/.bash_login
# exists.
# see /usr/share/doc/bash/examples/startup-files for examples.
# the files are located in the bash-doc package.

# the default umask is set in /etc/profile; for setting the umask
# for ssh logins, install and configure the libpam-umask package.
#umask 022

if [ -n "$SSH_TTY" ] ; then
  export MY_IS_SSH=1
fi

if [[ "$(uname -r)" == *microsoft* ]]; then
  export MY_IS_WSL=1
fi

if [ -f "$HOME/.env" ]; then
  . "$HOME/.env"
fi

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/bin" ] ; then
  PATH="$HOME/bin:$PATH"
fi

if [ -d "$HOME/.bin" ] ; then
  PATH="$HOME/.bin:$PATH"
fi

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/.local/bin" ] ; then
  PATH="$HOME/.local/bin:$PATH"
fi

# anyenv
if [ -d "$HOME/.anyenv/bin" ] ; then
  PATH="$HOME/.anyenv/bin:$PATH"
  if [ -n "`builtin command -v anyenv 2>/dev/null`" ]; then
    eval "$(anyenv init -)"
    if [ -n "`builtin command -v pyenv 2>/dev/null`" ]; then
      if [ -d "$(pyenv root)/plugins/pyenv-virtualenv" ] ; then
        eval "$(pyenv virtualenv-init -)"
      fi
    fi
  fi
fi

export GOENV_DISABLE_GOPATH=1
export GOPATH=$HOME/go

# if running bash
if [ -n "$BASH_VERSION" ]; then
  # include .bashrc if it exists
  if [ -f "$HOME/.bashrc" ]; then
    . "$HOME/.bashrc"
  fi
fi

. "$HOME/.cargo/env"

# >>> coursier install directory >>>
export PATH="$PATH:/home/yuki/.local/share/coursier/bin"
# <<< coursier install directory <<<
