# config
os := osx

# paths
dir   := $(CURDIR)
bar   := $(dir)/Bar
bin   := $(dir)/Bin/$(os)
mutt  := $(dir)/Mutt
penta := $(dir)/Pentadactyl
term  := $(dir)/Terminal
vim   := $(dir)/Vim
wm    := $(dir)/BSPWM
other := $(dir)/Other
fonts := $(dir)/Fonts

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
	@if test -f ~/.muttrc; then echo ".muttrc exists"; fi;
	@if test -f ~/.pentadactylrc; then echo ".pentadactylrc exists"; fi;
	@if test -f ~/.Xresources; then echo ".Xresources exists"; fi;
	@if test -f ~/.zshrc; then echo ".zshrc exists"; fi;
	@if test -f ~/.xinitrc; then echo ".xinitrc exists"; fi;
	@if test -f ~/.Xmodmap; then echo ".Xmodmap exists"; fi;



# Be very careful when running this
uninstall:
	rm -f ~/.bar
	rm -f ~/.bin ~/.cdmrc
	rm -f ~/.mutt ~/.muttrc
	rm -f ~/.pentadactylrc
	rm -f ~/.terminal ~/.Xresources ~/.zshrc ~/.oh-my-zsh/themes/w0ng.zsh-theme
	rm -f ~/.vim ~/.vimrc
	rm -f ~/.bspwm ~/.xinitrc ~/.Xmodmap


# Should only be run once
install:

# Bar
	test -d ~/.bar || ln -s $(bar) ~/.bar
	@if test -d ~/Github/bar; then ln -sf $(bar)/config.h ~/Github/bar/config.h; fi;

# Bin
	test -d ~/.bin || ln -s $(bin) ~/.bin

# Mutt
	cp $(mutt)/_muttrc $(mutt)/muttrc
	cp $(mutt)/mutt/_stayradiated.account $(mutt)/mutt/stayradiated.account
	cp $(mutt)/mutt/_czabania.account $(mutt)/mutt/czabania.account
	ln -fs $(mutt)/muttrc ~/.muttrc
	test -d ~/.mutt || ln -s $(mutt)/mutt ~/.mutt

# Pentadactyl
	ln -fs $(penta)/pentadactylrc ~/.pentadactylrc

# Terminal
	ln -fs $(term)/Xresources ~/.Xresources	
	ln -fs $(term)/zsh/zshrc ~/.zshrc
	ln -fs $(term)/zsh/w0ng.zsh-theme ~/.oh-my-zsh/themes/w0ng.zsh-theme
	test -d ~/.terminal || ln -s $(term) ~/.terminal

# VIM
	mkdir -p $(vim)/tmp
	ln -fs $(vim)/vimrc ~/.vimrc
	test -d ~/.vim || ln -s $(vim) ~/.vim
	
	@if test ! -d $(vim)/bundle/vundle; then\
		git clone https://github.com/gmarik/vundle.git $(vim)/bundle/vundle;\
	fi;

# Window Manager
	test -d ~/.bspwm || ln -s $(wm) ~/.bspwm
	ln -fs $(wm)/xinitrc ~/.xinitrc
	ln -fs $(wm)/Xmodmap ~/.Xmodmap

# Other files
	ln -sf $(other)/cdmrc ~/.cdmrc

# Fonts
	@if test ! -d $(fonts)/tamzen; then\
		git clone https://github.com/sunaku/tamzen-font $(fonts)/tamzen;\
	fi;
	@if test ! -d $(fonts)/sm4tik; then\
		git clone https://github.com/sunaku/sm4tik-font.git $(fonts)/sm4tik;\
	fi;
	mkdir -p ~/.fonts
	ln -fs $(fonts)/tamzen/*.bdf ~/.fonts/
	ln -fs $(fonts)/sm4tik/*.bdf ~/.fonts/
	mkfontdir $(fonts)
	xset fp rehash
