all:
	sh dependency_emacs.sh
clean:
	if [ -d .deplist ] ; then rm -r .deplist ; fi
	if [ -d dest ] ; then rm -r dest ; fi

install: all
	cp dest/* ${HOME}/emacs/bin/
