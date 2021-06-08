SHELL := /bin/bash

apps := $(CURDIR)/apps

apps: aerc anki beets bspwm charles dbxcli docker exeditor expo firefox gcloud git gh khal logview mitmproxy mycli ngrok npm ranger ssh sxhkd tmux urlview vdirsyncer vim weechat xinput x11 xournalpp xscreensaver zoom zsh

aerc:

	@echo "aerc..."
	@mkdir -p ~/.config/aerc
	@ln -fs "$(apps)/aerc/accounts.conf.enc" ~/.config/aerc/accounts.conf
	@ln -fs "$(apps)/aerc/aerc.conf" ~/.config/aerc/aerc.conf
	@ln -fs "$(apps)/aerc/binds.conf" ~/.config/aerc/binds.conf
	@chmod 600 ~/.config/aerc/accounts.conf

anki:

	@echo "anki..."
	@mkdir -p ~/.local/share/Anki2
	@ln -fs "$(apps)/anki/prefs21.db.enc" ~/.local/share/Anki2/prefs21.db

beets:

	@echo "beets..."
	@mkdir -p ~/.config/beets
	@ln -fs "$(apps)/beets/config.yaml" ~/.config/beets/config.yaml

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

docker:

	@echo "docker..."
	@mkdir -p ~/.docker
	@ln -fs "$(apps)/docker/config.json.enc" ~/.docker/config.json


exeditor:

	@echo "exeditor..."
	@mkdir -p ~/.config/withexeditorhost/config/firefox
	@ln -fs "$(apps)/exeditor/firefox/editorconfig.json" ~/.config/withexeditorhost/config/firefox/editorconfig.json
	@ln -fs "$(apps)/exeditor/firefox/withexeditorhost.sh" ~/.config/withexeditorhost/config/firefox/withexeditorhost.sh

expo:

	@echo "expo..."
	@mkdir -p ~/.expo
	@ln -fs "$(apps)/expo/state.json.enc" ~/.expo/state.json

firefox:

	@echo "firefox..."
	@if command -v xdg-settings; then \
		xdg-settings set default-web-browser firefox.desktop; \
	fi


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

gh:

	@echo "gh..."
	@mkdir -p ~/.config/gh
	@ln -fs "$(apps)/gh/config.yml" ~/.config/gh/config.yml
	@ln -fs "$(apps)/gh/hosts.yml.enc" ~/.config/gh/hosts.yml
	@ln -fs "$(apps)/gh/state.yml" ~/.config/gh/state.yml

khal:

	@echo "khal..."
	@mkdir -p ~/.config/khal
	@ln -fs "$(apps)/khal/config" ~/.config/khal/config
	@if test ! -d ~/.local/share/khal; then\
		ln -fs "$(apps)/khal/state" ~/.local/share/khal;\
	fi

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

ssh:

	@echo "ssh..."
	@mkdir -p ~/.ssh
	@ln -fs "$(apps)/ssh/config.enc" ~/.ssh/config
	@ln -fs "$(apps)/ssh/known_hosts" ~/.ssh/known_hosts

	@ln -fs "$(apps)/ssh/bastion.enc" ~/.ssh/bastion
	@chmod 600 ~/.ssh/bastion

	@ln -fs "$(apps)/ssh/datacrunch.enc" ~/.ssh/datacrunch
	@ln -fs "$(apps)/ssh/datacrunch.pub" ~/.ssh/datacrunch.pub
	@chmod 600 ~/.ssh/datacrunch

	@ln -fs "$(apps)/ssh/george.enc" ~/.ssh/george
	@ln -fs "$(apps)/ssh/george.pub" ~/.ssh/george.pub
	@chmod 600 ~/.ssh/george

	@ln -fs "$(apps)/ssh/github.enc" ~/.ssh/github
	@ln -fs "$(apps)/ssh/github.pub" ~/.ssh/github.pub
	@chmod 600 ~/.ssh/github

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

vdirsyncer:

	@echo "vdirsyncer..."
	@if test ! -d ~/.vdirsyncer; then\
		ln -fs "$(apps)/vdirsyncer" ~/.vdirsyncer;\
	fi

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
		wget 'https://raw.githubusercontent.com/wee-slack/wee-slack/master/weemoji.json' -O ~/.weechat/weemoji.json;\
		wget 'https://raw.githubusercontent.com/de-vri-es/weechat-autosort/master/autosort.py' -O ~/.weechat/python/autoload/autosort.py;\
		wget 'https://raw.githubusercontent.com/keith/edit-weechat/master/edit.py' -O ~/.weechat/python/autoload/edit.py;\
		wget 'https://raw.githubusercontent.com/weechat/scripts/master/python/go.py' -O ~/.weechat/python/autoload/go.py;\
		wget 'https://raw.githubusercontent.com/weechat/scripts/master/perl/colorize_lines.pl' -O ~/.weechat/perl/autoload/colorize_lines.pl;\
	fi;

xinput:

	@echo "xinput..."
	@if command -v xinput; then \
		xinput enable 'ELAN0672:00 04F3:3187 Touchpad'; \
		xinput set-prop 'ELAN0672:00 04F3:3187 Touchpad' 'libinput Disable While Typing Enabled' 0; \
		# xinput disable 'ELAN0672:00 04F3:3187 Touchpad'; \
		xinput set-prop 'TPPS/2 Elan TrackPoint' 'libinput Accel Speed' 0.7; \
	fi

x11:

	@echo "x11..."
	@ln -fs "$(apps)/x11/xinitrc" ~/.xinitrc

xournalpp:

	@echo "xournalpp..."
	@if test ! -d ~/.xournalpp; then\
		mkdir -p ~/.xournalpp;\
	fi
	@ln -fs "$(apps)/xournalpp/colornames.ini" ~/.xournalpp/colornames.ini
	@ln -fs "$(apps)/xournalpp/settings.xml" ~/.xournalpp/settings.xml
	@ln -fs "$(apps)/xournalpp/toolbar.ini" ~/.xournalpp/toolbar.ini

xscreensaver:

	@echo "x11..."
	@ln -fs "$(apps)/xscreensaver/config" ~/.xscreensaver
	
zoom:

	@echo "zoom..."
	@mkdir -p ~/.zoom/data
	@ln -fs "$(apps)/zoom/zoomus.db.enc" ~/.zoom/data/zoomus.enc.db
	@ln -fs "$(apps)/zoom/zoomus.conf.enc" ~/.config/zoomus.conf

zsh:

	@echo "zsh..."
	@ln -fs "$(apps)/zsh/zshrc" ~/.zshrc
