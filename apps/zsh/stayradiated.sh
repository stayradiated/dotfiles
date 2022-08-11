autoload -U promptinit; promptinit

# pure prompt
PURE_PROMPT_SYMBOL='»'
PURE_PROMPT_VICMD_SYMBOL='«'
prompt pure

export GOPATH=/home/admin
export GOROOT=/usr/local/go

export GPG_TTY=$(tty)

# coc.nvim config
export NODE_CLIENT_LOG_FILE=/tmp/coc-nod-client.log
export NVIM_COC_LOG_FILE=/tmp/coc-nvim.log

# runn-cli
export RUNN_DIR=/home/admin/src/github.com/Runn-Fast/runn
alias r='runn'

# fzf
export FZF_DEFAULT_COMMAND='fd --type f'

#
# Editors
#

export EDITOR=$(which nvim)
export VISUAL=$(which nvim)
export PAGER=$(which less)

#
# Less
#

# Set the default Less options.
# Mouse-wheel scrolling has been disabled by -X (disable screen clearing).
# Remove -X and -F (exit if the content fits on one screen) to enable it.
export LESS='-F -g -i -M -R -S -w -X -z-4'

# Set the Less input preprocessor.
# Try both `lesspipe` and `lesspipe.sh` as either might exist on a system.
if (( $#commands[(i)lesspipe(|.sh)] )); then
  export LESSOPEN="| /usr/bin/env $commands[(i)lesspipe(|.sh)] %s 2>&-"
fi

#
# Settings
#

# export TZ='Pacific/Auckland'
export TZ='Europe/London'
# export TZ='Europe/Berlin'

# don't lag when switching between insert/normal mode
KEYTIMEOUT=1

# z.lua
export _ZL_DATA="${HOME}/dotfiles/apps/zsh/state/zlua.enc"

# z foo       # cd to most frecent dir matching foo
# z foo bar   # cd to most frecent dir matching foo and bar
eval "$(lua5.3 /usr/local/bin/z.lua --init zsh)"

# z -r foo    # cd to highest ranked dir matching foo
# z -t foo    # cd to most recently accessed dir matching foo
# z -l foo    # list matches instead of cd
# z -c foo    # restrict matches to subdirs of $PWD
# z -e foo    # echo the best match, don't cd
# z -x path   # remove path from history
# z -i foo    # cd with interactive selection
# z -I foo    # cd with interactive selection using fzf
# z -b foo    # cd to the parent directory starting with foo

alias zz='z -I -t'
alias zb='z -b'
alias zc='z -c'

alias zj='cd $(journal-utils --root)'

alias online='slack-status online'
alias afk='slack-status away'
alias offline='slack-status offline'

# watson
export WATSON_DIR="${HOME}/dotfiles/apps/watson"

# when exiting ranger, cd to the same dir
alias ranger='source ranger'

# typos
alias celar='clear'

# node
alias node='node --experimental-repl-await'

# vim
alias vi='nvr --nostart'
alias vim='vi'
alias nvi='nvim'
alias :e='vi'
alias :q='exit'

# rg
alias rgf='rg -F'

# sc
alias sc='sc-im'

# custom scripts
alias udns='update-dns'

# bat
alias cat='bat'

# prettyping
alias ping='prettyping --nolegend'

# git
alias gup='git push -u origin HEAD'
alias gmt='git mergetool'

# journal shortcuts
alias jd='nvi $(journal-utils --day)'
alias jw='nvi $(journal-utils --week)'
alias jlbo='nvi $(journal-utils --list books)'
alias jlmo='nvi $(journal-utils --list movies)'
alias jlmu='nvi $(journal-utils --list music)'
alias jlwi='nvi $(journal-utils --list wishlist)'
alias jlyt='nvi $(journal-utils --list youtube)'
alias jwifi='nvi $(journal-utils --root)/private/wifi.txt'
alias jem='nvi $(journal-utils --root)/public/emoji.txt'

# tmux
alias tm='tmux list-sessions && tmux attach -d || tmux new-session'
