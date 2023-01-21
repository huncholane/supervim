git config --global core.autocrlf input
if uname -a | grep -q MINGW;then
    alias python3=python
    alias Python=python
else
    alias python=python3
fi
#alias python=python3
alias Vim='vim ~/.vimrc'
alias Gvim='vim ~/.ghost/ghost.vimrc'
alias Gbash='vim ~/.ghost/ghost.sh'
alias clip=clip.exe
alias Bash='vim ~/.bashrc'
alias Source='source ~/.bashrc'
alias gcom='git add . && git commit -m'
alias ghook='~/.ghost/ghook/startproject.sh'
alias venv='python -m venv venv'
function vsource() {
    local start=`pwd`
    for i in $(seq 1 5);do
        if ! source venv/**/activate; then
            cd ..
        else 
            cd $start
            break
        fi
    done
}
function Gpush() {
    local start=`pwd`
    local message=$@
    cd ~/.ghost
    gcom "$message"
    git push -u origin main 
    cd $start
}
function Djs() {
    local start=`pwd`
    for i in $(seq 1 5);do
        if test -f manage.py;then
            python manage.py runserver $1
            break
        fi
    done
}
function Dj() {
    local start=`pwd`
    for i in $(seq 1 5);do
        if test -f manage.py;then
            python manage.py $@
            break
        fi
    done
}
