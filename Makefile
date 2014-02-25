# config
os := osx

# paths
dir   := $(CURDIR)
bar   := $(dir)/Bar
bin   := $(dir)/Bin
irssi := $(dir)/Irssi
mutt  := $(dir)/Mutt
ffox  := $(dir)/Firefox
term  := $(dir)/Terminal
tmux  := $(dir)/Tmux
subl  := $(dir)/Sublime
vim   := $(dir)/Vim
wm    := $(dir)/BSPWM
other := $(dir)/Other
fonts := $(dir)/Fonts
music := $(dir)/Music

ifeq ($(os), osx)
	subl_os := ~/Library/Application\ Support/Sublime\ Text\ 3
else
	subl_os := ~/.config/sublime-text-3
endif

# Checks to see if any files are going to be overwritten
check:

	@echo 'Checking for files that will be overwritten'

# Folders
	@if test -d ~/.bar; then echo ".bar exists"; fi;
	@if test -d ~/.bin; then echo ".bin exists"; fi;
	@if test -d ~/.bin; then echo ".bin exists"; fi;
	@if test -d ~/.mutt; then echo ".mutt exists"; fi;
	@if test -d ~/.terminal; then echo ".terminal exists"; fi;
	@if test -d ~/.vim; then echo ".vim exists"; fi;
	@if test -d ~/.vimrc; then echo ".vimrc exists"; fi;
	@if test -d ~/.bspwm; then echo ".bspwm exists"; fi;

# Files
	@if test -f ~/.cdmrc; then echo ".cdmrc exists"; fi;
	@if test -f ~/.tmux.conf; then echo ".tmux.conf exists"; fi;
	@if test -f ~/.muttrc; then echo ".muttrc exists"; fi;
	@if test -f ~/.vimperatorrc; then echo ".vimperatorrc exists"; fi;
	@if test -f ~/.Xresources; then echo ".Xresources exists"; fi;
	@if test -f ~/.zshrc; then echo ".zshrc exists"; fi;
	@if test -f ~/.xinitrc; then echo ".xinitrc exists"; fi;
	@if test -f ~/.Xmodmap; then echo ".Xmodmap exists"; fi;
	@if test -f ~/.fehbg; then echo ".fehbg exists"; fi;



# Be very careful when running this
uninstall:

# Folders
	rm -rf ~/.bin

# Links
	rm -f ~/.bar
	rm -f ~/.cdmrc
	rm -f ~/.mutt ~/.muttrc
	rm -f ~/.vimperatorrc
	rm -f ~/.tmux.conf
	rm -f ~/.terminal ~/.Xresources ~/.zshrc ~/.oh-my-zsh/themes/stayrad.zsh-theme
	rm -f ~/.vim ~/.vimrc
	rm -f ~/.bspwm ~/.xinitrc ~/.Xmodmap


# Should only be run once
arch:

# Misc.
	@echo "Misc..."
	@ln -sf $(other)/cdmrc ~/.cdmrc
	@ln -sf $(other)/fehbg ~/.fehbg
	@ln -fs $(term)/Xresources ~/.Xresources

# Bar
	@echo "Bar..."
	@test -d ~/.bar || ln -s $(bar) ~/.bar
	@if test -d ~/Github/bar; then ln -sf $(bar)/config.h ~/Github/bar/config.h; fi;

# Bin
	@echo "Bin..."
	@rm -r ~/.bin
	@mkdir  ~/.bin
	@if test -d $(bin)/$(os); then ln -s $(bin)/$(os)/* ~/.bin/; fi;
	@ln -s $(bin)/all/* ~/.bin/

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

# Mutt
	@echo "Mutt..."
	@cp $(mutt)/_muttrc $(mutt)/muttrc
	@cp $(mutt)/mutt/_stayradiated.account $(mutt)/mutt/stayradiated.account
	@cp $(mutt)/mutt/_czabania.account $(mutt)/mutt/czabania.account
	@ln -fs $(mutt)/muttrc ~/.muttrc
	@test -d ~/.mutt || ln -s $(mutt)/mutt ~/.mutt

osx:

# Terminal
	@echo "Terminal..."
	@ln -fs $(term)/zsh/zshrc_$(os) ~/.zshrc
	@ln -fs $(term)/zsh/stayrad.zsh-theme ~/.oh-my-zsh/themes/stayrad.zsh-theme
	@test -d ~/.terminal || ln -s $(term) ~/.terminal

# Tmux
	@echo "Tmux..."
	@ln -fs $(tmux)/tmux.conf ~/.tmux.conf

# Irssi
	@echo "Irssi..."
	@rm -r ~/.irssi
	@ln -fs $(irssi) ~/.irssi

# Vim
	@echo "Vim..."
	@mkdir -p $(vim)/tmp
	@mkdir -p $(vim)/undo
	@ln -fs $(vim)/vimrc ~/.vimrc
	@test -d ~/.vim || ln -s $(vim) ~/.vim

	@if test ! -d $(vim)/bundle/neobundle.vim; then\
		git clone https://github.com/Shougo/neobundle.vim.git $(vim)/bundle/neobundle.vim;\
	fi;

# Sublime
	@echo "Sublime Text..."
	@ln -fs $(subl)/Preferences.sublime-settings $(subl_os)/Packages/User/Preferences.sublime-settings
	@ln -fs $(subl)/Default.sublime-keymap $(subl_os)/Packages/User/Default.sublime-keymap
	@ln -fs $(subl)/Package\ Control.sublime-settings $(subl_os)/Packages/User/Package\ Control.sublime-settings

# Vimperator
	@echo "Vimperator..."
	@ln -fs $(ffox)/vimperatorrc ~/.vimperatorrc

# NCMPCPP
	@echo "NCMPCPP..."
	@mkdir -p ~/.ncmpcpp
	@ln -fs $(music)/ncmpcpp_config ~/.ncmpcpp/config

# Window Manager
	@echo "BSPWM..."
	@test -d ~/.bspwm || ln -s $(wm) ~/.bspwm
	@ln -fs $(wm)/xinitrc ~/.xinitrc
	@ln -fs $(wm)/Xmodmap ~/.Xmodmap

	@echo "SXHKD..."
	@cp $(wm)/_sxhkdrc $(wm)/sxhkdrc
	@if test $(os) = "osx"; then\
		sed -i.bak 's/super/mod2/g' $(wm)/sxhkdrc;\
		sed -i.bak 's/alt/mod1/g' $(wm)/sxhkdrc;\
		rm $(wm)/sxhkdrc.bak;\
	fi;


