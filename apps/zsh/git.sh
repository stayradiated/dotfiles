#
# Defines Git aliases.
#

# checkout
alias gco='git checkout'

# prune remote branches
alias gfp='git fetch --prune'

# fetch with rebase
alias gfr='git pull --rebase'

# force push
alias gpF='git push --force-with-lease'

# create a work-in-progress commit
alias gcwip='git commit -m "wip @ $(date +''%D %T'')" --no-verify'
