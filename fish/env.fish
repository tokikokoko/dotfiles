# PATH
set -x PATH /usr/local/bin $PATH
set -x PATH ~/.local/bin $PATH

# ARCH
# set -x SSH_AUTH_SOCK 0 

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
    set -x FZF_DEFAULT_OPTS '--color=light --ansi'
end

# brew
if test -d /home/linuxbrew/.linuxbrew/bin
    eval (/home/linuxbrew/.linuxbrew/bin/brew shellenv)
end

# node
if test -d $HOME/.volta
    set -x VOLTA_HOME "$HOME/.volta"
    set -x PATH "$VOLTA_HOME/bin" $PATH
end

if test -d ./node_modules/.bin
    set -x PATH ./node_modules/.bin $PATH
end

# deno
if test -d $HOME/.deno
    set -x DENO_INSTALL "$HOME/.deno"
    set -x PATH "$DENO_INSTALL/bin" $PATH
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

# go-lang
if test -d $HOME/Workspace/go
    set -x GOPATH $HOME/Workspace/go
    if test -d /usr/local/go/bin
        set -x PATH /usr/local/go/bin $PATH
    end
    set -x PATH $GOENV_ROOT/bin $PATH
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

# Kubectl
set -x KUBECONFIG_DEFAULT $HOME/.kube/config 
set -x KUBECONFIG $HOME/.kube/config 

if test -d $HOME/google-cloud-sdk/bin
    set -x PATH $HOME/google-cloud-sdk/bin $PATH
end
