PACKAGE=hosts-updater
DPKG=dpkg
DPKG_OPTS=-b
.PHONY: info repo deb

info: deb
	dpkg-deb -I out/*.deb
	dpkg-deb -c out/*.deb

deb:	clean
	rm -Rf build
	mkdir -p out
	cp -r src build
	cp -r DEBIAN build
	mkdir -p build/usr/share/doc/$(PACKAGE) build/usr/share/man/man1
	ronn <$(PACKAGE).1.ronn | gzip -9 >build/usr/share/man/man1/$(PACKAGE).1.gz
	mv build/DEBIAN/copyright build/usr/share/doc/$(PACKAGE)/copyright
	git log | gzip -9 >build/usr/share/doc/$(PACKAGE)/changelog.gz
	chmod -R g-w build
	fakeroot ${DPKG} ${DPKG_OPTS} build out
	rm -Rf build
	lintian -i out/*.deb

repo: deb
	../putinrepo.sh out/*.deb

clean:
	rm -fr out build


