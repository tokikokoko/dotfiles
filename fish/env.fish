# PATH
set -x PATH /usr/local/bin $PATH
set -x PATH ~/.local/bin $PATH
# ARCH
# SSH
set -x SSH_AUTH_SOCK 0 

# general
set DOT $HOME/dotfiles
set FISH_PATH (which fish)
set -x TERM xterm-256color
set -x EDITOR vim

# fcitx
set -x GTK_IM_MODULE fcitx
set -x XMODIFIERS "@im=fcitx"

# fzf
if test -d $HOME/.fzf/bin
    set -x PATH $HOME/.fzf/bin $PATH
    set -x FZF_DEFAULT_COMMAND 'rg -j 2 --files --hidden --follow --glob "!.git/*"'
    set -x FZF_LEGACY_KEYBINDINGS 0
    set -x FZF_FIND_FILE_COMMAND $FZF_DEFAULT_COMMAND
    set -x FZF_DEFAULT_OPTS '--color=dark --ansi'
end

# brew
if test -d /home/linuxbrew/.linuxbrew/bin
    eval (/home/linuxbrew/.linuxbrew/bin/brew shellenv)
end

# node
set -x N_PREFIX $HOME/.n
set -x PATH $N_PREFIX/bin $PATH
if test -d $HOME/.n
    set -x PATH $HOME/.n/bin $PATH
end

if test -d ./node_modules/.bin
    set -x PATH ./node_modules/.bin $PATH
end

# yarn
if test -d $HOME/.yarn
    set -x PATH $HOME/.yarn/bin $PATH
end

# ruby
if test -r $HOME/.rbenv
    set -x PATH $HOME/.rbenv/bin $PATH
    rbenv init - | source > /dev/null 2> /dev/null; or true
    # set -x BUNDLE_GEMFILE Gemfile.local
end

# elixir
if test -r $HOME/.mix/escripts
    set -x PATH $HOME/.mix/escripts $PATH
end

# opam configuration
test -r $HOME/.opam/opam-init/init.fish; and source $HOME/.opam/opam-init/init.fish > /dev/null 2> /dev/null; or true

# go-lang
if test -d $HOME/Workspace/go
    set -x GOPATH $HOME/Workspace/go
    set -x GOENV_ROOT $HOME/.goenv
    if test -d /usr/local/go/bin
        set -x PATH /usr/local/go/bin $PATH
    end
    set -x PATH $GOENV_ROOT/bin $PATH
    set -x GOENV_DISABLE_GOPATH 1
    if test -d $HOME/Workspace/go/bin
        set -x PATH $HOME/Workspace/go/bin $PATH
    end
    if test -d $HOME/.goenv/shims
        set -x PATH $GOENV_ROOT/shims $PATH
    end
    set -x GO111MODULE auto
end

# rust-lang
if test -d $HOME/.cargo
    set -x PATH $HOME/.cargo/bin $PATH
end

# Qt
set -x QT_HOMEBREW true

# Kubectl
set -x KUBECONFIG_DEFAULT $HOME/.kube/config 
set -x KUBECONFIG $HOME/.kube/config 

# snap
if test -r /snap/bin
    set -x PATH /snap/bin $PATH
end

if test -d $HOME/google-cloud-sdk/bin
    set -x PATH $HOME/google-cloud-sdk/bin $PATH
end
