#
# Defines Git aliases.
#

# switch branchs
alias gsw='git switch'

# checkout has better autocompletion
alias gco='git checkout'
alias ghco='gh pr checkout'

# copy a commit
alias gcp='git cherry-pick'

# fetch with rebase
alias gfr='git pull --rebase'

# force push
alias gpF='git push --force-with-lease'

# print local git branches
alias gbl='git for-each-ref --color=always --sort=committerdate refs/heads/ --format=''%(HEAD) %(color:yellow)%(refname:short)|%(color:reset)%(contents:subject)|%(color:blue)%(authorname)|%(color:green)%(committerdate:relative)%(color:reset)'' | column -t -s \|'

# diff
alias gd='git diff'
alias gdc='git diff --cached'

# status
alias gs='git status'

# add
alias ga='git add'
alias ga.='git add .'

# commit
alias gc='git commit'
alias gcwip='git commit -m "work-in-progress @ $(date +''%Y.%m.%d %T'')" --no-verify'

# restore
alias gr='git restore'
alias grs='git restore --staged'

# merge main
alias gmmain='git merge origin/main -m "Merge upstream changes from main branch"'
alias gmdev='git merge origin/development -m "Merge upstream changes from development branch"'

# lazygit
alias tig='lazygit'
