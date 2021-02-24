# # prompt
# function fish_prompt
# 	test $SSH_TTY
#     and printf (set_color red)$USER(set_color brwhite)'@'(set_color yellow)(prompt_hostname)' '
#     test $USER = 'root'
#     and echo (set_color red)"#"
# 
#     # Main
#     echo -n (set_color cyan)(prompt_pwd) (set_color red)'❯'(set_color yellow)'❯'(set_color green)'❯ '
# end

function fish_greeting
end

# emacs-daemon
function restart_server -d "Restart emacsclient"
    emacsclient -e '(kill-emacs)'
    emacs --daemon
end

function kill_server -d "Stop emacsclient"
    emacsclient -e '(kill-emacs)'
end

# shell
function re -d "Re-login current shell"
    exec fish --login
end

# tmux
function ta -d "Attach tmux session"
    tmux a -t $argv[1]
end

function tc -d "Create tmux session"
    tmux new -s $argv[1]
end

# ocaml
function ocaml
    rlwrap ocaml $argv
end

# kubernetes
function default_kube -d "Use default kubeconfig"
    set -x KUBECONFIG $KUBECONFIG_DEFAULT
end

# git get branches
function get_git_branches
    git branch -vv \
    | fzf --ansi \
    | awk '{print substr($0, 3, length($0))}' \
    | awk '{print $1}'
end


# git stage
function git_stage_list
    git status -s \
    | fzf --multi --ansi --tac \
    | awk '{if (NR==eof) printf "%s ", $2; else print $2}'
end

function gs
    git add (git_stage_list)
end

# Convert markdown to Github style html
function pandoc_convert_markdonw -d ""
    pandoc $argv[1] -s --self-contained -t html5 -c $HOME/.pandoc/github.css -o $argv[2]
end

# Kill process
function kill_ps
    ps -aux | fzf | awk '{print $1}' | xargs kill
end

# Update ctags
function auto_ctags
    set c (pwd)
    fish -c "while sleep 300; ctags -R "$c"; end" &
end

# Docker container list
function dk_container_list
    docker container list \
    | fzf --multi \
    | awk '{print $1}'
end

function stop_container
    dk_container_list \
    | xargs docker container stop
end

# pbcopy
function pbcopy
    xclip -selection c
end

# current_branch
function current_branch
    git symbolic-ref --short HEAD
end

# alter change directory
function cdd
    cd (rg --hidden --files --null -j 2 -g '!*.git' ~ | xargs -0 dirname | awk '!seen[$0] {print} {++seen[$0]}' | fzf)
end

# posix source
function posix-source
    for i in (cat $argv)
        set arr (echo $i |tr = \n)
        set -gx $arr[1] $arr[2]
    end
end

# ghq repositories
abbr --add gcd 'cd (ghq list --full-path | fzf --exit-0 ; and echo -n ; or echo $PWD)'

# git checkout
function fzf_git_checkout
    git --no-pager branch -a -vv | fzf +m | sed "s/remotes\/origin\///" | sed "s/^* //" | awk '{print $1}'
end
abbr --add gck 'git checkout (fzf_git_checkout)'

# fish abbr all clear
function abbr_all_clear
    for a in (abbr --list); abbr --erase $a; end
end

# uuid
function ruuid
    uuidgen | sed -z 's/\n//g'
end

function fish_right_prompt
end

# Add current dir path
abbr --add apath 'set -x PATH $PWD/bin $PATH'
