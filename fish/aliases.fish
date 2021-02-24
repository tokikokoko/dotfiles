# cd
abbr --add .. 'cd ..'
abbr --add ... 'cd ../..'
abbr --add .... 'cd ../../..'
abbr --add ..... 'cd ../../../..'

# exa
for p in $PATH
    if test -x $p/exa
        function ls -d "[alias]ls"
            exa $argv
        end
        break
    end
end

# git
abbr --add gi 'git'
abbr --add gic 'git checkout'
abbr --add gib git branch
abbr --add giw git worktree
abbr --add gim git merge

# emacs
function ec -d "[alias]emacs"
    emacsclient -nw
end
function eg -d "[alias]emacs"
    emacsclient -c -a emacs
end

# docker
abbr --add dk docker
abbr --add dkc docker-compose
