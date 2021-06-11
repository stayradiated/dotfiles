#
# Defines Git aliases.
#

# switch branchs
alias gsw='git switch'

# checkout has better autocompletion
alias gco='git checkout'

# prune remote branches
alias gfp='git fetch --prune'

# fetch with rebase
alias gfr='git pull --rebase'

# force push
alias gpF='git push --force-with-lease'

# print local git branches
alias gbl='git for-each-ref --color=always --sort=committerdate refs/heads/ --format=''%(HEAD) %(color:yellow)%(refname:short)|%(color:red)%(objectname:short)|%(color:reset)%(contents:subject)|%(color:blue)%(authorname)|%(color:green)%(committerdate:relative)%(color:reset)'' | column -t -s \|'

# diff
alias gd='git diff'
alias gdc='git diff --cached'

# status
alias gs='git status --short'

# add
alias g.='git add .'

# commit
alias gc='git commit'
alias gcwip='git commit -m "wip @ $(date +''%D %T'')" --no-verify'
