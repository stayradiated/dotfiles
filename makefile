SHELL := /bin/bash

apps := $(CURDIR)/apps

apps: zsh tmux vim fasd urlview

.PHONY: apps zsh tmux vim fasd

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

tmux:

	@echo "Tmux..."
	@if test ! -d ~/.tmux/plugins/tpm; then\
		mkdir -p ~/.tmux/plugins;\
		git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm;\
	fi;
	@ln -fs "$(apps)/tmux/tmux.conf" ~/.tmux.conf

vim:

	@echo "Vim..."
	@mkdir -p "$(apps)/vim/tmp"
	@mkdir -p "$(apps)/vim/undo"

	@if test ! -d ~/.config/nvim; then\
		mkdir -p ~/.config;\
		ln -fs "$(apps)/vim" ~/.config/nvim;\
	fi;
	@if test ! -d $(apps)/vim/dein.vim; then\
		git clone https://github.com/Shougo/dein.vim.git "$(apps)/vim/dein.vim";\
	fi;

fasd:

	@echo "fasd..."
	@ln -fs $(apps)/fasd/fasdrc ~/.fasdrc

urlview:

	@echo "urlview...."
	@ln -fs $(apps)/urlview/urlview ~/.urlview
