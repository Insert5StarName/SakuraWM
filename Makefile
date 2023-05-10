# SakuraWM - Sakura Window Manager
# See LICENSE file for copyright and license details.

include config.mk

SRC = drw.c sakura.c util.c
OBJ = ${SRC:.c=.o}

all: options sakura

options:
	@echo sakura build options:
	@echo "CFLAGS   = ${CFLAGS}"
	@echo "LDFLAGS  = ${LDFLAGS}"
	@echo "CC       = ${CC}"

.c.o:
	${CC} -c ${CFLAGS} $<

${OBJ}: config.h config.mk

config.h:
	cp config.def.h $@

sakura: ${OBJ}
	${CC} -o $@ ${OBJ} ${LDFLAGS}

clean:
	rm -f sakura ${OBJ} sakura-${VERSION}.tar.gz

dist: clean
	mkdir -p sakura-${VERSION}
	cp -R LICENSE Makefile README config.def.h config.mk\
		sakura.1 drw.h util.h ${SRC} sakura.png transient.c sakura-${VERSION}
	tar -cf sakura-${VERSION}.tar sakura-${VERSION}
	gzip sakura-${VERSION}.tar
	rm -rf sakura-${VERSION}

install: all
	mkdir -p ${DESTDIR}${PREFIX}/bin
	cp -f sakura ${DESTDIR}${PREFIX}/bin
	chmod 755 ${DESTDIR}${PREFIX}/bin/sakura
	mkdir -p ${DESTDIR}${MANPREFIX}/man1
	sed "s/VERSION/${VERSION}/g" < sakura.1 > ${DESTDIR}${MANPREFIX}/man1/sakura.1
	chmod 644 ${DESTDIR}${MANPREFIX}/man1/sakura.1

uninstall:
	rm -f ${DESTDIR}${PREFIX}/bin/sakura\
		${DESTDIR}${MANPREFIX}/man1/sakura.1

.PHONY: all options clean dist install uninstall
