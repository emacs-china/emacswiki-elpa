# Unofficial EmacsWiki ELPA

## How to use?

The service is available in both HTTP and HTTPS

- http://elpa.emacs-china.org/emacswiki/
- https://elpa.emacs-china.org/emacswiki/

For example, to use HTTPS, add something like the following to your init file

```elisp
(add-to-list 'package-archives
             '("emacswiki" . "https://elpa.emacs-china.org/emacswiki/"))

```

## How to mirror?

Use `rsync://elpa.emacs-china.org/elpa/emacswiki/`.

## How it works?

See `emacswiki-elpa.el`, it is about 20 lines of code. The ELPA is updated once per day.
