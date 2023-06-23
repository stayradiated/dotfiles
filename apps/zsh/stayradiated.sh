autoload -U promptinit; promptinit

# pure prompt
PURE_PROMPT_SYMBOL='»'
PURE_PROMPT_VICMD_SYMBOL='«'
PURE_GIT_PULL=0
prompt pure

# golang
export GOPATH=/home/admin
export GOROOT=/usr/local/go

# ruby gems
export GEM_HOME=/home/admin/src/ruby/gems
export GEM_PATH=/home/admin/src/ruby/gems
export PATH="${PATH}:${GEM_PATH}/bin"

# pnpm
export PNPM_HOME="/home/admin/.local/share/pnpm"
export PATH="${PNPM_HOME}:${PATH}"

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
# export TZ='Europe/London'
# export TZ='Europe/Berlin'

# don't lag when switching between insert/normal mode
KEYTIMEOUT=1

# zoxide
export _ZO_DATA_DIR="${HOME}/dotfiles/apps/zoxide"
eval "$(zoxide init zsh --no-cmd)"
alias z="__zoxide_z"
alias zi="__zoxide_zi"

alias online='slack-status online'
alias afk='slack-status away'
alias offline='slack-status offline'

# watson
export WATSON_DIR="${HOME}/dotfiles/apps/watson"

# pomo
export POMO_DATABASE_URL="${HOME}/dotfiles/apps/pomo/pomo.db.enc"
export POMO_DIR="${HOME}/dotfiles/apps/pomo/"
export POMO_DAEMON_HOST="http://localhost:45230"

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
alias jd='nvi "$(journal-utils --day)"'
alias jw='nvi "$(journal-utils --week)"'
alias jlbo='nvi "$(journal-utils --list books)"'
alias jlmo='nvi "$(journal-utils --list movies)"'
alias jlmu='nvi "$(journal-utils --list music)"'
alias jlwi='nvi "$(journal-utils --list wishlist)"'
alias jlyt='nvi "$(journal-utils --list youtube)"'
alias jwifi='nvi "$(journal-utils --root)/private/wifi.txt"'
alias jem='nvi "$(journal-utils --root)/public/emoji.txt"'

# tmux
alias tm='tmux list-sessions && tmux attach -d || tmux new-session'

# ranger
ranger_cd() {
  temp_file="$(mktemp -t "ranger_cd.XXXXXXXXXX")"
  ranger --choosedir="$temp_file" -- "${@:-$PWD}"
  if 
    chosen_dir="$(cat -- "$temp_file")" &&
    [ -n "$chosen_dir" ] &&
    [ "$chosen_dir" != "$PWD" ]
  then
    cd -- "$chosen_dir"
  fi
  /bin/rm -f -- "$temp_file"
}
bindkey -s "^O" "ranger_cd^M"
