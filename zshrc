export PATH=./node_modules/.bin:$(brew --prefix)/sbin:$(brew --prefix)/bin:$PATH:$HOME/bin
export EDITOR=vim
export DISABLE_AUTO_TITLE="true"
export ZSH=$HOME/.oh-my-zsh
export ZSH_THEME="robbyrussell"
export UBER_LDAP_UID="wolski"
export UBER_OWNER="wolski@uber.com"
export VAGRANT_DEFAULT_PROVIDER=aws
export GOPATH=/Users/jeffwolski1/code/go
export UPLAATSGO="$GOPATH"/src/code.uber.internal/marketplace/uplaats-go.git
export CODE_HOME=$HOME/code
export UBER_HOME=$CODE_HOME/uber
export VAGRANT_DEFAULT_PROVIDER=aws
export POWERLINE_COMMAND=$HOME/.vim/bundle/powerline/powerline/bindings/bash/
export TERM="screen-256color"

plugins=(git)

source $ZSH/oh-my-zsh.sh
#source $HOME/.bash_profile

[ -s "/usr/local/bin/virtualenvwrapper.sh" ] && . /usr/local/bin/virtualenvwrapper.sh
[ -s "$HOME/.nvm/nvm.sh" ] && . $HOME/.nvm/nvm.sh
[ -s "$HOME/.rvm/scripts/rvm" ] && . $HOME/.rvm/scripts/rvm

# Aliases
alias grecents="git for-each-ref --sort=-committerdate refs/heads/ --format='%(refname) %(committerdate) %(authorname)' | sed 's/refs\/heads\///g' | grep 'Jeff Wolski' | head -n 5 | cut -f 1 -d ' '"
alias ga='git add .'
alias gcm='git commit -m'
alias gd='git diff HEAD'
alias gs='git status'
alias grc='git rebase --continue'
alias grs='git rebase --skip'
alias gtree='git log --graph --oneline --all'
alias ganv='git commit --amend --no-verify'
alias gclc='git commit -m "Cleanup"'
alias tmux='tmux -2'

cdsync () {
    cd $(boxer sync_dir $@)
}

editsync () {
    $EDITOR $(boxer sync_dir $@)
}

opensync () {
    open $(boxer sync_dir $@)
}

#alias china='ssh-agent bash --rcfile ~/.ssh/china/.bash_profile.cn'

if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi

source /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# Uncomment out when you've got an actual tmuxinator config ready to go
#tmuxinator start uber
