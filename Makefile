SHELL:=/bin/bash

DESTDIR=

BINDIR=/usr/bin
MANDIR=/usr/share/man/man1
COMPDIR=/etc/bash_completion.d

.PHONY: all ignore install update sync upload stat help pkg pages check-quality

all:
	pod2man certcheck.pod | gzip > certcheck.1.gz
	pod2html --css podstyle.css --index --header certcheck.pod > certcheck.html

install: update

update:
	@install -d -m 0755 -o root -g root $(DESTDIR)/$(MANDIR)
	@install -d -m 0755 -o root -g root $(DESTDIR)/$(COMPDIR)
	@install    -m 0755 -o root -g root certcheck $(DESTDIR)/$(BINDIR)
	@install    -m 0644 -o root -g root certcheck.1.gz $(DESTDIR)/$(MANDIR)
	@install    -m 0644 -o root -g root bash_completion $(DESTDIR)/$(COMPDIR)/certcheck

sync:
	git pull

pkg: all
	./make-package-debian

pages: all pkg
	mkdir -p public/download
	cp -p *.html       public/
	cp -p podstyle.css public/
	cp -p LICENSE.md   public/
	cp -p --no-clobber certcheck_*_all.deb  public/download/
	(cd public/download; ../../only-keep-1pkg-day 'certcheck_*.deb' | tee >(cat 1>&2) | bash)
	(cd public; ln -sf certcheck.html index.html)
	echo '<html><body><h1>Certcheck Debian Package</h1><ul>' > public/download/index.html
	(cd public/download; while read file; do printf '<li><a href="%s">%s</a> (%s)</li>\n' $$file $$file $$(stat -c %y $$file | cut -f 1 -d ' '); done < <(ls -1t *.deb) >> index.html)
	echo '</ul></body></html>' >> public/download/index.html

help:
	@echo "Possibles targets:"
	@echo " * all           : make manual"
	@echo " * install       : complete install"
	@echo " * update        : update install (do not update cron file)"
	@echo " * sync          : sync with official repository"
	@echo " * pkg           : build Debian package"
	@echo " * check-quality : check code quality with shellcheck"

check-quality: ## check code quality with shellcheck
	@shellcheck certcheck
	@shellcheck make-package-debian
	@shellcheck  -e SC2034,SC2207 certcheck.bash_completion
