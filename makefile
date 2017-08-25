SHELL := /bin/bash

dir   := $(CURDIR)

osx   := $(dir)/osx
crux  := $(dir)/crux
apps  := $(dir)/apps
cbook := $(dir)/chromebook
zen   := $(dir)/zenbook

bar     := $(crux)/bar
cmus    := $(apps)/cmus
irssi   := $(apps)/irssi
mutt    := $(apps)/mutt
firefox := $(apps)/firefox
urxvt   := $(apps)/urxvt
tmux    := $(apps)/tmux
vim     := $(apps)/vim
feh     := $(apps)/feh
fonts   := $(apps)/fonts
music   := $(apps)/music
dev     := $(apps)/dev
termite := $(apps)/termite

# Checks to see if any files are going to be overwritten
check:
	@echo 'Checking for files that will be overwritten'

# Vim
	@if test -d ~/.config/nvim; then echo ".config/nvim exists"; fi;

# Irssi
	@if test -d ~/.irssi; then echo ".irssi exists"; fi;

# Tmux
	@if test -f ~/.tmux.conf; then echo ".tmux.conf exists"; fi;

# Vimperator
	@if test -f ~/.vimperatorrc; then echo ".vimperatorrc exists"; fi;

# Terminal
	@if test -f ~/.Xresources; then echo ".Xresources exists"; fi;

# WM
	@if test -f ~/.xinitrc; then echo ".xinitrc exists"; fi;

# CMUS
	@if test -f ~/.cmus/rc; then echo ".cmus/rc exists"; fi;

# DEV
	@if test -f ~/.jshintrc; then echo ".jshintrc exists"; fi;



# ============================================================================
# CRUX
# ============================================================================

crux:

# WM
	@echo "WM..."
	@ln -fs "$(crux)/wm/xinitrc" ~/.xinitrc
	@ln -fs "$(crux)/wm/Xmodmap" ~/.Xmodmap

	@mkdir -p ~/.config/bspwm
	@ln -fs "$(crux)/wm/bspwmrc" ~/.config/bspwm/bspwmrc

	@mkdir -p ~/.config/sxhkd
	@ln -fs "$(crux)/wm/sxhkdrc" ~/.config/sxhkd/sxhkdrc

# URXVT
	@echo "Terminal..."
	@ln -fs "$(crux)/urxvt/Xresources" ~/.Xresources


# ============================================================================
# CHROMEBOOK
# ============================================================================

chromebook:

# WM
	@echo "WM..."
	@ln -fs "$(cbook)/wm/xinitrc" ~/.xinitrc

	@mkdir -p ~/.config/bspwm
	@ln -fs "$(cbook)/wm/bspwmrc" ~/.config/bspwm/bspwmrc

	@mkdir -p ~/.config/sxhkd
	@ln -fs "$(cbook)/wm/sxhkdrc" ~/.config/sxhkd/sxhkdrc

# URXVT
	@echo "Terminal..."
	@ln -fs "$(cbook)/urxvt/Xresources" ~/.Xresources


# ============================================================================
# ZENBOOK
# ============================================================================

zenbook:

# WM
	@echo "WM..."
	@ln -fs "$(zen)/wm/xinitrc" ~/.xinitrc

	@mkdir -p ~/.config/bspwm
	@ln -fs "$(zen)/wm/bspwmrc" ~/.config/bspwm/bspwmrc

	@mkdir -p ~/.config/sxhkd
	@ln -fs "$(zen)/wm/sxhkdrc" ~/.config/sxhkd/sxhkdrc

# ============================================================================
# OSX
# ============================================================================

osx:

# WM
	@echo "WM..."
	@ln -fs "$(osx)/wm/xinitrc" ~/.xinitrc

	@mkdir -p ~/.config/bspwm
	@ln -fs "$(osx)/wm/bspwmrc" ~/.config/bspwm/bspwmrc

	@mkdir -p ~/.config/sxhkd
	@ln -fs "$(osx)/wm/sxhkdrc" ~/.config/sxhkd/sxhkdrc

# Terminal
	@echo "Terminal..."
	@ln -fs "$(osx)/urxvt/Xresources" ~/.Xresources



# ============================================================================
# SHARED APPS
# ============================================================================

apps: cmus feh fonts zsh termite tmux irssi vim vimperator dev

cmus:

	@echo "Cmus..."
	@mkdir -p ~/.cmus
	@ln -fs "$(cmus)/rc" ~/.cmus/rc
	@ln -fs "$(cmus)/custom.theme" ~/.cmus/custom.theme

feh:

	@echo "Feh..."
	@ln -fs "$(feh)/fehbg" ~/.fehbg

fonts:

	@echo "Fonts..."
	@if test ! -d "$(fonts)/tamzen"; then\
		git clone https://github.com/sunaku/tamzen-font "$(fonts)/tamzen";\
	fi;
	@if test ! -d "$(fonts)/tewi"; then\
		git clone https://github.com/lucy/tewi-font "$(fonts)/tewi";\
	fi;
	@mkdir -p ~/.fonts
	@ln -fs "$(fonts)/tewi/tewi-bold-11.bdf" ~/.fonts/
	@ln -fs "$(fonts)/tewi/tewi-normal-11.bdf" ~/.fonts/
	@ln -fs "$(fonts)/tamzen/bdf/Tamzen7x14b.bdf" ~/.fonts/
	@ln -fs "$(fonts)/tamzen/bdf/Tamzen7x14r.bdf" ~/.fonts/
	@ln -fs "$(fonts)/envypn/envypn7x15.pcf" ~/.fonts/

zsh:

	@echo "Zsh..."
	@if test ! -d ~/.zprezto; then\
		git clone --recursive https://github.com/stayradiated/prezto.git ~/.zprezto; \
	fi;
	@ln -fs ~/.zprezto/runcoms/zlogin    ~/.zlogin
	@ln -fs ~/.zprezto/runcoms/zlogout   ~/.zlogout
	@ln -fs ~/.zprezto/runcoms/zpreztorc ~/.zpreztorc
	@ln -fs ~/.zprezto/runcoms/zprofile  ~/.zprofile
	@ln -fs ~/.zprezto/runcoms/zshenv    ~/.zshenv
	@ln -fs ~/.zprezto/runcoms/zshrc     ~/.zshrc

termite:

	@echo "Termite..."
	@mkdir -p ~/.config/termite
	@ln -fs $(termite)/config ~/.config/termite/config

tmux:

	@echo "Tmux..."
	@if test ! -d "~/.tmux/plugins/tpm"; then\
		mkdir -p ~/.tmux/plugins;\
		git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm;\
	fi;
	@ln -fs "$(tmux)/tmux.conf" ~/.tmux.conf

irrsi:

	@echo "Irssi..."
	@rm -rf ~/.irssi
	@ln -fs "$(irssi)" ~/.irssi

vim:

	@echo "Vim..."
	@mkdir -p "$(vim)/tmp"
	@mkdir -p "$(vim)/undo"

	@if test ! -d ~/.config/nvim; then\
		ln -fs "$(vim)" ~/.config/nvim;\
	fi;
	@if test ! -d "$(vim)/dein.vim"; then\
		git clone https://github.com/Shougo/dein.vim.git "$(vim)/dein.vim";\
	fi;

vimperator:

	@echo "Vimperator..."
	@ln -fs $(firefox)/vimperatorrc ~/.vimperatorrc

dev:

	@echo "Dev..."
	@ln -fs "$(dev)/jshintrc" ~/.jshintrc

.PHONY: check crux chromebook zenbook osx apps cmus feh fonts zsh termite tmux irssi vim vimperator dev
