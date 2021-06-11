autoload -U promptinit; promptinit

# pure prompt
PURE_PROMPT_SYMBOL='»'
PURE_PROMPT_VICMD_SYMBOL='«'
prompt pure

export GOPATH=/home/admin
export GOROOT=/usr/local/go

#
# Editors
#

export EDITOR='nvim'
export VISUAL='nvim'
export PAGER='less'

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

export TZ='Pacific/Auckland'

# don't lag when switching between insert/normal mode
KEYTIMEOUT=1

# z.lua
export _ZL_DATA="${HOME}/dotfiles/apps/zsh/state/zlua.enc"
eval "$(lua5.3 /usr/local/bin/z.lua --init zsh)"
alias j='z'

# watson
export WATSON_DIR="${HOME}/dotfiles/apps/watson"

# when exiting ranger, cd to the same dir
alias ranger='source ranger'

# typos
alias celar='clear'

# vim
alias vi='nvim'
alias vim='nvim'
alias :e='nvim'
alias :q='exit'

# bat
alias cat='bat'

# prettyping
alias ping='prettyping --nolegend'

# git
alias gup='git push -u origin HEAD'

# journal shortcuts
alias jj='cd $(journal-utils --root)'
alias jd='nvim $(journal-utils --day)'
alias jw='nvim $(journal-utils --week)'
alias jlbo='nvim $(journal-utils --list books)'
alias jlmo='nvim $(journal-utils --list movies)'
alias jlmu='nvim $(journal-utils --list music)'
alias jlwi='nvim $(journal-utils --list wishlist)'
alias jlyt='nvim $(journal-utils --list youtube)'

# tmux
alias tm='tmux list-sessions && tmux attach -d || tmux new-session'
