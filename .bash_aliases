alias dir='ls -aF'
alias ldir='ls -laF'
alias emacs='emacs -nw'

function edit {
    /usr/bin/emacs -geometry 80x50 $* &
}

function show_branch {
    branch=`git branch --list 2>/dev/null | grep '*' | cut -f2 -d' '`
    if [ "$branch" != "" ]; then
       echo "{$branch}"
    fi
    pwd
}
alias quantum='cd /opt/stack/quantum'
alias env='source /opt/stack/quantum/.venv/bin/activate'
alias ds='cd ~/devstack'
alias horizon='cd /opt/stack/horizon'
alias client='cd /opt/stack/python-quantumclient'


