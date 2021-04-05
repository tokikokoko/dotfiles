####################
### ENV 
####################

# PATH
path=(/usr/local/bin(N-/) $path)
path=($HOME/.local/bin(N-/) $path)
path=(/home/linuxbrew/.linuxbrew/bin(N-/) $path)
path=($HOME/.yarn/bin(N-/) $path)
path=($HOME/.rbenv/bin(N-/) $path)
path=($HOME/.rbenv/shims(N-/) $path)
path=($HOME/.cargo/bin(N-/) $path)
path=($HOME/.fzf/bin(N-/) $path)

## golang
export GOENV_ROOT="$HOME/.goenv"
export GOPATH=($HOME/Workspace/go)
path=(/usr/local/go/bin(N-/) $path)
path=($HOME/Workspace/go/bin(N-/) $path)

## node
if [ -f ./node_modules/.bin ]; then
	export PATH=./node_modules/.bin:$PATH
fi

## SSH
export SSH_AUTH_SOCK=0 

## LESS
export LESS='-g -i -M -R -S -W -z-4 -x4'

## DOTFILES
DOT=~/dotfiles

## TERM
TERM=xterm-256color

## shell history
HISTFILE=~/.histfile
HISTSIZE=10000
SAVEHIST=10000

## kubectl
export KUBECONFIG_DEFAULT=$HOME/.kube/config 
export KUBECONFIG=$HOME/.kube/config 
export AWS_PROFILE=beluga3

## Linux
export GTK_IM_MODULE=fcitx
export XMODIFIERS=@im=fcitx
export QT_IM_MODULE=fcitx
## Git Editor
export EDITOR=nvim
### alias ###
alias la='exa -a'
alias ll='exa -l'
alias lal='exa -al'
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias diff='colordiff'

## vim
# vim path
alias vim='nvim'
## fzf
export FZF_DEFAULT_COMMAND='rg --files --hidden --follow --glob "!.git/*"'
# export FZF_LEGACY_KEYBINDINGS=1
export FZF_FIND_FILE_COMMAND=$FZF_DEFAULT_COMMAND
export FZF_DEFAULT_OPTS='--color=dark --ansi'

# rbenv configuration
test -r $HOME/.rbenv && eval "$(rbenv init - --no-rehash)" > /dev/null 2> /dev/null || true
export VOLTA_HOME="$HOME/.volta"
export PATH="$VOLTA_HOME/bin:$PATH"
