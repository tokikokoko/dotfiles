# ############
# fish config
# ############

if status --is-login

    # 環境変数読み込み
    source $HOME/.config/fish/env.fish

    # abbrを使いやすく
    set -g fish_user_abbreviations

    # function & alias読み込み
    source $HOME/.config/fish/user_functions.fish
    source $HOME/.config/fish/aliases.fish


    # 環境依存設定読み込み
    if test -f $HOME/local.fish
        source $HOME/local.fish	
    end

    # fisherman
    if not test -f $HOME/.config/fish/functions/fisher.fish
        echo "==> Fisherman not found.  Installing."
        curl -sLo ~/.config/fish/functions/fisher.fish --create-dirs git.io/fisher
        fisher
    end

    # eval (opam config env)
    # status --is-interactive; and source (rbenv init -|psub)

    if test -f $HOME/.cargo/bin/starship
        starship init fish | source
    end

    # Base16 Shell
    # set BASE16_SHELL "$HOME/.config/base16-shell/"
    # source "$BASE16_SHELL/profile_helper.fish"

    # base16-materia
    # base16-gruvbox-light-medium
end
set -gx VOLTA_HOME "$HOME/.volta"
set -gx PATH "$VOLTA_HOME/bin" $PATH
