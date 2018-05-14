SHELL := /bin/bash

apps := $(CURDIR)/apps

apps: zsh tmux vim fasd urlview weechat

.PHONY: apps zsh tmux vim fasd urlview weechat

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
		export TMUX_PLUGIN_MANAGER_PATH '$HOME/.tmux/plugins/';\
		mkdir -p ~/.tmux/plugins;\
		git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm;\
		~/.tmux/plugins/tpm/bin/install_plugins;\
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

weechat:

	@echo "weechat..."
	@if test -f ~/.weechat/passphrase_file; then\
		mv ~/.weechat/passphrase_file $(apps)/weechat/passphrase_file;\
		rm -rf ~/.weechat;\
	fi;
	@if test ! -d ~/.weechat; then\
		ln -fs $(apps)/weechat ~/.weechat;\
	fi;
	@if test ! -f ~/.weechat/python/autoload/wee_slack.py; then\
		mkdir -p ~/.weechat/python/autoload;\
		mkdir -p ~/.weechat/perl/autoload;\
		wget 'https://raw.githubusercontent.com/wee-slack/wee-slack/master/wee_slack.py' -O ~/.weechat/python/autoload/wee_slack.py;\
		wget 'https://raw.githubusercontent.com/de-vri-es/weechat-autosort/master/autosort.py' -O ~/.weechat/python/autoload/autosort.py;\
		wget 'https://raw.githubusercontent.com/keith/edit-weechat/master/edit.py' -O ~/.weechat/python/autoload/edit.py;\
		wget 'https://raw.githubusercontent.com/weechat/scripts/master/python/go.py' -O ~/.weechat/python/autoload/go.py;\
		wget 'https://raw.githubusercontent.com/weechat/scripts/master/perl/colorize_lines.pl' -O ~/.weechat/perl/autoload/colorize_lines.pl;\
	fi;
