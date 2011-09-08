.SUFFIXES: .symlink

PREFIX	:= ~/
SRCS	:= $(basename $(wildcard ./**/*.symlink))
CONF	:= $(PREFIX).dotfilesrc
LN	:= ln -fFs
T	:="	"

all:	install-srcs \
	install-conf \
	update-submodules


install-srcs:
	@echo "ln: symlink"
	@for file in $(SRCS); do \
		echo $(T)"ln: "$$file".symlink -> "$(PREFIX).$${file##*/}; \
		$(LN) $(CURDIR)$$file.symlink $(PREFIX).$${file##*/}; \
	done

install-conf:
	@echo "make: rcfile"
	@touch $(CONF)
	@echo "export="$(CURFIR) >> $(CONF)
	@echo $(T)"write: "$(CONF)

clean-conf:
	@echo "rm: config"
	@$(RM) $(CONF)
	@echo $(T)"rm: "$(CONF)

update-submodules:
	@@if [ -d .git ]; then \
		if git submodule status | grep -q -E '^-'; then \
			git submodule update --init --recursive; \
		else \
			git submodule update --init --recursive --merge; \
		fi; \
	fi;

pull-submodules:
	@@git submodule foreach "git pull \$$(git config remote.origin.url)"
	@@git submodule summary

pull:	pull_submodules
	@@git pull ${REMOTE} ${BRANCH}

clean:	clean-srcs \
	clean-conf

clean-srcs:
	@echo "rm: symlink"
	@for file in $(SRCS); do \
		rm -rf $(PREFIX).$${file##*/}; \
		echo $(T)"rm: "$(PREFIX).$${file##*/}; \
	done

help:
	@echo "usage:	make"
	@echo "available targets are:"
	@echo "	intsall			: install all"
	@echo "	clean			: uninstall all"
	@echo "	submodule-update	: update submodule"
	@echo "	help			: show this text"

.PHONY: all core backup install package clean pull pull-submodules update-submodules
