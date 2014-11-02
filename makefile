
# paths
dir   := $(CURDIR)

osx   := $(dir)/osx
crux  := $(dir)/crux
apps  := $(dir)/apps

bar   := $(crux)/bar

cmus  := $(apps)/cmus
irssi := $(apps)/irssi
mutt  := $(apps)/mutt
ffox  := $(apps)/firefox
rxvt  := $(apps)/urxvt
zsh   := $(apps)/zsh
tmux  := $(apps)/tmux
vim   := $(apps)/vim
feh   := $(apps)/feh
fonts := $(apps)/fonts
music := $(apps)/music
dev   := $(apps)/dev

# Checks to see if any files are going to be overwritten
check:
	@echo 'Checking for files that will be overwritten'

# Vim
	@if test -d ~/.vim; then echo ".vim exists"; fi;
	@if test -d ~/.vimrc; then echo ".vimrc exists"; fi;

# Irssi
	@if test -d ~/.irssi; then echo ".irssi exists"; fi;

# Tmux
	@if test -f ~/.tmux.conf; then echo ".tmux.conf exists"; fi;

# Vimperator
	@if test -f ~/.vimperatorrc; then echo ".vimperatorrc exists"; fi;

# Terminal
	@if test -f ~/.Xresources; then echo ".Xresources exists"; fi;
	@if test -f ~/.zshrc; then echo ".zshrc exists"; fi;

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
	@ln -fs $(crux)/wm/xinitrc ~/.xinitrc
	@ln -fs $(crux)/wm/Xmodmap ~/.Xmodmap

	@mkdir -p ~/.config/bspwm
	@ln -fs $(crux)/wm/bspwmrc ~/.config/bspwm/bspwmrc

	@mkdir -p ~/.config/sxhkd
	@ln -fs $(crux)/wm/sxhkdrc ~/.config/sxhkd/sxhkdrc

# URXVT
	@echo "Terminal..."
	@ln -fs $(crux)/urxvt/Xresources ~/.Xresources

# ZSH
	@echo "Zsh..."
	@ln -fs $(crux)/zsh/zshrc ~/.zshrc



# ============================================================================
# OSX
# ============================================================================

osx:

# WM
	@echo "WM..."
	@ln -fs $(osx)/wm/xinitrc ~/.xinitrc

	@mkdir -p ~/.config/bspwm
	@ln -fs $(osx)/wm/bspwmrc ~/.config/bspwm/bspwmrc

	@mkdir -p ~/.config/sxhkd
	@ln -fs $(osx)/wm/sxhkdrc ~/.config/sxhkd/sxhkdrc

# Terminal
	@echo "Terminal..."
	@ln -fs $(osx)/urxvt/Xresources ~/.Xresources

# ZSH
	@echo "Zsh..."
	@ln -fs $(osx)/zsh/zshrc ~/.zshrc



# ============================================================================
# SHARED APPS
# ============================================================================

apps: cmus feh fonts zsh tmux irssi vim vimperator dev

cmus:

	@echo "Cmus..."
	@mkdir -p ~/.cmus
	@ln -fs $(cmus)/rc ~/.cmus/rc
	@ln -fs $(cmus)/custom.theme ~/.cmus/custom.theme

feh:

	@echo "Feh..."
	@ln -fs $(feh)/fehbg ~/.fehbg

fonts:

	@echo "Fonts..."
	@if test ! -d $(fonts)/tamzen; then\
		git clone https://github.com/sunaku/tamzen-font $(fonts)/tamzen;\
	fi;
	@mkdir -p ~/.fonts
	@ln -fs $(fonts)/tamzen/*.bdf ~/.fonts/
	@ln -fs $(fonts)/envypn/*.pcf ~/.fonts/

zsh:

	@echo "Zsh..."
	@if test -d ~/.oh-my-zsh; then\
		ln -fs $(zsh)/stayrad.zsh-theme ~/.oh-my-zsh/themes/stayrad.zsh-theme;\
	fi;

tmux:

	@echo "Tmux..."
	@ln -fs $(tmux)/tmux.conf ~/.tmux.conf

irrsi:

	@echo "Irssi..."
	@rm -rf ~/.irssi
	@ln -fs $(irssi) ~/.irssi

vim:

	@echo "Vim..."
	@mkdir -p $(vim)/tmp
	@mkdir -p $(vim)/undo

	@ln -fs $(vim)/vimrc ~/.vimrc
	@if test ! -d ~/.vim; then\
		ln -fs $(vim) ~/.vim;\
	fi;

	@if test ! -d $(vim)/bundle/neobundle.vim; then\
		git clone https://github.com/Shougo/neobundle.vim.git $(vim)/bundle/neobundle.vim;\
	fi;

vimperator:

	@echo "Vimperator..."
	@ln -fs $(ffox)/vimperatorrc ~/.vimperatorrc

dev:

	@echo "Dev..."
	@ln -fs $(dev)/jshintrc ~/.jshintrc

.PHONY: check crux osx apps cmus feh fonts zsh tmux irssi vim vimperator dev
