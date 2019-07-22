alias config='/usr/bin/git --git-dir=$HOME/workspace/dotfiles/ --work-tree=$HOME'

source ~/.git-prompt.sh

export GIT_PS1_SHOWDIRTYSTATE=1
export GIT_PS1_SHOWSTASHSTATE=1
export GIT_PS1_SHOWUNTRACKEDFILES=1
export GIT_PS1_SHOWUPSTREAM=verbose # or auto to omit counts
export PS1='\h:\w$(__git_ps1 " (%s)")\$ '
if [ -f $(brew --prefix)/etc/bash_completion ]; then
. $(brew --prefix)/etc/bash_completion
fi


# set up docker machine VM
function docker_env {
    eval "$(docker-machine env default)"
}
docker_env

export PATH=/Library/Java/JavaVirtualMachines/jdk1.8.0_101.jdk/Contents/Home/bin/:$GOPATH/bin:$GOROOT/bin:$PATH

export JAVA_HOME=/Library/Java/JavaVirtualMachines/jdk1.8.0_101.jdk/Contents/Home/

HISTSIZE=
HISTFILESIZE=


# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/moisesr/google-cloud-sdk/path.bash.inc' ]; then source '/Users/moisesr/google-cloud-sdk/path.bash.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/moisesr/google-cloud-sdk/completion.bash.inc' ]; then source '/Users/moisesr/google-cloud-sdk/completion.bash.inc'; fi

alias dss='ldapsearch -H ldaps://ds-tierone-gew1.spotify.net/ -b dc=spotify,dc=net -D uid=moisesr,ou=people,ou=spotify,dc=spotify,dc=net -W'
DS_DEV_CREDS=$(cat /Users/moisesr/keepass/.ds-dev-moisesr-creds)
alias dssdev="ldapsearch -H ldaps://ds-dev.spotify.net -b dc=spotify,dc=net -D uid=moisesr,ou=people,ou=spotify,dc=spotify,dc=net -w $DS_DEV_CREDS"

# Base16 Shell
BASE16_SHELL="$HOME/.config/base16-shell/"
[ -n "$PS1" ] && \
    [ -s "$BASE16_SHELL/profile_helper.sh" ] && \
        eval "$("$BASE16_SHELL/profile_helper.sh")"
alias config='/usr/bin/git --git-dir=/Users/moisesr/.dotfileconfig/ --work-tree=/Users/moisesr'

#Added because pipenv breaks in macos https://coderwall.com/p/-k_93g/mac-os-x-valueerror-unknown-locale-utf-8-in-python
export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8

eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"

#set python path to gcloud command
export CLOUDSDK_PYTHON=/usr/local/bin/python
