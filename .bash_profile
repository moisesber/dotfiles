disco_venv() {
        pyenv activate disco  && disco $@ && pyenv deactivate disco
}

alias disco=disco_venv

# dotfiles in git configs
# setup was based on https://www.atlassian.com/git/tutorials/dotfiles
alias config='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'

source ~/.git-prompt.sh
source ~/.git-completion.bash

export GIT_PS1_SHOWDIRTYSTATE=1
export GIT_PS1_SHOWSTASHSTATE=1
export GIT_PS1_SHOWUNTRACKEDFILES=1
export GIT_PS1_SHOWUPSTREAM=verbose # or auto to omit counts

# Source https://gist.github.com/justintv/168835
export PS1='\[\033[0;32m\]\[\033[0m\033[0;32m\]\u\[\033[0;36m\]@\[\033[0;36m\]\h:\w\[\033[0;32m\]$(__git_ps1)\n\[\033[0;32m\]└─\[\033[0m\033[0;32m\] \$\[\033[0m\033[0;32m\] ▶\[\033[0m\] '
if [ -f $(brew --prefix)/etc/bash_completion ]; then
. $(brew --prefix)/etc/bash_completion
fi


# set up docker machine VM
function docker_env {
    eval "$(docker-machine env default)"
}
docker_env

export PATH=/Library/Java/JavaVirtualMachines/jdk1.8.0_101.jdk/Contents/Home/bin/:$GOPATH/bin:$GOROOT/bin:$PATH

export JAVA_HOME=/Library/Java/JavaVirtualMachines/jdk-13.jdk/Contents/Home

HISTSIZE=
HISTFILESIZE=


alias dss='ldapsearch -H ldaps://ds-tierone-gew1.spotify.net/ -b dc=spotify,dc=net -D uid=moisesr,ou=people,ou=spotify,dc=spotify,dc=net -W'
DS_DEV_CREDS=$(cat /Users/moisesr/keepass/.ds-dev-moisesr-creds)
alias dssdev="ldapsearch -H ldaps://ds-dev.spotify.net -b dc=spotify,dc=net -D uid=moisesr,ou=people,ou=spotify,dc=spotify,dc=net -w $DS_DEV_CREDS"
alias anonymau5-read="ldapvi -h ldaps://ds-write-gew1.spotify.net/  -D uid=moisesr,ou=people,ou=spotify,dc=spotify,dc=net -b cn=read,ou=anonymau5,ou=spotify,dc=spotify,dc=net "
alias vim="nvim" 

# Base16 Shell
BASE16_SHELL="$HOME/.config/base16-shell/"
[ -n "$PS1" ] && \
    [ -s "$BASE16_SHELL/profile_helper.sh" ] && \
        eval "$("$BASE16_SHELL/profile_helper.sh")"

#Added because pipenv breaks in macos https://coderwall.com/p/-k_93g/mac-os-x-valueerror-unknown-locale-utf-8-in-python
export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8

eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"

#set python path to gcloud command
export CLOUDSDK_PYTHON=/usr/local/bin/python

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/moisesr/Downloads/google-cloud-sdk/path.bash.inc' ]; then . '/Users/moisesr/Downloads/google-cloud-sdk/path.bash.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/moisesr/Downloads/google-cloud-sdk/completion.bash.inc' ]; then . '/Users/moisesr/Downloads/google-cloud-sdk/completion.bash.inc'; fi
