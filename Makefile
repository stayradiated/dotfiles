
# paths
dir   := $(CURDIR)

osx   := $(dir)/OSX
cbng  := $(dir)/CrunchBang
apps  := $(dir)/Shared

bar   := $(cbng)/Bar

irssi := $(apps)/Irssi
mutt  := $(apps)/Mutt
ffox  := $(apps)/Firefox
term  := $(apps)/Terminal
tmux  := $(apps)/Tmux
vim   := $(apps)/Vim
feh   := $(apps)/Feh
fonts := $(apps)/Fonts
music := $(apps)/Music

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



# ============================================================================
# CRUNCHBANG
# ============================================================================

crunchbang:

# WM
	@echo "WM..."
	@ln -fs $(cbng)/WM/xinitrc ~/.xinitrc
	@ln -fs $(cbng)/WM/Xmodmap ~/.Xmodmap

	@mkdir -p ~/.config/bspwm
	@ln -fs $(cbng)/WM/bspwmrc ~/.config/bspwm/bspwmrc

	@mkdir -p ~/.config/sxhkd
	@ln -fs $(cbng)/WM/sxhkdrc ~/.config/sxhkd/sxhkdrc

# Terminal
	@echo "Terminal..."
	@ln -fs $(cbng)/Terminal/zshrc ~/.zshrc
	@ln -fs $(cbng)/Terminal/Xresources ~/.Xresources



# ============================================================================
# OSX
# ============================================================================

osx:

# WM
	@echo "WM..."
	@ln -fs $(osx)/WM/xinitrc ~/.xinitrc

	@mkdir -p ~/.config/bspwm
	@ln -fs $(osx)/WM/bspwmrc ~/.config/bspwm/bspwmrc

	@mkdir -p ~/.config/sxhkd
	@ln -fs $(osx)/WM/sxhkdrc ~/.config/sxhkd/sxhkdrc

# Terminal
	@echo "Terminal..."
	@ln -fs $(osx)/Terminal/zshrc ~/.zshrc
	@ln -fs $(osx)/Terminal/Xresources ~/.Xresources



# ============================================================================
# SHARED APPS
# ============================================================================

shared:

# Fonts
	@echo "Fonts..."
	@if test ! -d $(fonts)/tamzen; then\
		git clone https://github.com/sunaku/tamzen-font $(fonts)/tamzen;\
	fi;
	@if test ! -d $(fonts)/sm4tik; then\
		git clone https://github.com/sunaku/sm4tik-font.git $(fonts)/sm4tik;\
	fi;
	@mkdir -p ~/.fonts
	@ln -fs $(fonts)/tamzen/*.bdf ~/.fonts/
	@ln -fs $(fonts)/sm4tik/*.bdf ~/.fonts/

# Terminal
	@echo "Terminal..."
	@ln -fs $(term)/zsh/stayrad.zsh-theme ~/.oh-my-zsh/themes/stayrad.zsh-theme

# Tmux
	@echo "Tmux..."
	@ln -fs $(tmux)/tmux.conf ~/.tmux.conf

# Irssi
	@echo "Irssi..."
	@rm -rf ~/.irssi
	@ln -fs $(irssi) ~/.irssi

# Vim
	@echo "Vim..."
	@mkdir -p $(vim)/tmp
	@mkdir -p $(vim)/undo

	@ln -fs $(vim)/vimrc ~/.vimrc
	@ln -fs $(vim) ~/.vim

	@if test ! -d $(vim)/bundle/neobundle.vim; then\
		git clone https://github.com/Shougo/neobundle.vim.git $(vim)/bundle/neobundle.vim;\
	fi;

# Vimperator
	@echo "Vimperator..."
	@ln -fs $(ffox)/vimperatorrc ~/.vimperatorrc


.PHONY: check crunchbang osx shared
