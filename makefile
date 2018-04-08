SHELL := /bin/bash

dir   := $(CURDIR)

apps  := $(dir)/apps

fasd    := $(apps)/fasd
tmux    := $(apps)/tmux
vim     := $(apps)/vim

apps: fasd tmux vim zsh

fasd:
	@echo "fasd..."
	@ln -fs $(fasd)/fasdrc ~/.fasdrc

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
	@ln -fs "$(tmux)/tmux.conf" ~/.tmux.conf

vim:

	@echo "Vim..."
	@mkdir -p "$(vim)/tmp"
	@mkdir -p "$(vim)/undo"

	@if test ! -d ~/.config/nvim; then\
		ln -fs "$(vim)" ~/.config/nvim;\
	fi;
	@if test ! -d $(vim)/dein.vim; then\
		git clone https://github.com/Shougo/dein.vim.git "$(vim)/dein.vim";\
	fi;

.PHONY: apps fasd zsh tmux vim
