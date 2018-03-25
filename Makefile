# https://emacs-china.org/
all: packages sync badge

packages:
	@printf "Generating packages\n"
	emacs -Q --batch -L . -l emacswiki-elpa -f emacswiki-elpa

sync:
	@printf "Syncing for web server\n"
	rsync -av packages/ /var/elpa/emacswiki
	@printf "Syncing for rsync\n"
	rsync -av packages/ /var/elpa-packages/emacswiki

badge:
	curl -fsSkL --retry 9 --retry-delay 9 "https://img.shields.io/badge/Last_Update-$(shell date -u | sed 's| |_|g' )-brightgreen.svg" -o last-update.svg
	cp last-update.svg /var/elpa/emacswiki
