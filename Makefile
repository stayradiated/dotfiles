
dir   := $(CURDIR)
bar   := $(dir)/Bar
bin   := $(dir)/Bin
mutt  := $(dir)/Mutt
penta := $(dir)/Pentadactyl
term  := $(dir)/Terminal
vim   := $(dir)/Vim
wm    := $(dir)/BSPWM

# Be very careful when running this
uninstall:
	rm -f ~/.bar
	rm -f ~/.bin ~/.cdmrc
	rm -f ~/.mutt ~/.muttrc
	rm -f ~/.pentadactylrc
	rm -f ~/.terminal ~/.Xresources ~/.zshrc ~/.oh-my-zsh/themes/w0ng.zsh-theme
	rm -f ~/.vim ~/.vimrc
	rm -f ~/.bspwm ~/.xinitrc ~/.Xmodmap

install:

	# Bar
	test -d ~/.bar || ln -s $(bar) ~/.bar

	# Bin
	test -d ~/.bin || ln -s $(bin) ~/.bin
	ln -sf $(bin)/cdmrc ~/.cdmrc

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

	# Window Manager
	test -d ~/.bspwm || ln -s $(wm) ~/.bspwm
	ln -fs $(wm)/xinitrc ~/.xinitrc
	ln -fs $(wm)/Xmodmap ~/.Xmodmap

