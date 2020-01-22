# pure prompt
PURE_PROMPT_SYMBOL='>'
PURE_PROMPT_VICMD_SYMBOL='<'

GOPATH=/home/admin
GOROOT=/usr/local/go

path=(
  /home/admin/dotfiles/bin
  /home/admin/.local/bin
  /usr/local/sbin
  /usr/local/bin
  /usr/sbin
  /usr/bin
  /sbin
  /bin
  /home/admin/.cargo/bin
  /usr/local/lib/node/bin
  /home/admin/.yarn/bin
  /usr/local/go/bin
  /usr/local/google-cloud-sdk/bin
  /home/admin/.fzf/bin
)
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

# settings
export TZ='Pacific/Auckland'
export TMUX_TMPDIR="$HOME/.tmux"

# fzf
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# z.lua
export _ZL_DATA='~/shared/zlua'
eval "$(lua5.3 /usr/local/bin/z.lua --init zsh)"
alias j='z'

# typos
alias celar='clear'
alias :q='exit'

# watson
export WATSON_DIR=~/shared/watson

# when exiting ranger, cd to the same dir
alias ranger='source ranger'

# vim
alias vi='nvim'
alias vim='nvim'

# bat
alias cat='bat'

# prettyping
alias ping='prettyping --nolegend'

# git
alias gup='git push -u origin HEAD'
unalias gm

# save tmux buffer
# use `C-a: capture-pane -eJ` to screenshot the desired pane
alias saveBuffer='tmux save-buffer tmux_output.bin && tmux delete-buffer'

# root user
as-host () {
  ssh george@localhost -q -t "$@"
}

alias bluetooth-on='as-host bluetoothctl power on'
alias bluetooth-off='as-host bluetoothctl power off'

alias monitor-on='xrandr --output HDMI-1 --mode 1920x1080 --left-of eDP-1'
alias monitor-off='xrandr --output eDP-1 --mode 1920x1080 --output HDMI-1 --off'

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
  bluetooth-on
  use-config-keyboard
  monitor-on
  set-alacritty-font terminal
}

use-laptop () {
  bluetooth-off
  monitor-off
  set-alacritty-font Gomme
}

rsync-photos () {
  as-host -t bash -c 'true && \
    mkdir -p /mnt/usb && \
    sudo mount /dev/sda1 /mnt/usb && \
    rsync -vua /mnt/usb/DCIM ~/src/camera && \
    sudo umount /mnt/usb && \
    echo "sync complete, please remove the SD card :)"'
}

ip-addr () {
  as-host ip -4 addr show wlp2s0 | \
  grep --color=none --only-matching --perl-regexp '(?<=inet\s)\d+(\.\d+){3}' |\
  awk '{$1=$1};1' # trim whitespace
}
