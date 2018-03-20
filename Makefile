all::

# https://emacs-china.org/
emacs-china:
	@printf "Generating packages\n"
	emacs -Q --batch -L . -l emacswiki-elpa -f emacswiki-elpa
	@printf "Syncing for web server\n"
	rsync -av packages/ /var/elpa/emacswiki
	@printf "Syncing for rsync\n"
	rsync -av packages/ /var/elpa-packages/emacswiki
