# https://emacs-china.org/
.PHONY: all packages sync badge
all: packages sync badge

packages:
	@printf "Generating packages\n"
	emacs -Q --batch -L . -l emacswiki-elpa -f emacswiki-elpa

sync:
	@printf "Syncing for web server\n"
	rsync -av packages/ /var/elpa/emacswiki
	@printf "Syncing for rsync\n"
	rsync -av packages/ /var/elpa-packages/emacswiki

CURL = curl -fsSkL --retry 9 --retry-delay 9

badge:
	@printf "Generating last-update.svg...\n"
	DATE=$(shell date -u | sed 's| |_|g') && \
	$(CURL) "https://img.shields.io/badge/Last_Update-$$DATE-brightgreen.svg" -o last-update.svg && \
	cp last-update.svg /var/elpa/emacswiki/
	@printf "Generating last-update.svg...\n"
	COUNT=$(shell emacs -Q --batch --file packages/archive-contents --eval '(princ (length (cdr (read (current-buffer)))))') && \
	$(CURL) "https://img.shields.io/badge/Total_Packages-$$COUNT-brightgreen.svg" -o count.svg && \
	cp count.svg /var/elpa/emacswiki/
