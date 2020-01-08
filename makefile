SHELL := /bin/bash

apps := $(CURDIR)/apps

apps: bspwm git hub logview mitmproxy mycli ngrok npm ranger ssh sxhkd tmux urlview vim weechat x11 zsh

bspwm:

	@echo "bspwm..."
	@ln -fs "$(apps)/bspwm/bspwmrc" ~/.config/bspwm/bspwmrc

git:

	@echo "git..."
	@ln -fs "$(apps)/git/config" ~/.gitconfig

hub:

	@echo "hub..."
	@ln -fs "$(apps)/hub/hub.enc" ~/.config/hub

logview:

	@echo "logview..."
	@ln -fs "$(apps)/logview/config.json.enc" ~/.config/logview/config.json

mitmproxy:

	@echo "mitmproxy..."
	@ln -fs "$(apps)/mitmproxy/mitmproxy-ca-cert.cer.enc" ~/.mitmproxy/mitmproxy-ca-cert.cer
	@ln -fs "$(apps)/mitmproxy/mitmproxy-ca-cert.p12.enc" ~/.mitmproxy/mitmproxy-ca-cert.p12
	@ln -fs "$(apps)/mitmproxy/mitmproxy-ca-cert.pem.enc" ~/.mitmproxy/mitmproxy-ca-cert.pem
	@ln -fs "$(apps)/mitmproxy/mitmproxy-ca.pem.enc" ~/.mitmproxy/mitmproxy-ca.pem
	@ln -fs "$(apps)/mitmproxy/mitmproxy-dhparam.pem.enc" ~/.mitmproxy/mitmproxy-dhparam.pem

mycli:

	@echo "mycli..."
	@ln -fs "$(apps)/mycli/myclirc" ~/.myclirc

ngrok:

	@echo "ngrok..."
	@ln -fs "$(apps)/ngrok/ngrok.yml.enc" ~/.ngrok2/ngrok.yml

npm:

	@echo "npm..."
	@ln -fs "$(apps)/npm/npmrc.enc" ~/.npmrc

ranger:

	@echo "ranger..."
	@ln -fs "$(apps)/ranger/rc.conf" ~/.config/ranger/rc.conf
	@ln -fs "$(apps)/ranger/rifle.conf" ~/.config/ranger/rifle.conf

ssh:

	@echo "ssh..."
	@ln -fs "$(apps)/ssh/config.enc" ~/.ssh/config
	@ln -fs "$(apps)/ssh/george.enc" ~/.ssh/george
	@ln -fs "$(apps)/ssh/george.pub" ~/.ssh/george.pub
	@ln -fs "$(apps)/ssh/hetzner.enc" ~/.ssh/hetzner
	@ln -fs "$(apps)/ssh/hetzner.pub" ~/.ssh/hetzner.pub
	@ln -fs "$(apps)/ssh/id_rsa.enc" ~/.ssh/id_rsa
	@ln -fs "$(apps)/ssh/id_rsa.pub" ~/.ssh/id_rsa.pub
	@ln -fs "$(apps)/ssh/known_hosts" ~/.ssh/known_hosts
	@ln -fs "$(apps)/ssh/sshkey.enc" ~/.ssh/sshkey
	@ln -fs "$(apps)/ssh/sshkey.pub" ~/.ssh/sshkey.pub

sxhkd:

	@echo "sxhkd..."
	@ln -fs "$(apps)/sxhkd/sxhkdrc" ~/.config/sxhkd/sxhkdrc

tmux:

	@echo "tmux..."
	@ln -fs "$(apps)/tmux/tmux.conf" ~/.tmux.conf
	@if test ! -d ~/.tmux/plugins/tpm; then\
		export TMUX_PLUGIN_MANAGER_PATH '$HOME/.tmux/plugins/';\
		mkdir -p ~/.tmux/plugins;\
		git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm;\
		~/.tmux/plugins/tpm/bin/install_plugins;\
	fi;

urlview:

	@echo "urlview...."
	@ln -fs $(apps)/urlview/urlview ~/.urlview

vim:

	@echo "vim..."
	@mkdir -p "$(apps)/vim/dein"
	@mkdir -p "$(apps)/vim/tmp"
	@mkdir -p "$(apps)/vim/undo"

	@if test ! -d ~/.config/nvim; then\
		mkdir -p ~/.config;\
		ln -fs "$(apps)/vim" ~/.config/nvim;\
	fi;
	@if test ! -d $(apps)/vim/dein/repos/github.com/Shougo/dein.vim; then\
		git clone https://github.com/Shougo/dein.vim.git "$(apps)/vim/dein/repos/github.com/Shougo/dein.vim";\
	fi;

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

x11:

	@echo "x11..."
	@ln -fs "$(apps)/x11/xinitrc" ~/.xinitrc

zsh:

	@echo "zsh..."
	@if test ! -d ~/.zprezto; then\
		git clone --recursive https://github.com/stayradiated/prezto.git ~/.zprezto; \
		pushd ~/.zprezto; \
		git remote add upstream https://github.com/sorin-ionescu/prezto; \
		popd; \
	fi;
	@ln -fs ~/.zprezto/runcoms/zlogin    ~/.zlogin
	@ln -fs ~/.zprezto/runcoms/zlogout   ~/.zlogout
	@ln -fs ~/.zprezto/runcoms/zpreztorc ~/.zpreztorc
	@ln -fs ~/.zprezto/runcoms/zprofile  ~/.zprofile
	@ln -fs ~/.zprezto/runcoms/zshenv    ~/.zshenv
	@ln -fs ~/.zprezto/runcoms/zshrc     ~/.zshrc
