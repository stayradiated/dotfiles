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

# typos
alias celar='clear'

# watson
export WATSON_DIR="${HOME}/dotfiles/apps/watson"

#
# Alias
#

# when exiting ranger, cd to the same dir
alias ranger='source ranger'

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
alias gunshallow='git stash save && git fetch && git reset --hard origin/master'

alias gup='git push -u origin HEAD'

alias bluetooth-on='as-host bluetoothctl power on'
alias bluetooth-off='as-host bluetoothctl power off'

alias monitor-on='xrandr --output HDMI1 --mode 1920x1080 --left-of eDP1'
alias monitor-off='xrandr --output eDP1 --mode 1920x1080 --output HDMI1 --off'

alias laptop-monitor-on='xrandr --output eDP1 --mode 1920x1080'
alias laptop-monitor-off='xrandr --output eDP1 --off'

# journal shortcuts
alias jj='cd $(journal-utils --root)'
alias jd='nvim $(journal-utils --day)'
alias jw='nvim $(journal-utils --week)'
alias jlbo='nvim $(journal-utils --list books)'
alias jlmo='nvim $(journal-utils --list movies)'
alias jlmu='nvim $(journal-utils --list music)'
alias jlwi='nvim $(journal-utils --list wishlist)'
alias jlyt='nvim $(journal-utils --list youtube)'

use-config-keyboard () {
  setxkbmap us -variant colemak -option ctrl:nocaps -option altwin:swap_alt_win
}

set-alacritty-font () {
  sd -f m "^(\s*family:).*$" "\$1 ${1}" ~/dotfiles/apps/alacritty/alacritty.yml
}

set-alacritty-colors () {
  sd -f m "^(\s*colors:).*$" "\$1 *${1}" ~/dotfiles/apps/alacritty/alacritty.yml
}

use-monitor () {
  use-ethernet
  # bluetooth-on
  use-config-keyboard
  monitor-on
  set-alacritty-font terminal
  source ~/dotfiles/apps/bspwm/bspwmrc
}

use-laptop () {
  use-wifi
  # bluetooth-off
  monitor-off
  set-alacritty-font Gomme
  source ~/dotfiles/apps/bspwm/bspwmrc
}

rsync-photos () {
  DEVICE="${1:-/dev/sda1}"
  as-host -t bash -c \
    "sudo mkdir -p /mnt/usb; \
    if mount | grep -q '${DEVICE}'; then \
      echo 'Already mounted'; \
    else \
      sudo mount '${DEVICE}' /mnt/usb; \
    fi; \
    rsync -vua /mnt/usb/DCIM ~/src/camera; \
    sudo umount /mnt/usb; \
    echo 'sync complete, please remove the SD card :)'"
}

wifi-switch () {
  as-host sudo netctl-auto switch-to $1
}


gcloud-stream-build () {
  gcloud builds log --stream $(\
    gcloud builds list --limit 1 --format 'value(id)' --ongoing
  )
}

use-ethernet () {
  as-host '
    sudo ip link set enp0s31f6 up &&
    sudo ip link set wlp2s0 down &&
    sudo dhcpcd
  '
}

use-wifi () {
  as-host '
    sudo ip link set wlp2s0 up &&
    sudo ip link set enp0s31f6 down &&
    sudo dhcpcd
  '
}

date2stamp () {
    date --utc --date "$1" +%s
}

stamp2date (){
    date --utc --date "1970-01-01 $1 sec" "+%Y-%m-%d %T"
}

dateDiff (){
    case $1 in
        -s)   sec=1;      shift;;
        -m)   sec=60;     shift;;
        -h)   sec=3600;   shift;;
        -d)   sec=86400;  shift;;
        *)    sec=86400;;
    esac
    dte1=$(date2stamp $1)
    dte2=$(date2stamp $2)
    diffSec=$((dte2-dte1))
    if ((diffSec < 0)); then abs=-1; else abs=1; fi
    echo $((diffSec/sec*abs))
}

#
# ==============================================================================
# TMUX
# ------------------------------------------------------------------------------
# Defines tmux aliases
# ==============================================================================
#

alias tm='tmux list-sessions && tmux attach -d || tmux new-session'
