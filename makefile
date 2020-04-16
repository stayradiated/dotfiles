SHELL := /bin/bash

apps := $(CURDIR)/apps

apps: anki bspwm charles dbxcli gcloud git hub logview mitmproxy mycli ngrok npm ranger safe-rm ssh sxhkd tmux urlview vim weechat x11 zsh

anki:

	@echo "anki..."
	@mkdir -p ~/.local/share/Anki2
	@ln -fs "$(apps)/anki/prefs21.db.enc" ~/.local/share/Anki2/prefs21.db

bspwm:

	@echo "bspwm..."
	@mkdir -p ~/.config/bspwm
	@ln -fs "$(apps)/bspwm/bspwmrc" ~/.config/bspwm/bspwmrc

charles:

	@echo "charles..."
	@ln -fs "$(apps)/charles/config.enc" ~/.charles.config

	@mkdir -p ~/.charles
	@ln -fs "$(apps)/charles/passwords.keystore.enc" ~/.charles/passwords.keystore

	@mkdir -p ~/.charles/ca
	@ln -fs "$(apps)/charles/ca/charles-proxy-ssl-proxying-certificate.cer.enc" ~/.charles/ca/charles-proxy-ssl-proxying-certificate.cer
	@ln -fs "$(apps)/charles/ca/charles-proxy-ssl-proxying-certificate.pem.enc" ~/.charles/ca/charles-proxy-ssl-proxying-certificate.pem
	@ln -fs "$(apps)/charles/ca/keystore.enc" ~/.charles/ca/keystore

	@mkdir -p ~/.charles/certs
	@ln -fs "$(apps)/charles/certs/4b411e9366c230b6b9cc8a1e8561f1a836c377fd-5726138436715021819600663311331114832-1586977469132-907e542cbcaa923b54802c0b5fb18637ddfc6027.keystore.enc" ~/.charles/certs/4b411e9366c230b6b9cc8a1e8561f1a836c377fd-5726138436715021819600663311331114832-1586977469132-907e542cbcaa923b54802c0b5fb18637ddfc6027.keystore
	@ln -fs "$(apps)/charles/certs/c06a3d993539b85437ecf1e39c570e717221b92b-303982394985508397538159550000603141616-1586977469132-fd696aea360ab5fb06683b9494636180fc57da82.keystore.enc" ~/.charles/certs/c06a3d993539b85437ecf1e39c570e717221b92b-303982394985508397538159550000603141616-1586977469132-fd696aea360ab5fb06683b9494636180fc57da82.keystore

	@mkdir -p ~/.charles/profiles
	@ln -fs "$(apps)/charles/profiles/default.cfg.xml.enc" ~/.charles/profiles/default.cfg.xml

charles-import:
		
	@echo "grabbing charles config..."
	@cp ~/.charles.config "$(apps)/charles/config.enc"
	@cp ~/.charles/profiles/default.cfg.xml "$(apps)/charles/profiles/default.cfg.xml.enc"

dbxcli:

	@echo "dbxcli..."
	@mkdir -p ~/.config/dbxcli
	@ln -fs "$(apps)/dbxcli/auth.json.enc" ~/.config/dbxcli/auth.json

gcloud:

	@echo "gcloud..."
	@mkdir -p ~/.config/gcloud/configurations
	@ln -fs "$(apps)/gcloud/access_tokens.db.enc" ~/.config/gcloud/access_tokens.db
	@ln -fs "$(apps)/gcloud/active_config.enc" ~/.config/gcloud/active_config
	@ln -fs "$(apps)/gcloud/configurations/config_default.enc" ~/.config/gcloud/configurations/config_default
	@ln -fs "$(apps)/gcloud/credentials.db.enc" ~/.config/gcloud/credentials.db

git:

	@echo "git..."
	@ln -fs "$(apps)/git/config" ~/.gitconfig

hub:

	@echo "hub..."
	@mkdir -p ~/.config
	@ln -fs "$(apps)/hub/hub.enc" ~/.config/hub

logview:

	@echo "logview..."
	@mkdir -p ~/.config/logview
	@ln -fs "$(apps)/logview/config.json.enc" ~/.config/logview/config.json

mitmproxy:

	@echo "mitmproxy..."
	@mkdir -p ~/.mitmproxy
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
	@mkdir -p ~/.ngrok2
	@ln -fs "$(apps)/ngrok/ngrok.yml.enc" ~/.ngrok2/ngrok.yml

npm:

	@echo "npm..."
	@ln -fs "$(apps)/npm/npmrc.enc" ~/.npmrc

ranger:

	@echo "ranger..."
	@mkdir -p ~/.config/ranger
	@ln -fs "$(apps)/ranger/rc.conf" ~/.config/ranger/rc.conf
	@ln -fs "$(apps)/ranger/rifle.conf" ~/.config/ranger/rifle.conf

safe-rm:

	@echo "safe-rm..."
	@ln -fs "$(apps)/safe-rm/config" ~/.config/safe-rm

ssh:

	@echo "ssh..."
	@mkdir -p ~/.ssh
	@ln -fs "$(apps)/ssh/config.enc" ~/.ssh/config
	@ln -fs "$(apps)/ssh/known_hosts" ~/.ssh/known_hosts

	@ln -fs "$(apps)/ssh/george.enc" ~/.ssh/george
	@ln -fs "$(apps)/ssh/george.pub" ~/.ssh/george.pub
	@chmod 600 ~/.ssh/george

	@ln -fs "$(apps)/ssh/hetzner.enc" ~/.ssh/hetzner
	@ln -fs "$(apps)/ssh/hetzner.pub" ~/.ssh/hetzner.pub
	@chmod 600 ~/.ssh/hetzner

	@ln -fs "$(apps)/ssh/id_rsa.enc" ~/.ssh/id_rsa
	@ln -fs "$(apps)/ssh/id_rsa.pub" ~/.ssh/id_rsa.pub
	@chmod 600 ~/.ssh/id_rsa

	@ln -fs "$(apps)/ssh/sshkey.enc" ~/.ssh/sshkey
	@ln -fs "$(apps)/ssh/sshkey.pub" ~/.ssh/sshkey.pub
	@chmod 600 ~/.ssh/sshkey

sxhkd:

	@echo "sxhkd..."
	@mkdir -p ~/.config/sxhkd
	@ln -fs "$(apps)/sxhkd/sxhkdrc" ~/.config/sxhkd/sxhkdrc

tmux:

	@echo "tmux..."
	@ln -fs "$(apps)/tmux/tmux.conf" ~/.tmux.conf
	@if test ! -d ~/.tmux/plugins/tpm; then\
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
	@if test ! -d ~/.weechat; then\
		ln -fs "$(apps)/weechat" ~/.weechat;\
	fi;

	@ln -fs "$(apps)/weechat/passphrase_file.enc" ~/.weechat/passphrase_file

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
	@ln -fs "$(apps)/zsh/zshrc" ~/.zshrc
