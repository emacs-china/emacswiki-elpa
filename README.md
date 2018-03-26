# EmacsWiki ELPA [![Last Update Badge][badge1-link]][badge1-link] [![Total Packages Badge][badge2-link]][badge2-link]

[badge1-link]: https://elpa.emacs-china.org/emacswiki/last-update.svg
[badge2-link]: https://elpa.emacs-china.org/emacswiki/count.svg

EmacsWiki ELPA is an Emacs Lisp Package Archive for packages on [EmacsWiki][emacswiki].

[emacswiki]: https://www.emacswiki.org/

It is available via HTTP, HTTPS and Rsync.

- http://mirrors.tuna.tsinghua.edu.cn/elpa/emacswiki/
- https://mirrors.tuna.tsinghua.edu.cn/elpa/emacswiki/
- `rsync://mirrors.tuna.tsinghua.edu.cn/elpa/emacswiki/`

## `package.el`

`package.el` supports HTTP and HTTPS, you should use HTTPS whenever possible. Adding the following to your Emacs init file such as `~/.emacs.d/init.el`

```elisp
(require 'package)
(add-to-list
 'package-archives
 '("emacswiki" . "https://mirrors.tuna.tsinghua.edu.cn/elpa/emacswiki/") t)
 ```

## Acknowledgments

- [Emacsmirror][emacsmirror] provides metadata and github mirrors for packages on EmacsWiki.
- [MELPA][melpa] provides `package-build.el` for building ELPA from git repositories.
- [Emacs China][emacs-china] provides VPS.
- [清华大学开源软件镜像站][tuna-mirror] provides fast and reliable  mirror service.

[emacsmirror]: https://emacsmirror.net/
[melpa]: https://github.com/melpa/melpa/
[emacs-china]: https://emacs-china.org/
[tuna-mirror]: https://mirrors.tuna.tsinghua.edu.cn/
